import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:sampleproject/screens/auth_screen.dart';
import 'package:sampleproject/screens/chat_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
   //1 FlutterError.onError=FirebaseCrashlytics.instance.recordFlutterError;
/* 3  FlutterError.onError = (FlutterErrorDetails details) async {
    await FirebaseCrashlytics.instance.recordFlutterError(details);
    FlutterError.dumpErrorToConsole(details);
  }; */
   FirebaseCrashlytics.instance.setCustomKey("user_id", "1234");
  FirebaseCrashlytics.instance.setCustomKey("screen_name", "HomePage");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  MaterialColor primaryBlack = const MaterialColor(
    0xFF000000,
    <int, Color>{
      50: Color(0xFF000000),
      100: Color(0xFF000000),
      200: Color(0xFF000000),
      300: Color(0xFF000000),
      400: Color(0xFF000000),
      500: Color(0xFF000000),
      600: Color(0xFF000000),
      700: Color(0xFF000000),
      // 800: Color(0xFF000000),
      // 900: Color(0xFF000000),
    },
  );

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: primaryBlack,
          buttonTheme: ButtonTheme.of(context).copyWith(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              textTheme: ButtonTextTheme.primary,
              buttonColor: Colors.red)),
      title: "Flutter Chat",
      home: AuthScreen(),
    );
  }
}


