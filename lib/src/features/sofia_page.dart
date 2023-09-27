import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../widgets/custom_list_tile.dart';

class SofiaPageButton extends StatelessWidget {
  const SofiaPageButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomListTile(
      title: 'Срочно посплетничать!',
      onTap: () async {
        final sofiaUri = Uri.parse('https://vk.com/im?sel=383189143');
        await launchUrl(sofiaUri);
      },
    );
  }
}
