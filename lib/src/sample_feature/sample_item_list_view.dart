import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:polina_gift/src/features/good_girl_screen.dart';
import 'package:polina_gift/src/features/sounds_on_sadness.dart';
import 'package:polina_gift/src/widgets/custom_list_tile.dart';

import '../features/how_i_look.dart';
import '../features/random_shastun.dart';
import '../features/sofia_page.dart';
import '../features/where_phone.dart';
import '../settings/settings_view.dart';
import 'sample_item.dart';

/// Displays a list of SampleItems.
class SampleItemListView extends ConsumerWidget {
  const SampleItemListView({
    super.key,
    this.items = const [SampleItem(1), SampleItem(2), SampleItem(3)],
  });

  static const routeName = '/';

  final List<SampleItem> items;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Для тебя, Полина'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () =>
                Navigator.restorablePushNamed(context, SettingsView.routeName),
          ),
        ],
      ),
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
          ListView(
            padding: const EdgeInsets.only(top: 16),
            children: const [
              // пермишен хендлер ещё заюзай
              SoundsOnSadnessButton(),
              RandomShastunButton(),
              WherePhoneButton(),
              GoodGirlButton(),
              SofiaPageButton(),
              HowIlookButton(),
            ],
          ),
        ],
      ),
    );
  }
}
