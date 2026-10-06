import 'package:flutter/material.dart';
import 'package:ovo_slicing/homescreen.dart';
import 'package:ovo_slicing/profilescreen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _index = 0;

  // index: 0 Home, 1 Finance, 2 Pay (QRIS), 3 Inbox, 4 Profile
  dynamic _body() {
    switch (_index) {
      case 0:
        return const HomeScreen();
      case 4:
        return const ProfileScreen();
      default:
        return const Center(child: Text('Halaman belum dibuat'));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
      bottomNavigationBar: _bottomBar(),
    );
  }

  Widget _bottomBar() {
    return Container(
      height: 80,
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 8)],
      ),
      child: Row(
        children: [
          _navItem(0, Icons.home_rounded, 'Home'),
          _navItem(1, Icons.paid_rounded, 'Finance'),
          // Tombol tengah QRIS
          Expanded(
            child: GestureDetector(
              onTap: () {},
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 52,
                    height: 52,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        colors: [Color(0xFF7B4DEB)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: const Center(
                      child: Text('QRIS',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w900,
                              fontSize: 13)),
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text('Pay',
                      style: TextStyle(fontSize: 12, color: Colors.grey)),
                ],
              ),
            ),
          ),
          _navItem(3, Icons.notifications_rounded, 'Inbox'),
          _navItem(4, Icons.account_circle_rounded, 'Profile'),
        ],
      ),
    );
  }

  Widget _navItem(int i, IconData icon, String label) {
    final active = _index == i;
    final color = active ? kPurple : Colors.grey;
    return Expanded(
      child: InkWell(
        onTap: () => setState(() => _index = i),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: color, size: 30),
            const SizedBox(height: 4),
            Text(label,
                style: TextStyle(
                    fontSize: 12,
                    color: color,
                    fontWeight: active ? FontWeight.w600 : FontWeight.normal)),
          ],
        ),
      ),
    );
  }
}