import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class TabLabel extends StatelessWidget {
  const TabLabel(
    this.label,
    this.index,
    this.selectedIndex,
    this.onPressed, {
    super.key,
  });

  final String label;
  final int index;
  final int selectedIndex;
  final Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
            onPressed: onPressed,
            child: Text(
              label,
              style: const TextStyle(
                  color: Colors.white, fontSize: 14, height: 22 / 14),
            )),
        Container(
          margin: ResponsiveBreakpoints.of(context).largerThan(MOBILE)
              ? const EdgeInsets.only(top: 20)
              : const EdgeInsets.only(top: 5),
          width: 40,
          height: 2,
          color: selectedIndex == index ? const Color(0xFFFFC268) : null,
        )
      ],
    );
  }
}
