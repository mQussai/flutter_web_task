import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'grid_item_footer.dart';

class GridViewItem extends StatelessWidget {
  const GridViewItem({
    super.key,
    required this.index,
  });
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF171717),
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(
            image: AssetImage('assets/images/${index % 3 + 1}.png'),
            fit: BoxFit.fitWidth,
            alignment: Alignment.topCenter),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Align(
            alignment: AlignmentDirectional.topEnd,
            child: IconButton(
                onPressed: () {},
                icon: CircleAvatar(
                    backgroundColor: Colors.black.withOpacity(0.6),
                    child: const Icon(
                      Icons.more_horiz,
                      color: Colors.white,
                      size: 17,
                    ))),
          ),
          // const SizedBox(height: 116),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 3),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 3, horizontal: 12),
                      decoration: BoxDecoration(
                        color: const Color(0xFFC25F30).withOpacity(0.1),
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(
                          color: const Color(0xFFC25F30),
                          width: 0.5,
                        ),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Flexible(
                            child: Text('Pending Approval',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                // textScaler:
                                //     TextScaler.linear(0.70),
                                style: TextStyle(
                                    height: 22 / 14,
                                    fontSize: 14,
                                    color: Colors.white)),
                          ),
                          SizedBox(width: 2),
                          Icon(
                            Icons.keyboard_arrow_down,
                            color: Colors.white,
                            size: 16,
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Item titleItem titleItem titleItem",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        const SizedBox(height: 6),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SvgPicture.asset('assets/icons/calendar.svg'),
                            const SizedBox(width: 6),
                            const Flexible(
                              child: Text(
                                "Jan 16 - Jan 20, 2024",
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                // textScaler:
                                //     TextScaler.linear(0.70),
                                style: TextStyle(
                                    color: Color(0xFF999999), fontSize: 12),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Divider(
                indent: 15,
                endIndent: 15,
                color: Color(0xFF262626),
              ),
              const SizedBox(height: 12),
              const GridItemFooter(),
              const SizedBox(height: 24),
            ],
          )
        ],
      ),
    );
  }
}
