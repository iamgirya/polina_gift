import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:path_provider/path_provider.dart';

import '../widgets/custom_list_tile.dart';

class RandomShastunButton extends StatefulWidget {
  const RandomShastunButton({
    Key? key,
  }) : super(key: key);

  @override
  State<RandomShastunButton> createState() => _RandomShastunButtonState();
}

class _RandomShastunButtonState extends State<RandomShastunButton> {
  static const titles = [
    'Шастунчика, пожалуйста',
    'Шастуна мне!',
    'Шастунчика, пожалуйста',
    'Шастуна мне!',
    'Шастунчика, пожалуйста',
    'Шастуна мне!',
    'Антона хачу',
    'Обновить рабочий стол надо',
    'https://get_anton?count=1',
    'Фотку длинного бы',
    'Шастуна!',
    'Призыв Антона',
    'Нагенерить Шастуна',
    'Омыть очи ликом Антона',
    'Сымпровизируй мне кого-нибудь',
  ];

  @override
  Widget build(BuildContext context) {
    final randInt = Random().nextInt(titles.length);
    return CustomListTile(
      title: titles[randInt],
      onTap: () async {
        await showDialog(
            context: context,
            builder: (context) {
              return const ShastunDialog();
            });
        setState(() {});
      },
    );
  }
}

class ShastunDialog extends StatelessWidget {
  const ShastunDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final randInt = Random().nextInt(236) + 1;
    final pictureName =
        'assets/anton/${randInt.toString().padLeft(6, '0')}.jpg';
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
                Center(
                  child: Image.asset(
                    pictureName,
                    fit: BoxFit.contain,
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: CustomListTile(
                    onTap: () async {
                      try {
                        // делаем из ассета файл
                        final byteData = await rootBundle.load(pictureName);
                        final file = File(
                            '${(await getTemporaryDirectory()).path}/$pictureName');
                        await file.create(recursive: true);
                        await file.writeAsBytes(byteData.buffer.asUint8List(
                            byteData.offsetInBytes, byteData.lengthInBytes));

                        //сохраняем в галереи
                        final rez = await GallerySaver.saveImage(file.path);

                        // подчищаем
                        await file.delete();

                        // ignore: use_build_context_synchronously
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              (rez ?? false)
                                  ? 'Получилось! Иди смотри :3'
                                  : 'Блин, чёт не то. Прости, сегодня без фотки',
                            ),
                          ),
                        );
                        // ignore: use_build_context_synchronously
                        Navigator.of(context).pop();
                      } catch (e) {
                        //print(e);
                      }
                    },
                    width: 210,
                    title: 'Сохранить себе',
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
