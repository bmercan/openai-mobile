import 'package:flutter/material.dart';

import 'features/dall-e/history/view/historyview.dart';
import 'features/dall-e/home/view/homeview.dart';

class MainStructure extends StatefulWidget {
  const MainStructure({super.key});

  @override
  State<MainStructure> createState() => _MainStructureState();
}

class _MainStructureState extends State<MainStructure> {
  int _selectedIndex = 0;
  final List<Widget> _pages = [DallEHomeView(), const DallEHistoryView()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Dall-E 2")),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (value) {
          setState(() {
            _selectedIndex = value;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: "History"),
        ],
      ),
    );
  }
}
