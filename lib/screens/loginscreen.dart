// import 'package:flutter/material.dart';
// import '../services/auth_service.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// class LoginScreen extends StatefulWidget {
//   const LoginScreen({super.key});
//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   final _formKey = GlobalKey<FormState>();
//   String email = '', password = '';
//   bool loading = false;
//   String? error;
//   bool obscure = true;

//   void login() async {
//     if (_formKey.currentState!.validate()) {
//       setState(() {
//         loading = true;
//         error = null;
//       });
//       try {
//         final user = await AuthService().signIn(email, password);
//         if (user != null) {
//           if (!context.mounted) return;
//           Navigator.pushReplacementNamed(context, '/menu');
//         }
//       } catch (e) {
//         setState(() {
//           error = 'Login failed. Check your credentials.';
//         });
//       }
//       setState(() {
//         loading = false;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: Center(
//           child: SingleChildScrollView(
//             padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
//             child: Form(
//               key: _formKey,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   // العنوان الرئيسي
//                   const SizedBox(height: 32),
//                   const Text(
//                     'Login to your account.',
//                     style: TextStyle(
//                       fontSize: 28,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.black,
//                     ),
//                   ),
//                   const SizedBox(height: 8),
//                   const Text(
//                     'Please sign in to your account',
//                     style: TextStyle(fontSize: 15, color: Colors.black54),
//                   ),
//                   const SizedBox(height: 32),
//                   // حقل الإيميل
//                   TextFormField(
//                     decoration: InputDecoration(
//                       labelText: 'Email Address',
//                       hintText: 'Enter Email',
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(14),
//                       ),
//                       contentPadding: const EdgeInsets.symmetric(
//                         horizontal: 16,
//                         vertical: 18,
//                       ),
//                     ),
//                     onChanged: (v) => email = v,
//                     validator: (v) => v == null || !v.contains('@')
//                         ? 'Enter a valid email'
//                         : null,
//                   ),
//                   const SizedBox(height: 18),
//                   // حقل الباسورد
//                   TextFormField(
//                     decoration: InputDecoration(
//                       labelText: 'Password',
//                       hintText: 'Password',
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(14),
//                       ),
//                       contentPadding: const EdgeInsets.symmetric(
//                         horizontal: 16,
//                         vertical: 18,
//                       ),
//                       suffixIcon: IconButton(
//                         icon: Icon(
//                           obscure ? Icons.visibility_off : Icons.visibility,
//                         ),
//                         onPressed: () => setState(() => obscure = !obscure),
//                       ),
//                     ),
//                     obscureText: obscure,
//                     onChanged: (v) => password = v,
//                     validator: (v) => v == null || v.length < 6
//                         ? 'Password min 6 chars'
//                         : null,
//                   ),
//                   const SizedBox(height: 8),
//                   // Forgot password
//                   Align(
//                     alignment: Alignment.centerRight,
//                     child: TextButton(
//                       onPressed: () {},
//                       child: const Text(
//                         'Forgot password?',
//                         style: TextStyle(
//                           color: Colors.orange,
//                           fontWeight: FontWeight.w500,
//                         ),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 8),
//                   if (error != null)
//                     Padding(
//                       padding: const EdgeInsets.only(bottom: 8),
//                       child: Text(
//                         error!,
//                         style: const TextStyle(color: Colors.red),
//                       ),
//                     ),
//                   // زر تسجيل الدخول
//                   SizedBox(
//                     width: double.infinity,
//                     height: 52,
//                     child: ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.orange,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(28),
//                         ),
//                         textStyle: const TextStyle(
//                           fontSize: 18,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       onPressed: loading ? null : login,
//                       child: loading
//                           ? const CircularProgressIndicator(color: Colors.white)
//                           : const Text('Sign In'),
//                     ),
//                   ),
//                   const SizedBox(height: 18),
//                   // أو سجل بواسطة
//                   Row(
//                     children: [
//                       const Expanded(child: Divider(thickness: 1)),
//                       const Padding(
//                         padding: EdgeInsets.symmetric(horizontal: 8),
//                         child: Text(
//                           'Or sign in with',
//                           style: TextStyle(color: Colors.black54),
//                         ),
//                       ),
//                       const Expanded(child: Divider(thickness: 1)),
//                     ],
//                   ),
//                   const SizedBox(height: 16),
//                   // أيقونات السوشيال
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       _socialIcon(FontAwesomeIcons.google, color: Colors.red),
//                       const SizedBox(width: 18),
//                       _socialIcon(
//                         FontAwesomeIcons.facebook,
//                         color: Colors.blue,
//                       ),
//                       const SizedBox(width: 18),
//                       _socialIcon(FontAwesomeIcons.apple, color: Colors.black),
//                     ],
//                   ),
//                   const SizedBox(height: 24),
//                   // رابط التسجيل
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       const Text(
//                         "Don't have an account? ",
//                         style: TextStyle(color: Colors.black87),
//                       ),
//                       GestureDetector(
//                         onTap: () {
//                           Navigator.pushReplacementNamed(context, '/register');
//                         },
//                         child: const Text(
//                           'Register',
//                           style: TextStyle(
//                             color: Colors.orange,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 24),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _socialIcon(IconData icon, {Color? color, VoidCallback? onTap}) {
//     return IconButton(
//       onPressed: onTap ?? () {},
//       icon: FaIcon(icon, size: 32, color: color ?? Colors.black),
//       splashRadius: 22,
//       padding: EdgeInsets.zero,
//       constraints: const BoxConstraints(),
//     );
//   }
// }
import 'package:flutter/material.dart';
import '../services/auth_service.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  String email = '', password = '';
  bool loading = false;
  String? error;
  bool obscure = true;

  void login() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        loading = true;
        error = null;
      });
      try {
        final user = await AuthService().signIn(email, password);
        if (user != null) {
          // ✅  ***  الإصلاح هنا  ***
          if (!context.mounted) return;
          Navigator.pushReplacementNamed(context, '/menu');
        }
      } catch (e) {
        if (context.mounted) {
          setState(() {
            error = 'Login failed. Check your credentials.';
          });
        }
      }

      if (context.mounted) {
        setState(() {
          loading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // العنوان الرئيسي
                  const SizedBox(height: 32),
                  const Text(
                    'Login to your account.',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Please sign in to your account',
                    style: TextStyle(fontSize: 15, color: Colors.black54),
                  ),
                  const SizedBox(height: 32),
                  // حقل الإيميل
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Email Address',
                      hintText: 'Enter Email',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 18,
                      ),
                    ),
                    onChanged: (v) => email = v,
                    validator: (v) => v == null || !v.contains('@')
                        ? 'Enter a valid email'
                        : null,
                  ),
                  const SizedBox(height: 18),
                  // حقل الباسورد
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Password',
                      hintText: 'Password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 18,
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          obscure ? Icons.visibility_off : Icons.visibility,
                        ),
                        onPressed: () => setState(() => obscure = !obscure),
                      ),
                    ),
                    obscureText: obscure,
                    onChanged: (v) => password = v,
                    validator: (v) => v == null || v.length < 6
                        ? 'Password min 6 chars'
                        : null,
                  ),
                  const SizedBox(height: 8),
                  // Forgot password
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Forgot password?',
                        style: TextStyle(
                          color: Colors.orange,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  if (error != null)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Text(
                        error!,
                        style: const TextStyle(color: Colors.red),
                      ),
                    ),
                  // زر تسجيل الدخول
                  SizedBox(
                    width: double.infinity,
                    height: 52,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(28),
                        ),
                        textStyle: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onPressed: loading ? null : login,
                      child: loading
                          ? const CircularProgressIndicator(color: Colors.white)
                          : const Text('Sign In'),
                    ),
                  ),
                  const SizedBox(height: 18),
                  // أو سجل بواسطة
                  Row(
                    children: [
                      const Expanded(child: Divider(thickness: 1)),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        child: Text(
                          'Or sign in with',
                          style: TextStyle(color: Colors.black54),
                        ),
                      ),
                      const Expanded(child: Divider(thickness: 1)),
                    ],
                  ),
                  const SizedBox(height: 16),
                  // أيقونات السوشيال
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _socialIcon(FontAwesomeIcons.google, color: Colors.red),
                      const SizedBox(width: 18),
                      _socialIcon(
                        FontAwesomeIcons.facebook,
                        color: Colors.blue,
                      ),
                      const SizedBox(width: 18),
                      _socialIcon(FontAwesomeIcons.apple, color: Colors.black),
                    ],
                  ),
                  const SizedBox(height: 24),
                  // رابط التسجيل
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don't have an account? ",
                        style: TextStyle(color: Colors.black87),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacementNamed(context, '/register');
                        },
                        child: const Text(
                          'Register',
                          style: TextStyle(
                            color: Colors.orange,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _socialIcon(IconData icon, {Color? color, VoidCallback? onTap}) {
    return IconButton(
      onPressed: onTap ?? () {},
      icon: FaIcon(icon, size: 32, color: color ?? Colors.black),
      splashRadius: 22,
      padding: EdgeInsets.zero,
      constraints: const BoxConstraints(),
    );
  }
}
