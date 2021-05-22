import 'package:flutter/material.dart';

class RouterNavigation {

  // Assign this variable to a property named navigatorKey in MaterialApp EX: navigatorKey: RouterNavigation.navigatorKey
  static final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();

  // Use this if you want to push to a screen
  static Future<dynamic> navigateTo(Widget page) => navigatorKey.currentState.push(_materialPageRoute(page));

  // Use this if you want to push and pop all screens
  static Future<dynamic> navigateAndPopAll(Widget page) => navigatorKey.currentState.pushAndRemoveUntil(_materialPageRoute(page),(_)=> false,);

  // Use this if you want to push and pop all screens except the first screen
  static Future<dynamic> navigateAndPopUntilFirstPage(Widget page) => navigatorKey.currentState.pushAndRemoveUntil(_materialPageRoute(page),(route) => route.isFirst);

  // This is just a code refactor
  static Route<dynamic> _materialPageRoute(Widget page)=> MaterialPageRoute(builder: (_) => page,);

  // Assign this function to a property named onGenerateRoute in MaterialApp EX: onGenerateRoute: RouterNavigation.onGenerateRoute
  static Route<dynamic> onGenerateRoute(RouteSettings settings)=> null;

  // HOW TO USE ::
  // RouterNavigation.navigate(HomeView());
}