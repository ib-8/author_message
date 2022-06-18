import 'package:authors_app/controller/message_controller.dart';
import 'package:authors_app/view/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => MessageController(),
      builder: (context, child) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.grey,
            scaffoldBackgroundColor: Colors.white,
            appBarTheme: const AppBarTheme(
              backgroundColor: Colors.white,
              elevation: 0,
            ),
            inputDecorationTheme: InputDecorationTheme(
              contentPadding: const EdgeInsets.symmetric(horizontal: 25),
              fillColor: Colors.grey.withOpacity(0.1),
              filled: true,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide:
                    const BorderSide(color: Colors.transparent, width: 0),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide:
                    const BorderSide(color: Colors.transparent, width: 0),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide:
                    const BorderSide(color: Colors.transparent, width: 0),
              ),
            ),
          ),
          home: const Home(),
        );
      },
    );
  }
}
