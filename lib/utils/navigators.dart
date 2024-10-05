import 'package:flutter/material.dart';
import 'package:flutter_task/views/analytics_screen.dart';
import 'package:flutter_task/views/items_screen.dart';
import 'package:flutter_task/views/info_screen.dart';
import 'package:flutter_task/views/pricing_screen.dart';
import 'package:flutter_task/views/tasks_screen.dart';

List<GlobalKey<NavigatorState>> navigatorKeys = [
  GlobalKey<NavigatorState>(),
  GlobalKey<NavigatorState>(),
  GlobalKey<NavigatorState>(),
  GlobalKey<NavigatorState>(),
  GlobalKey<NavigatorState>(),
];

List<Widget> buildScreens() {
  return [
    Navigator(
      key: navigatorKeys[0],
      onGenerateRoute: (settings) => MaterialPageRoute(builder: (context) {
        return const ItemsScreen();
      }),
    ),
    Navigator(
      key: navigatorKeys[1],
      onGenerateRoute: (settings) => MaterialPageRoute(builder: (context) {
        return const PricingScreen();
      }),
    ),
    Navigator(
      key: navigatorKeys[2],
      onGenerateRoute: (settings) => MaterialPageRoute(builder: (context) {
        return const InfoScreen();
      }),
    ),
    Navigator(
      key: navigatorKeys[3],
      onGenerateRoute: (settings) => MaterialPageRoute(builder: (context) {
        return const TasksScreen();
      }),
    ),
    Navigator(
      key: navigatorKeys[4],
      onGenerateRoute: (settings) => MaterialPageRoute(builder: (context) {
        return const AnalyticsScreen();
      }),
    )
  ];
}
