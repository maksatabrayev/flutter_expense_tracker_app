import 'package:expenses_tracker_app/widgets/expenses.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';

var kColorScheme =
    ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 88, 29, 181));
var kColorDarkScheme = ColorScheme.fromSeed(
    seedColor: const Color.fromARGB(255, 5, 99, 125),
    brightness: Brightness.dark);
void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
  //     .then((fn) {
    runApp(const MyApp());
  //});
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: ThemeData.dark().copyWith(
        appBarTheme: const AppBarTheme().copyWith(
            color: kColorScheme.primary,
            foregroundColor: kColorScheme.onPrimary),
        colorScheme: kColorDarkScheme,
        cardTheme: const CardTheme().copyWith(
            color: kColorDarkScheme.secondaryContainer,
            margin: const EdgeInsets.all(8)),
      ),
      theme: ThemeData().copyWith(
        colorScheme: kColorScheme,
        appBarTheme: const AppBarTheme().copyWith(
            backgroundColor: kColorScheme.onPrimaryContainer,
            foregroundColor: kColorScheme.primaryContainer),
        cardTheme: const CardTheme().copyWith(
            color: kColorScheme.secondaryContainer,
            margin: const EdgeInsets.all(8)),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                backgroundColor: kColorScheme.primaryContainer)),
      ),
      home: const Expenses(),
    );
  }
}
