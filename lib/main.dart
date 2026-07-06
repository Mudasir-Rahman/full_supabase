import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:supabase_from_zero_to_end/login/auth/screen/signup_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://oosgtnozzcxmtwpmseam.supabase.co',
    publishableKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im9vc2d0bm96emN4bXR3cG1zZWFtIiwicm9sZSI6ImFub24iLCJpYXQiOjE3ODMxNTA2MzEsImV4cCI6MjA5ODcyNjYzMX0.pWG_9Als3Xi3EwzBVYylEHeXCWadEZLuWq36up7tD1E',
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const SignUp(),
    );
  }
}
