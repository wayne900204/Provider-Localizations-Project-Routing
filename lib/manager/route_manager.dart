import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider_study/pages/first_pages.dart';
import 'package:provider_study/pages/second_pages.dart';
import 'package:provider_study/pages/third_pages.dart';
import 'package:provider_study/route_animation.dart';

class RouteName {
  static const String splash = 'splash';
  static const String tab = '/';
  static const String homeSecondFloor = 'homeSecondFloor';
}

class MyRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.splash:
        return NoAnimRouteBuilder(FirstPage());
      case RouteName.tab:
        return NoAnimRouteBuilder(SecondPage());
      case RouteName.homeSecondFloor:
        return SlideTopRouteBuilder(ThirdPage());
      default:
        return CupertinoPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('No route defined for ${settings.name}'),
                  ),
                ));
    }
  }
}

/// Pop路由
class PopRoute extends PopupRoute {
  final Duration _duration = Duration(milliseconds: 300);
  Widget child;

  PopRoute({@required this.child});

  @override
  Color get barrierColor => null;

  @override
  bool get barrierDismissible => true;

  @override
  String get barrierLabel => null;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return child;
  }

  @override
  Duration get transitionDuration => _duration;
}
