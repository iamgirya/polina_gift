import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

import '../widgets/custom_list_tile.dart';

class SpletnyaButton extends StatefulWidget {
  const SpletnyaButton({super.key});

  @override
  State<SpletnyaButton> createState() => _SpletnyaButtonState();
}

class _SpletnyaButtonState extends State<SpletnyaButton> {
  bool isTapped = false;
  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CustomListTile(
      title: 'Срочно посплетничать!',
      onTap: () async {
        isTapped = true;
        setState(() {});
        showDialog(
          context: context,
          builder: (context) {
            return Dialog(
              backgroundColor: Colors.black.withOpacity(0.4),
              elevation: 150,
              insetPadding: const EdgeInsets.all(0),
              child: Column(
                children: [
                  const SizedBox(height: 45),
                  TextField(
                    controller: textEditingController,
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    decoration: const InputDecoration(
                      hintText: 'Пиши сплетню, а потом на кнопку!',
                      hintMaxLines: null,
                    ),
                  ),
                  const Spacer(),
                  CustomListTile(
                    title: 'Тык',
                    onTap: () async {
                      await Share.share(textEditingController.text);
                      Navigator.of(context).pop();
                    },
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
