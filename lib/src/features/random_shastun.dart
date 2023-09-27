import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
    'https://get_anton_shastun?count=1',
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
      onTap: () {
        print(1);
      },
    );
  }
}
