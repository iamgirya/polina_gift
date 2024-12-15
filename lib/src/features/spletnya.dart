import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
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
      onTap: () async => launchUrl(Uri.parse('tel://+PHONE')),
    );
  }
}
