import 'package:flutter/material.dart';
import 'package:gestard/core/theme/customs_themes/appbar_theme.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sizer/sizer.dart';

import 'core/theme/theme.dart';
import 'data/api/local/isar_service.dart' show IsarService;
import 'presentation/authentication/view/login_screen.dart';
import 'presentation/authentication/view/sign_up_screen.dart';

void main() async {
  await setUp();

  runApp(
    // Envelopper MyApp avec ProviderScope pour permettre l'utilisation de Riverpod dans toute l'application
    ProviderScope(child: const MyApp()),
  );
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
    return Sizer(
      builder: (context, orientation, deviceType) => MaterialApp(
        initialRoute: '/login',

        routes: {
          '/login': (context) => const LoginScreen(),
          '/signup': (context) => const SignUpScreen(),
        },
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: JAppTheme.lightTheme,
        darkTheme: JAppTheme.darkTheme,
        home: const LoginScreen(),
      ),
    );
  }
}
