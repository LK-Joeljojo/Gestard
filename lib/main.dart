import 'package:flutter/material.dart';

import 'data/api/local/isar_service.dart' show IsarService;

void main() async {
 await setUp();
  runApp(const MyApp());
}
Future<void> setUp() async {
  // Initialize Isar
  WidgetsFlutterBinding.ensureInitialized();
  await IsarService.setup();

}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const Center(child:Text('Flutter Demo Home Page') ),
    );
  }
}