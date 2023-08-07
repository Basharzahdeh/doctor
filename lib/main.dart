import 'package:doctor/Provider/conferences_provider.dart';
import 'package:doctor/view/conferences_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Provider/question_provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => ConferencesProvider()),
      ChangeNotifierProvider(create: (_) => QuestionProvider()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: ConferencesView(),
    );
  }
}
