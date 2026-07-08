import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:supabase_from_zero_to_end/login/auth/screen/splash_screen.dart';

void main() {
  testWidgets('Splash screen shows loading state', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: SplashScreen()));

    expect(find.text('Loading...'), findsOneWidget);
  });
}
