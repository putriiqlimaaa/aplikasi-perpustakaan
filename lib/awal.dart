import 'dart:async';
import 'package:flutter/material.dart';
import 'package:perpustakaan/login%20dan%20sign%20up/login.dart';

class awal extends StatefulWidget {
  const awal({super.key});

  @override
  State<awal> createState() => _awalState();
}

class _awalState extends State<awal> {
  @override
  void initState() {
    Timer(const Duration(seconds: 4), () {
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (_) => login()), (route) => false);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold( //memperluas atau menempati seluruh layar perangkat
      body: Center(
          child:
              Hero(tag: "Logo", child: Image.asset('assets/image/simbol.png', width: 250, height: 250,))),
    );
  }
}
