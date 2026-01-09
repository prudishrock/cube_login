import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/auth_provider.dart';
import 'routes/app_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AuthProvider(),
      builder: (context, child) {
        final authProvider = Provider.of<AuthProvider>(context, listen: false);
        final router = AppRouter.createRouter(authProvider);

        return MaterialApp.router(
          title: 'Cube Login',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          routerConfig: router,
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
