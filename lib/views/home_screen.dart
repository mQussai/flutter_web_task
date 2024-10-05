import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_task/blocs/home_bloc/home_bloc.dart';
import 'package:flutter_task/blocs/home_bloc/home_event.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../utils/navigators.dart';
import '../widgets/app_bar_actions.dart';
import '../widgets/app_drawer.dart';
import '../widgets/tab_label.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, int>(builder: (context, tab) {
      List tabs = [
        TabLabel('Items', 0, tab,
            () => context.read<HomeBloc>().add(HomeTabChanged(0))),
        TabLabel('Pricing', 1, tab,
            () => context.read<HomeBloc>().add(HomeTabChanged(1))),
        TabLabel('Info', 2, tab,
            () => context.read<HomeBloc>().add(HomeTabChanged(2))),
        TabLabel('Tasks', 3, tab,
            () => context.read<HomeBloc>().add(HomeTabChanged(3))),
        TabLabel('Analytics', 4, tab,
            () => context.read<HomeBloc>().add(HomeTabChanged(4))),
      ];
      return Scaffold(
        drawer: (ResponsiveBreakpoints.of(context).largerThan(TABLET))
            ? null
            : AppDrawer(tabs),
        backgroundColor: Colors.black,
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          toolbarHeight: 76,
          backgroundColor: Colors.black,
          centerTitle: false,
          title: Container(
            margin: EdgeInsetsDirectional.only(
                start: (ResponsiveBreakpoints.of(context).largerThan(TABLET))
                    ? MediaQuery.sizeOf(context).width * 80 / 1440
                    : 0),
            child: SvgPicture.asset(
              'assets/icons/logo.svg',
              fit: BoxFit.scaleDown,
              alignment: Alignment.center,
            ),
          ),
          actions: [
            AppBarActions(tabs),
          ],
        ),
        body: IndexedStack(
          index: tab,
          children: buildScreens(),
        ),
      );
    });
  }
}
