import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:mis_libros/firebase_options.dart';
import 'package:mis_libros/pages/home.dart';
import 'package:mis_libros/pages/search_sitie.dart';
import 'package:mis_libros/pages/splash.dart';
import 'package:firebase_core/firebase_core.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Tour',
      localizationsDelegates: const[
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const[
        Locale("en","US"),
        Locale("es","CO"),
      ],
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const SplashPage(),
    );
  }
}

