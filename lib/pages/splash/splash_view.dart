import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mylingz_app/extensions/context_exten.dart';
import 'package:mylingz_app/network/firebase_client.dart';

import '../../routes/app_routes.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), ()async{
      User? user = FirebaseAuth.instance.currentUser; 

      if(user!=null){
        await FirebaseClient().initApp(user).then(
          (value) => context.goto(Routes.home, clear: true));
      }else{
        context.goto(Routes.login, clear: true);
      }
    });
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFFACA4FE),
              Color(0xFF5C55AB),
              Color(0xFF2B275A),
            ]
          )
        ),
        child: Center(
          child: Text("MYLingz", style: GoogleFonts.lato(
            color: Colors.white,
            fontSize: 32,
            fontWeight: FontWeight.w900
          ))
        ),
      ),
    );
  }
}