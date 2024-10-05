import 'package:flutter/material.dart';
import 'package:flutter_task/views/add_item_screen.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../widgets/grid_view.dart';

class ItemsScreen extends StatelessWidget {
  const ItemsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          const Divider(
            height: 0.25,
            color: Color(0xFF999999),
          ),
          SizedBox(
            height: (ResponsiveBreakpoints.of(context).largerThan(MOBILE))
                ? 20
                : 16,
          ),
          Container(
            height: (ResponsiveBreakpoints.of(context).largerThan(MOBILE))
                ? 72
                : 40,
            margin: EdgeInsets.symmetric(
              vertical: MediaQuery.sizeOf(context).height * 16.5 / 958,
              horizontal: MediaQuery.sizeOf(context).width * 80 / 1440,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Items",
                  style: TextStyle(
                      fontSize:
                          (ResponsiveBreakpoints.of(context).largerThan(MOBILE))
                              ? 32
                              : 24,
                      color: Colors.white),
                ),
                Row(
                  children: [
                    IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {},
                      icon: CircleAvatar(
                        radius: (ResponsiveBreakpoints.of(context)
                                .largerThan(MOBILE))
                            ? 24
                            : 20,
                        backgroundColor: const Color(0xFF171717),
                        child: const Icon(
                          Icons.tune,
                          color: Colors.white,
                          size: 17,
                        ),
                      ),
                    ),
                    if (ResponsiveBreakpoints.of(context)
                        .largerThan(MOBILE)) ...[
                      VerticalDivider(
                          color: Colors.grey[850], indent: 12, endIndent: 12),
                      InkWell(
                        borderRadius: BorderRadius.circular(20),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const AddItemScreen()),
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24, vertical: 15),
                          decoration: BoxDecoration(
                            color: const Color(0xFFFFC268),
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: const Row(
                            children: [
                              Icon(Icons.add),
                              SizedBox(width: 8),
                              Text(
                                "Add a New Item",
                                style: TextStyle(fontSize: 14, height: 18 / 14),
                              ),
                            ],
                          ),
                        ),
                      )
                    ]
                  ],
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.symmetric(
                  horizontal: MediaQuery.sizeOf(context).width * 80 / 1440),
              child: const GridViewWidget(),
            ),
          )
        ],
      ),
    );
  }
}
