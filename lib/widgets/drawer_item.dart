import 'package:flutter/material.dart';

class DrawerItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final int index;
  final Function(int) onTap;
  final int selectedIndex;

  const DrawerItem({
    required this.icon,
    required this.title,
    required this.index,
    required this.onTap,
    required this.selectedIndex,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      selected: selectedIndex == index,
      selectedTileColor: Colors.blue[100],
      onTap: () {
        onTap(index);
        Navigator.pop(context);
      },
    );
  }
}
