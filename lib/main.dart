import 'package:assist_queen/constant/note_theme.dart';
import 'package:assist_queen/screens/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final theme = NoteTheme.light();
    return MaterialApp(theme: theme, home: const HomePage());
  }
}
