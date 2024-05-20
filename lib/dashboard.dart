import 'package:flutter/material.dart';
import 'package:perpustakaan/ButtomNavBar.dart';
import 'package:perpustakaan/page/buku/buku.dart';
import 'package:perpustakaan/page/profil/profil.dart';

class dashboard extends StatefulWidget {
  const dashboard({super.key});

  @override
  State<dashboard> createState() => _HomePageState();
}

class _HomePageState extends State<dashboard> {

  int _selectedIndex = 0;

  void navigatorBottomBar(int index){
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    buku(),

    profil(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      bottomNavigationBar: ButtomNavBar(onTabChange: (index) => navigatorBottomBar(index),),
      
      
      
      body: _pages[_selectedIndex],
    );
  }
}