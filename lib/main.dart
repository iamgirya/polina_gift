import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';

import 'src/app.dart';
import 'src/features/good_girl_screen.dart';
import 'src/features/permission.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  isPermissionGranted = await Permission.camera.isGranted &&
      await Permission.microphone.isGranted;

  runApp(
    ProviderScope(
      child: Consumer(
        builder: (context, ref, _) {
          ref.read(camerasHolder);
          return const MyApp();
        },
      ),
    ),
  );
}
