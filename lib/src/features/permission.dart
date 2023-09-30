import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:polina_gift/src/sample_feature/sample_item_list_view.dart';
import 'package:polina_gift/src/widgets/custom_list_tile.dart';

bool isPermissionGranted = false;

class PermissionScreen extends ConsumerWidget {
  const PermissionScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: null,
      body: Stack(
        children: [
          Opacity(
            opacity: 1,
            child: Container(
              decoration: const BoxDecoration(
                gradient: RadialGradient(
                  center: Alignment.topRight,
                  colors: [
                    Color.fromARGB(255, 105, 9, 201),
                    Color.fromARGB(255, 12, 0, 83),
                  ],
                ),
              ),
            ),
          ),
          Opacity(
            opacity: 0.5,
            child: Container(
              decoration: const BoxDecoration(
                gradient: RadialGradient(
                  center: Alignment.bottomLeft,
                  colors: [
                    Color.fromARGB(255, 105, 9, 201),
                    Color.fromARGB(255, 12, 0, 83),
                  ],
                ),
              ),
            ),
          ),
          Opacity(
            opacity: 0.6,
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color.fromARGB(255, 110, 81, 128),
                    Color.fromARGB(255, 149, 0, 255),
                    Color.fromARGB(255, 110, 81, 128),
                  ],
                ),
              ),
            ),
          ),
          const Center(
            child: Text(
              'Чтобы приложение работало на отлично ему нужны пару разрешений. Тыкни на согласие в окошках, что появятся и дальше перейдём к подарку ',
              style: TextStyle(
                color: Color.fromARGB(255, 255, 255, 220),
                fontSize: 22,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: CustomListTile(
              title: 'Готова тыкать',
              onTap: () async {
                final b = await Permission.camera.request();
                final a = await Permission.microphone.request();
                if (await Permission.camera.isGranted &&
                    await Permission.microphone.isGranted) {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const SampleItemListView(),
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
