import 'package:flutter/material.dart';

class SiguUp extends StatefulWidget {
  const SiguUp({super.key});

  @override
  State<SiguUp> createState() => _SiguUpState();
}

class _SiguUpState extends State<SiguUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(164, 255, 255, 255),
      appBar: AppBar(
        title: Text(
          'Create Account',
          style: TextStyle(
            color: const Color.fromARGB(150, 68, 137, 255),
            fontWeight: FontWeight.bold,
            fontSize: 17,
          ),
        ),
      ),
    );
  }
}
