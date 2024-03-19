import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatelessWidget {
  final List<BottomNavBarItem> items;
  final int selectedIndex;
  final Function(int) onItemSelected;

  const CustomBottomNavBar({
    Key? key,
    required this.items,
    required this.selectedIndex,
    required this.onItemSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: const AutomaticNotchedShape(Border.symmetric()),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(items.length, (index) => _buildNavBarItem(index)),
      ),
    );
  }

  Widget _buildNavBarItem(int index) {
    return InkWell(
      onTap: () => onItemSelected(index),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        decoration: BoxDecoration(
          color: index == selectedIndex ? Colors.blue : Colors.transparent,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(items[index].icon, size: 24.0, color: Colors.white),
            if (items[index].label != null) Text(items[index].label!),
          ],
        ),
      ),
    );
  }
}

class BottomNavBarItem {
  final IconData icon;
  final String? label;

  const BottomNavBarItem({required this.icon, this.label});
}

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text('Bottom Nav Bar Demo'),
      ),
      body: Center(
        child: Text('This is the main content area'),
      ),
      bottomNavigationBar: CustomBottomNavBar(
        items: [
          BottomNavBarItem(icon: Icons.home, label: 'Home'),
          BottomNavBarItem(icon: Icons.explore, label: 'Explore'),
          BottomNavBarItem(icon: Icons.settings, label: 'Settings'),
        ],
        selectedIndex: 0, // Set the initial selected index
        onItemSelected: (index) => print('Selected item: $index'),
      ),
    ),
  ));
}
