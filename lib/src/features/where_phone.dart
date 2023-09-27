import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../widgets/custom_list_tile.dart';

final wherePhoneState = StateProvider<int>((ref) => 0);

class WherePhoneButton extends ConsumerWidget {
  const WherePhoneButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(wherePhoneState);
    final title = state == 0
        ? 'Где мой телефон?!'
        : state == 1
            ? 'Надо поискать'
            : 'Так вот же он, в руках!';
    return AnimatedCrossFade(
      duration: const Duration(milliseconds: 500),
      firstCurve: Curves.easeInExpo,
      crossFadeState:
          state != 1 ? CrossFadeState.showFirst : CrossFadeState.showSecond,
      firstChild: CustomListTile(
        title: title,
        onTap: () async {
          if (state == 0) {
            ref.read(wherePhoneState.notifier).update((state) => 1);
            await Future.delayed(const Duration(seconds: 3));
            ref.read(wherePhoneState.notifier).update((state) => 2);
            await Future.delayed(const Duration(seconds: 3, milliseconds: 500));
            ref.read(wherePhoneState.notifier).update((state) => 0);
          }
        },
      ),
      secondChild: CustomListTile(
        title: title,
        child: const CircularProgressIndicator(
          backgroundColor: Colors.deepPurple,
        ),
      ),
    );
  }
}
