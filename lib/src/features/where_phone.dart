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
            ? 'Хм, ищем...'
            : 'Так вот же он, в руках!';
    return CustomListTile(
      title: title,
      child: state == 1 ? CircularProgressIndicator() : null,
      onTap: () async {
        if (state == 0) {
          ref.read(wherePhoneState.notifier).update((state) => 1);
          await Future.delayed(const Duration(seconds: 1));
          ref.read(wherePhoneState.notifier).update((state) => 2);
          await Future.delayed(const Duration(seconds: 1, milliseconds: 500));
          ref.read(wherePhoneState.notifier).update((state) => 0);
        }
      },
    );
  }
}
