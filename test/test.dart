import 'package:dharma_bakti_app/pages/dashboard.dart';
import 'package:dharma_bakti_app/pages/initial.dart';
import 'package:dharma_bakti_app/pages/initial_succeed.dart';
import 'package:dharma_bakti_app/pages/login.dart';
import 'package:dharma_bakti_app/pages/payment/payment_amount.dart';
import 'package:dharma_bakti_app/pages/splash_screen.dart';
import 'package:dharma_bakti_app/widgets/primary_button.dart';
import 'package:dharma_bakti_app/widgets/textfield_custom.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;

import 'package:dharma_bakti_app/main.dart';
import 'package:http/testing.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'mock.dart';

// void main() {
//   // Firebaseをmockしないとwidgetのテストが終わらない。

//   setupFirebaseAuthMocks();

//   setUpAll(() async {
//     await Firebase.initializeApp();
//   });

//   setUp(() {
//     http.Client client = MockClient((request) async {
//       return http.Response(
//           '{"success": true}', 200); // Simulasi response sukses
//     });
//   });

//   testWidgets("Halaman pertama jika tidak login adalah SplashScreenPage",
//       (WidgetTester tester) async {
//     SharedPreferences.setMockInitialValues({'isLoggedIn': false});
//     await tester.pumpWidget(const MyApp());
//   });
// }

void main() {
  // Firebaseをmockしないとwidgetのテストが終わらない。

  setupFirebaseAuthMocks();

  setUpAll(() async {
    await Firebase.initializeApp();
  });

  testWidgets(
      'Verifikasi bahwa splashcreen akan menuju InitialScreen setelah 2 detik',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: SplashScreenPage()));

    // InitialPage belum ada
    expect(find.byType(InitialPage), findsNothing);

    // Tahan selama 2 detik
    await tester.pumpAndSettle(const Duration(seconds: 2));

    // InitialPage sudah ditampilkan
    expect(find.byType(InitialPage), findsOneWidget);
  });

  testWidgets('Cek apakah terdapat tulisan di InitialPage()',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: SplashScreenPage()));
    await tester.pumpAndSettle(const Duration(seconds: 2));
    expect(find.text("Mengubah Tantangan Menjadi Peluang"), findsOneWidget);
  });

  testWidgets(
      'Cek apakah terdapat button custom PrimaryButton untuk login di InitialPage()',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: SplashScreenPage()));
    await tester.pumpAndSettle(const Duration(seconds: 2));
    expect(find.byType(PrimaryButton), findsWidgets);
  });

  testWidgets('Cek apakah terdapat textfield custom di LoginPage()',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: LoginPage()));

    expect(find.byType(TextFieldCustom), findsWidgets);
  });

  testWidgets('Cek apakah terdapat textfield custom di LoginPage()',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: LoginPage()));

    expect(find.byType(TextFieldCustom), findsWidgets);
  });

  testWidgets('Memastikan textfield custom LoginPage() dapat dituliskan teks',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: LoginPage()));

    final emailField = find.byType(TextField).first;
    final passwordField = find.byType(TextField).at(1);

    await tester.enterText(emailField, 'andy@gmail.com');
    expect(find.text('andy@gmail.com'), findsOneWidget);

    await tester.enterText(passwordField, '12345678');
    expect(find.text('12345678'), findsOneWidget);
  });

  testWidgets(
      'Memastikan bahwa tombol back LoginPage() bisa bekerja dengan baik',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: LoginPage()));

    final backButton = find.byIcon(Icons.arrow_back_ios_new);

    await tester.tap(backButton);
    await tester.pumpAndSettle(); //Menunggu animasi selesai...

    expect(find.byType(LoginPage), findsNothing);
  });

  testWidgets('Memastikan tombol login di LoginPage() bisa ditekan',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: LoginPage()));
    final loginButton = find.byKey(const Key('loginBtn'));
    expect(tester.widget<ElevatedButton>(loginButton).enabled, isTrue);
  });

  testWidgets('Memastikan controller InitialPage terinisialisasi',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: LoginPage()));

    final emailField = find.byType(TextFieldCustom).first;
    final passwordField = find.byType(TextFieldCustom).at(1);

    expect(emailField, findsOneWidget);
    expect(passwordField, findsOneWidget);
  });

  testWidgets('State email dan password terupdate',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: LoginPage()));

    final emailField = find.byType(TextFieldCustom).first;
    final passwordField = find.byType(TextFieldCustom).at(1);

    await tester.enterText(emailField, 'andy@gmail.com');
    await tester.pump();
    await tester.enterText(passwordField, '12345678');
    await tester.pump();
    expect(find.text('andy@gmail.com'), findsOneWidget);
    expect(find.text('12345678'), findsOneWidget);
  });

  testWidgets('Memastikan Dashboard dapat berjalan dengan baik',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: Dashboard()));
    expect(find.byType(Dashboard), findsOneWidget);
  });
}
