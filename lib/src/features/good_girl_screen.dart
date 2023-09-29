import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:polina_gift/src/widgets/custom_list_tile.dart';

import 'how_i_look.dart';

final camerasHolder = FutureProvider<List<CameraDescription>>(
  (ref) async => await availableCameras(),
);

final enterOnCameraScreenHolder = StateProvider<bool>(
  (ref) => false,
);

class GoodGirlButton extends ConsumerWidget {
  const GoodGirlButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isEntered = ref.read(enterOnCameraScreenHolder);
    return CustomListTile(
      title: isEntered ? '💖 Конечно ты! 💖' : 'Кто лучшая девочка?',
      onTap: () {
        showDialog(
          context: context,
          builder: ((context) => const GoodGirlScreen()),
        );
      },
    );
  }
}

class GoodGirlScreen extends ConsumerStatefulWidget {
  const GoodGirlScreen({super.key});

  @override
  ConsumerState<GoodGirlScreen> createState() => _GoodGirlScreenState();
}

class _GoodGirlScreenState extends ConsumerState<GoodGirlScreen> {
  late CameraController controller;
  bool errorState = false;

  @override
  void initState() {
    super.initState();
    final holder = ref.read(camerasHolder);
    try {
      final camera = holder.asData!.value.firstWhere(
          (element) => element.lensDirection == CameraLensDirection.front);
      controller = CameraController(camera, ResolutionPreset.max);

      ref.read(enterOnCameraScreenHolder.notifier).update((state) => true);
      controller.initialize().then((_) {
        if (!mounted) {
          return;
        }
        setState(() {});
      }).catchError((Object e) {
        if (e is CameraException) {
          switch (e.code) {
            case 'CameraAccessDenied':
              // Handle access errors here.
              break;
            default:
              // Handle other errors here.
              break;
          }
        }
        errorState = true;
      });
    } catch (e) {
      errorState = true;
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.all(0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: SizedBox(
            height: MediaQuery.of(context).size.height / 6 * 5,
            child: !controller.value.isInitialized
                ? const Center(
                    child: CircularProgressIndicator(color: Colors.deepPurple),
                  )
                : errorState
                    ? const CustomListTile(
                        title: 'Блин, чёт сломалось. Перезапусти-ка приложение',
                      )
                    : Column(
                        children: [
                          Expanded(
                            child: CameraPreview(controller),
                          ),
                          const HowIlookButton(),
                        ],
                      ),
          ),
        ),
      ),
    );
  }
}
