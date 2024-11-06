import 'package:alborada_demo/app/presentation/alborada_ui/icons/alborada_icons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Tabs extends StatefulWidget {
  const Tabs({super.key});

  @override
  State<Tabs> createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  String _selectedIcon = '';

  void _onIconTap(String iconName) {
    setState(() {
      _selectedIcon = iconName;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildIconText('Tous', AlboradaIcons.bars),
          _buildIconText('Solidarité', AlboradaIcons.solidarity),
          _buildIconText('Santé', AlboradaIcons.health),
          _buildIconText('Environnement', AlboradaIcons.environement),
        ],
      ),
    );
  }

  Widget _buildIconText(String iconName, IconData icon) {
    final isSelected = _selectedIcon == iconName;
    final color = isSelected ? Colors.black : Colors.grey;

    return GestureDetector(
      onTap: () => _onIconTap(iconName),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: color,
          ),
          const SizedBox(height: 6),
          LayoutBuilder(builder: (context, constraints) {
            final textPainter = TextPainter(
              text: TextSpan(
                text: iconName,
                style: const TextStyle(),
              ),
              maxLines: 1,
              textDirection: TextDirection.ltr,
            )..layout();
            final textWidth = textPainter.size.width;
            return Column(
              children: [
                Text(
                  iconName,
                  style: GoogleFonts.outfit(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: isSelected ? Colors.black : Colors.grey,
                  ),
                ),
                Container(
                  height: 2.0,
                  width: textWidth,
                  color: isSelected ? Colors.black : Colors.transparent,
                ),
              ],
            );
          }),
        ],
      ),
    );
  }
}
