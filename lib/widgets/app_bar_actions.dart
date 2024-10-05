import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_framework/responsive_framework.dart';

class AppBarActions extends StatelessWidget {
  const AppBarActions(
    this.tabs, {
    super.key,
  });

  final List tabs;
  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: const EdgeInsets.symmetric(vertical: 22),
      child: Row(
        children: [
          if (ResponsiveBreakpoints.of(context).largerThan(TABLET)) ...tabs,
          VerticalDivider(color: Colors.grey[850], indent: 5, endIndent: 5),
          PopupMenuButton(
              icon: SvgPicture.asset(
                'assets/icons/settings.svg',
                fit: BoxFit.cover,
                color: Colors.white,
              ),
              itemBuilder: (context) {
                return const [
                  PopupMenuItem(child: Text('data')),
                  PopupMenuItem(child: Text('data')),
                  PopupMenuItem(child: Text('data')),
                  PopupMenuItem(child: Text('data')),
                ];
              }),
          // VerticalDivider(color: Colors.grey[850]),
          PopupMenuButton(
              icon: SvgPicture.asset(
                'assets/icons/notification.svg',
                fit: BoxFit.cover,
                color: Colors.white,
              ),
              itemBuilder: (context) {
                return const [
                  PopupMenuItem(child: Text('data')),
                  PopupMenuItem(child: Text('data')),
                  PopupMenuItem(child: Text('data')),
                  PopupMenuItem(child: Text('data')),
                ];
              }),
          VerticalDivider(color: Colors.grey[850], indent: 5, endIndent: 5),
          TextButton(
            onPressed: () {},
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 16,
                  backgroundImage: AssetImage('assets/images/profile.png'),
                ),
                if (ResponsiveBreakpoints.of(context)
                    .largerThan(TABLET)) ...const [
                  SizedBox(width: 12),
                  Text(
                    'Mahmoud Qussai',
                    style: TextStyle(
                        color: Colors.white, fontSize: 14, height: 22 / 14),
                  ),
                  Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.white,
                  )
                ]
              ],
            ),
          ),
          if (ResponsiveBreakpoints.of(context).largerThan(TABLET))
            SizedBox(
              width: MediaQuery.of(context).size.width * 80 / 1440,
            )
        ],
      ),
    );
  }
}
