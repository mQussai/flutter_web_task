import 'package:flutter/material.dart';

class GridItemFooter extends StatelessWidget {
  const GridItemFooter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 60,
            child: Stack(
              alignment: AlignmentDirectional.centerStart,
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                          width: 0.6, color: const Color(0xFF262626)),
                      image: const DecorationImage(
                          image: AssetImage('assets/images/profile.png'))),
                ),
                PositionedDirectional(
                  start: 12,
                  child: Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                            width: 0.6, color: const Color(0xFF262626)),
                        image: const DecorationImage(
                            image: AssetImage('assets/images/profile.png'))),
                  ),
                ),
                PositionedDirectional(
                  start: 24,
                  child: Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                            width: 0.6, color: const Color(0xFF262626)),
                        image: const DecorationImage(
                            image: AssetImage('assets/images/profile.png'))),
                  ),
                ),
                PositionedDirectional(
                  start: 36,
                  child: Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                        color: const Color(0xFF262626),
                        shape: BoxShape.circle,
                        border: Border.all(
                            width: 0.6, color: const Color(0xFF262626))),
                    child: const Center(
                      child: Text(
                        "+6",
                        style:
                            TextStyle(fontSize: 8.4, color: Color(0xFFFFC268)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 4),
          const Flexible(
            child: Text(
              '4 unfinished tasks',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textWidthBasis: TextWidthBasis.parent,
              style: TextStyle(
                  height: 18 / 12, color: Color(0xFF999999), fontSize: 12),
            ),
          )
        ],
      ),
    );
  }
}
