import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'features/auth/data/fake_auth_repository.dart';
import 'features/auth/presentation/auth_controller.dart';
import 'routes/app_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Dependency Injection: Create repository and inject into controller
    final authRepository = FakeAuthRepository();
    final authController = AuthController(authRepository);

    return ChangeNotifierProvider.value(
      value: authController,
      builder: (context, child) {
        final authController = Provider.of<AuthController>(context, listen: false);
        final router = AppRouter.createRouter(authController);

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
