import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthBackend {
  final supabase = Supabase.instance.client;
  // now write code for signup
  Future<void> signUp(String email, String password) async {
    supabase.auth.signUp(email: email, password: password);
  }
}
