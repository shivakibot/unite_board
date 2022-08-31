import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:unite_board/repository/localDb.dart';
import 'package:unite_board/view/home.dart';
import 'package:unite_board/view/splash.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  LocalDb.init();
  SystemChrome.setPreferredOrientations([
    /// 横向き固定
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]).then((_) {
    MobileAds.instance.initialize();
    runApp(
        const ProviderScope(child: MyApp()));
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      // localeに英語と日本語を登録する
      supportedLocales: const [
        Locale("en"),
        Locale("ja"),
      ],
      locale: const Locale('ja', 'JP'),
      title: 'Unite Board',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: const Splash(),
    );
  }
}
