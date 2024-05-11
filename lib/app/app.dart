import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quantwealth/ui/auth/auth_page.dart';
import 'package:web3modal_flutter/web3modal_flutter.dart';

class QuantApp extends StatelessWidget {
  const QuantApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Web3ModalTheme(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.dark,
        theme: ThemeData(
          useMaterial3: true,
          fontFamily: GoogleFonts.rubik().fontFamily,
        ),
        home: AuthPage(),
      ),
    );
  }
}
