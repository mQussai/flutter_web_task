import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer(
    this.tabs, {
    super.key,
  });

  final List tabs;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xFF999999),
      child: ListView(
        children: [
          const SizedBox(height: 20),
          SvgPicture.asset(
            'assets/icons/logo.svg',
            fit: BoxFit.scaleDown,
            alignment: Alignment.center,
          ),
          const SizedBox(height: 20),
          ...tabs
        ],
      ),
    );
  }
}
