import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:logistix/ui/screens/introductory_screens/logistix_splash_screen.dart';
import 'package:sizer/sizer.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(DevicePreview(builder: (context)=> const MyApp()));
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.transparent),
    );
    return Sizer(
      builder: (context, orientation, deviceType) => MaterialApp(
        title: 'Logistix',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'evolventa',
        ),
        home: LogistixSplashScreen(),
      ),
    );
  }
}

