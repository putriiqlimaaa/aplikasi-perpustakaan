import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:perpustakaan/awal.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  // Inisialisasi Firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyBjQjzovJtpvMWlGBDoDFDUSCcRdCUhBOs", // paste your api key here
      appId: "1:556242723938:android:503cb57e0c800b8d63dd3b", //paste your app id here
      messagingSenderId: "556242723938", //paste your messagingSenderId here
      projectId: "perpustakaan-aa4c0", //paste your project id here
    ),
  );
  runApp(App());
}

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: GoogleFonts.poppins().fontFamily),
      home: awal(),
    );
  }
}