import 'dart:async';

import 'package:roqqu_test/presentation/views/home/home_view.dart';
import 'package:roqqu_test/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// ignore: constant_identifier_names
class Main {}

void main() async {
  final logger = appLogger(Main);
  await runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      runApp(const ProviderScope(child: MyApp()));
    },
    (error, stackTrace) => logger.e(
      error.toString(),
      stackTrace: stackTrace,
      functionName: "main",
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Roqqu Test',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      home: const HomeView(),
    );
  }
}
