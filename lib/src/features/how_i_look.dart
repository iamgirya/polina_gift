import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

import '../widgets/custom_list_tile.dart';

class HowIlookButton extends StatefulWidget {
  const HowIlookButton({super.key});

  @override
  State<HowIlookButton> createState() => _HowIlookButtonState();
}

class _HowIlookButtonState extends State<HowIlookButton> {
  String title = 'Как я выгляжу?';
  int index = -1;
  int oldIndex = -1;

  @override
  Widget build(BuildContext context) {
    return CustomListTile(
      title: title,
      onTap: () => setState(
        () {
          if (index == -1) {
            index = Random().nextInt(complimentContainer.length);
            oldIndex = index;
            Timer.periodic(
              const Duration(seconds: 2),
              (timer) {
                if (oldIndex == index) {
                  index = -1;
                  title = 'Как я выгляжу?';
                  setState(() {});
                  timer.cancel();
                } else {
                  oldIndex = index;
                }
              },
            );
          }
          title = complimentContainer[index];
          index = (index + 1) % complimentContainer.length;
        },
      ),
    );
  }
}

const complimentContainer = [
  'Прекрасно',
  'Замечательно',
  'Привлекательно',
  'Очень хорошо',
  'Шикарно',
  'Классно',
  'Очень красиво',
  'Стильно',
  'Удивительно',
  'Прелесть',
  'Невероятно',
  'Обаятельно',
  'Лучше всех',
  'Просто красавица',
  'Прелестно',
  'Сказочно',
  'Божественно',
  'Уникально',
  'Заряженно',
  'Очаровательно',
  'Восхитительно',
  'Неповторимо',
  'Великолепно',
  'Безукоризненно',
  'Пленительно',
  'Маняще',
  'Исключительно',
  'Блестяще',
  'Гламурно',
  'Ярко',
  'Как восхождение на гору',
  'Элегантно',
  'Роскошно',
  'Бесподобно',
  'Аппетитно',
  'Вдохновляюще',
  'Равносильно солнцу',
  'Сногсшибательно',
  'Безмерно красиво',
  'Изумительно',
  'Модно',
  'Потрясающе',
  'По-королевски',
  'На высоте',
  'Как сон',
  'Славно',
  'С улыбкой',
  'Магически',
  'Ангельски',
  'Лучшая на свете',
  'Соблазнительно',
  'Как из журнала',
  'Стильнейшая',
  'Безупречно',
  'Потрясающая',
  'Бесконечно прекрасна',
  'Вдохновляющая',
  'Ослепительно',
  'Искусительно',
  'Сияюще',
  'Неповторима',
  'Как мечта',
  'Абсолютно чарующе',
  'Волшебно',
  'Улетно',
  'Идеально подходишь',
  'Модельно',
  'На уровне',
  'Восхитительна',
  'Завораживающе',
  'Эффектно',
  'Невероятная',
  'Как звезда',
  'Безумно хорошо',
  'Гипнотически',
  'Как драгоценность',
  'Роскошная',
  'Очаровательна до безумия',
  'С фантастической грацией',
  'Впечатляюще красиво',
  'На высшем уровне',
  'Безмерно красиво',
];
