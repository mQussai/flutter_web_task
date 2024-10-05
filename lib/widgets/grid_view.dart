import 'package:flutter/widgets.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'grid_view_item.dart';

class GridViewWidget extends StatelessWidget {
  const GridViewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent:
                (ResponsiveBreakpoints.of(context).largerThan(MOBILE))
                    ? 243.25
                    : 343,
            mainAxisExtent:
                (ResponsiveBreakpoints.of(context).largerThan(MOBILE))
                    ? 322
                    : 314,
            mainAxisSpacing: 20,
            crossAxisSpacing: 16),
        itemCount: 8,
        itemBuilder: (context, index) {
          return GridViewItem(index: index);
        });
  }
}
