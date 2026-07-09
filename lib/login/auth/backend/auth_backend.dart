import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:supabase_from_zero_to_end/login/auth/screen/home_screen.dart';

class AuthBackend {
  final supabase = Supabase.instance.client;

  Future<void> listenAuthentication(BuildContext context) async {
    supabase.auth.onAuthStateChange.listen((event) {
      final session = event.session;
      if (session != null) {
        final user = event.session!.user;
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
      }
    });
  }

  // now write code for signup
  Future<void> signUp(String email, String password) async {
    await supabase.auth.signUp(
      email: email,
      password: password,
      emailRedirectTo: 'learning://signUp',
    );
  }

  Future<void> signIn(String email, String password) async {
    await supabase.auth.signInWithPassword(email: email, password: password);
  }
}
