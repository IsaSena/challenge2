import 'package:challenge2/pages/cadastro.dart';
import 'package:challenge2/pages/page1.dart';
import 'package:challenge2/pages/page2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(ProviderScope(child:MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: {
        '/' : (_) => Page1(),
        //'/page2' : (_) => Page2(user: user),
        '/cadastro' : (_) => Cadastro(),
      },
    );
  }
}
