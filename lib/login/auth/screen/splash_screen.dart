// import 'package:flutter/material.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';
// import 'package:supabase_from_zero_to_end/login/auth/screen/register/register_user.dart';
// import 'package:supabase_from_zero_to_end/login/auth/screen/verify_email_screen.dart';
// import 'package:supabase_from_zero_to_end/login/auth/screen/signup_screen.dart';

// class SplashScreen extends StatefulWidget {
//   const SplashScreen({super.key});

//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   void initState() {
//     super.initState();
//     _checkUserSession();
//   }

//   Future<void> _checkUserSession() async {
//     await Future.delayed(const Duration(seconds: 2));

//     if (!mounted) return;

//     final user = Supabase.instance.client.auth.currentUser;

//     if (user == null) {
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (_) => const SignUp()),
//       );
//       return;
//     }

//     if (user.emailConfirmedAt != null) {
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (_) => const RegisterUserScreen()),
//       );
//     } else {
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (_) => VerifyEmailScreen()),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             FlutterLogo(size: 80),
//             SizedBox(height: 20),
//             CircularProgressIndicator(),
//             SizedBox(height: 20),
//             Text('Loading...', style: TextStyle(fontSize: 18)),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:supabase_from_zero_to_end/login/auth/backend/register_backend.dart';

import 'package:supabase_from_zero_to_end/login/auth/screen/home_screen.dart';
import 'package:supabase_from_zero_to_end/login/auth/screen/register/register_user.dart';
import 'package:supabase_from_zero_to_end/login/auth/screen/signup_screen.dart';
import 'package:supabase_from_zero_to_end/login/auth/screen/verify_email_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final profileBackend = ProfileBackend();

  @override
  void initState() {
    super.initState();
    _checkUserSession();
  }

  Future<void> _checkUserSession() async {
    await Future.delayed(const Duration(seconds: 2));

    if (!mounted) return;

    final user = Supabase.instance.client.auth.currentUser;

    // User not logged in
    if (user == null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const SignUp()),
      );
      return;
    }

    // Email not verified
    if (user.emailConfirmedAt == null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const VerifyEmailScreen()),
      );
      return;
    }

    // Check if profile exists
    final exists = await profileBackend.profileExists();

    if (!mounted) return;

    if (exists) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const HomeScreen()),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const RegisterUserScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlutterLogo(size: 80),
            SizedBox(height: 20),
            CircularProgressIndicator(),
            SizedBox(height: 20),
            Text('Loading...', style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
