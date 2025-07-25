import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_auth/firebase_auth.dart'; // نحتاجه للتحقق من حالة المستخدم
import 'package:provider/provider.dart';

// تأكد من أن أسماء الملفات والكلاسات صحيحة هنا
import 'package:restaurantmobileapp/providers/cartprovidor.dart';
import 'package:restaurantmobileapp/screens/cartscreen.dart';
import 'package:restaurantmobileapp/screens/loginscreen.dart';
import 'package:restaurantmobileapp/screens/menuscreen.dart';
import 'package:restaurantmobileapp/screens/splash_screen.dart';
import 'package:restaurantmobileapp/screens/onboarding_screen.dart';
import 'package:restaurantmobileapp/screens/register_screen.dart';

import 'firebase_options.dart'; // استيراد ملف الإعدادات

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // الطريقة الحديثة لتهيئة Firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CartProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Restaurant App',
        theme: ThemeData(primarySwatch: Colors.orange),

        // -- التحسين الأهم --
        // بدلاً من initialRoute، سنستخدم home مع StreamBuilder
        initialRoute: '/splash',
        routes: {
          '/splash': (_) => const SplashScreen(),
          '/onboarding': (_) => const OnboardingScreen(),
          '/login': (_) => const LoginScreen(),
          '/menu': (_) => const MenuScreen(),
          '/cart': (_) => const CartScreen(),
          '/register': (_) => const RegisterScreen(),
        },
      ),
    );
  }
}
