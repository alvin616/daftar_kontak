
import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';

import 'contact_screen.dart';
import 'search_screen.dart';
import 'profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  final List<Widget> pages = const [
    ContactScreen(),
    SearchScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: selectedIndex,
        children: pages,
      ),
      bottomNavigationBar: ConvexAppBar(
        backgroundColor: const Color(0xFF8FAF9D),
        activeColor: Colors.white,
        color: const Color(0xFFE8F0EA),
        style: TabStyle.react,
        initialActiveIndex: 0,
        items: const [
          TabItem(
            icon: Icons.contacts_rounded,
            title: 'Kontak',
          ),
          TabItem(
            icon: Icons.search_rounded,
            title: 'Cari',
          ),
          TabItem(
            icon: Icons.person_rounded,
            title: 'Profil',
          ),
        ],
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
      ),
    );
  }
}
