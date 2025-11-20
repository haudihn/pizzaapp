import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:google_fonts/google_fonts.dart';
import 'home_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    //menjalankan precache setelah frame pertama selesai dibuild
    WidgetsBinding.instance.addPostFrameCallback((_) {
      precacheImage(const AssetImage('assets/images/bg_splash.png'), context);
    });

    // delay 3 detik sebelum masuk ke HomePage
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const HomePage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        fit: StackFit.expand,
        children: [
          //Background dari image assets
          Image.asset(
            'assets/images/bg_splash1.png',
            fit: BoxFit.cover,
          ),

          //Logo Lottie di tengah
          Center(
            child: Lottie.asset(
              'assets/lottie/pizza_box_order.json',
              width: 220,
              height: 220,
              fit: BoxFit.contain,
            ),
          ),

          //Teks di bagian bawah layar
          Positioned(
            bottom: 260,
            left: 0,
            right: 0,
            child: Text(
              'Lets get your favorite pizza!',
              textAlign: TextAlign.center,
              style: GoogleFonts.caveatBrush(
                color: Colors.white,
                fontSize: 22,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
