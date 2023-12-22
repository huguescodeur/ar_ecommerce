// ignore_for_file: depend_on_referenced_packages

import 'package:ar_ecommerce/features/shop_ar/presentation_layer/screens/home/bag_screen.dart';
import 'package:ar_ecommerce/features/shop_ar/presentation_layer/screens/home/favorite_screen.dart';
import 'package:ar_ecommerce/features/shop_ar/presentation_layer/screens/home/home_screen.dart';
import 'package:ar_ecommerce/features/shop_ar/presentation_layer/screens/home/main_screen.dart';
import 'package:ar_ecommerce/features/shop_ar/presentation_layer/screens/home/profile_screen.dart';
import 'package:ar_ecommerce/features/shop_ar/presentation_layer/screens/home/shop_screen.dart';
import 'package:ar_ecommerce/features/shop_ar/presentation_layer/screens/auth_screens/verify_screen.dart';
import 'package:ar_ecommerce/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';

import 'features/shop_ar/domain_layer/usescases/auth_manager.dart';
import 'features/shop_ar/presentation_layer/screens/auth_screens/forgot_screen.dart';
import 'features/shop_ar/presentation_layer/screens/auth_screens/login_screen.dart';
import 'features/shop_ar/presentation_layer/screens/auth_screens/register_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  bool isLoggedIn = await AuthManager.isLoggedIn();
  runApp(ProviderScope(child: MyApp(isLoggedIn: isLoggedIn)));
}

class MyApp extends ConsumerWidget {
  final bool isLoggedIn;
  const MyApp({super.key, required this.isLoggedIn});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ar Ecommerce',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // theme: lightTheme,

      routes: {
        "/login": (context) => const LoginScreen(),
        "/register": (context) => const RegisterScreen(),
        "/verify": (context) => const VerifyCode(),
        "/forgot": (context) => const ForgotScreen(),
        "/main": (context) => const MainScreen(),
        "/home": (context) => const HomeScreen(),
        // "/shop": (context) => const HomeScreens(),
        "/shop": (context) => const ShopScreen(),
        "/bag": (context) => const BagScreen(),
        "/favorite": (context) => const FavoriteScreen(),
        "/profile": (context) => const ProfileScreen(),
      },
      home: isLoggedIn ? const MainScreen() : const LoginScreen(),
    );
  }
}
