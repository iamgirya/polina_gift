import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_list_tile.dart';

class SoundsOnSadnessButton extends StatefulWidget {
  const SoundsOnSadnessButton({
    Key? key,
  }) : super(key: key);

  @override
  State<SoundsOnSadnessButton> createState() => _SoundsOnSadnessButtonState();
}

class _SoundsOnSadnessButtonState extends State<SoundsOnSadnessButton> {
  @override
  Widget build(BuildContext context) {
    return CustomListTile(
      title: 'Звуки на случай грусти',
      onTap: () async => await showDialog(
        context: context,
        builder: (context) => const SoundPadDialog(),
      ),
    );
  }
}

final playerMusic1 = AudioPlayer();
bool music1Paused = true;
final playerMusic2 = AudioPlayer();
bool music2Paused = true;

class SoundPadDialog extends StatefulWidget {
  const SoundPadDialog({
    Key? key,
  }) : super(key: key);

  @override
  State<SoundPadDialog> createState() => _SoundPadDialogState();
}

class _SoundPadDialogState extends State<SoundPadDialog> {
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
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: CustomListTile(
                    title: 'ʕ ᵔᴥᵔ ʔ',
                    height: 80,
                    width: 80,
                    onTap: () async {
                      final player = AudioPlayer();
                      await player.play(
                        AssetSource('sounds/mur1.mp3'),
                        volume: 100,
                      );
                      player.onPlayerComplete
                          .listen((event) => player.dispose());
                    },
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: CustomListTile(
                    title: ':3',
                    height: 80,
                    width: 80,
                    onTap: () async {
                      final player = AudioPlayer();
                      await player.play(
                        AssetSource('sounds/myau1.mp3'),
                        volume: 100,
                      );
                      player.onPlayerComplete
                          .listen((event) => player.dispose());
                    },
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: CustomListTile(
                    title: ':*',
                    height: 80,
                    width: 80,
                    onTap: () async {
                      final player = AudioPlayer();
                      await player.play(
                        AssetSource('sounds/myau2.mp3'),
                        volume: 100,
                      );
                      player.onPlayerComplete
                          .listen((event) => player.dispose());
                    },
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: CustomListTile(
                    title: '^•ﻌ•^',
                    height: 80,
                    width: 80,
                    onTap: () async {
                      final player = AudioPlayer();
                      await player.play(
                        AssetSource('sounds/mur2.mp3'),
                        volume: 0.5,
                      );
                      player.onPlayerComplete
                          .listen((event) => player.dispose());
                    },
                  ),
                ),
                Align(
                  alignment: const Alignment(0, -0.5),
                  child: CustomListTile(
                    title: '🔥',
                    height: 80,
                    width: 80,
                    onTap: () async {
                      final player = AudioPlayer();
                      await player.play(
                        AssetSource('sounds/inGosTrah.mp3'),
                        volume: 100,
                      );
                      player.onPlayerComplete
                          .listen((event) => player.dispose());
                    },
                  ),
                ),
                Align(
                  alignment: const Alignment(0, 1),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CustomListTile(
                        title: '',
                        height: 45,
                        onTap: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              onPressed: () {
                                if (music2Paused) {
                                  playerMusic2.release();
                                } else {
                                  playerMusic2.pause();
                                  music2Paused = true;
                                }
                                setState(() {});
                              },
                              icon:
                                  Icon(music2Paused ? Icons.stop : Icons.pause),
                              splashColor: Colors.transparent,
                            ),
                            const Text(
                              'Сегодня я сойду на нет',
                              style: TextStyle(
                                color: Color.fromARGB(255, 255, 255, 220),
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            IconButton(
                              onPressed: () {
                                music2Paused = false;
                                playerMusic2.source == null
                                    ? playerMusic2
                                        .play(AssetSource('sounds/izmena.mp3'))
                                    : playerMusic2.resume();
                                setState(() {});
                              },
                              splashColor: Colors.transparent,
                              icon: const Icon(Icons.play_arrow),
                            ),
                          ],
                        ),
                      ),
                      CustomListTile(
                        title: '',
                        height: 45,
                        onTap: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              onPressed: () {
                                if (music1Paused) {
                                  playerMusic1.release();
                                } else {
                                  playerMusic1.pause();
                                  music1Paused = true;
                                }
                                setState(() {});
                              },
                              icon:
                                  Icon(music1Paused ? Icons.stop : Icons.pause),
                              splashColor: Colors.transparent,
                            ),
                            const Text(
                              'Ещё на мгновение...',
                              style: TextStyle(
                                color: Color.fromARGB(255, 255, 255, 220),
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            IconButton(
                              onPressed: () {
                                music1Paused = false;
                                playerMusic1.source == null
                                    ? playerMusic1
                                        .play(AssetSource('sounds/itsme.mp3'))
                                    : playerMusic1.resume();
                                setState(() {});
                              },
                              splashColor: Colors.transparent,
                              icon: const Icon(Icons.play_arrow),
                            ),
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Opacity(
                          opacity: 0.5,
                          child: CustomListTile(
                            title: '',
                            width: 60,
                            onTap: () => Navigator.of(context).pop(),
                            child: const Icon(Icons.exit_to_app),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
