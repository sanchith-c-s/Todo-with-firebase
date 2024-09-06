import 'package:flutter/material.dart';

class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          "Floating Action Button",
          style: TextStyle(color: Colors.black),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        shape: const OvalBorder(),
        onPressed: () {},
        child: const Icon(Icons.add),
        backgroundColor: const Color(0xFF5C4DFF),
        elevation: 0,
      ),
      bottomNavigationBar: Container(
        
        margin: const EdgeInsets.only(bottom: 20.0), // Adjust the margin to control the floating effect
        child: BottomAppBar(
          notchMargin: 3.0,
          shape: const CircularNotchedRectangle(),
          color: const Color(0xFF5C4DFF),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.max,
            children: [
              _buildNavItem(Icons.home, 0),
              _buildNavItem(Icons.shopping_cart, 1),
              const SizedBox(width: 40.0), // Space for the FAB
              _buildNavItem(Icons.favorite, 2),
              _buildNavItem(Icons.settings, 3),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, int index) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: Icon(icon),
          color: Colors.white,
          onPressed: () => _onItemTapped(index),
        ),
        if (_selectedIndex == index)
          Container(
            margin: const EdgeInsets.only(top: 2.0),
            width: 10.0,
            height: 6.0,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
          ),
      ],
    );
  }
}
