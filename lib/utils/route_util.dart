import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RouteUtil {

  static pushPage(BuildContext context, Widget page) {
    return Navigator.of(context).push(_buildRoute(page));
  }

  static pushNamedAndRemoveUntil(BuildContext context, String routeName) {
    return Navigator.pushNamedAndRemoveUntil(context, routeName, (Route<dynamic> route) => true);
  }

  static pushReplacement(BuildContext context, Widget page) {
    return Navigator.of(context).pushReplacement(_buildRoute(page));
  }

  static pop<T>(BuildContext context, [ T result ]) {
    return Navigator.of(context).pop(result);
  }

  ///exit app
  static Future<void> exit() async {
    await SystemChannels.platform.invokeMethod('SystemNavigator.pop');
  }

  static Route _buildRoute(Widget page) {
    return new PageRouteBuilder(
      opaque: false,
      pageBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        return page;
      },
      transitionsBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation, Widget child) {
        return new FadeTransition(
          opacity: animation,
          child: new FadeTransition(
            opacity: new Tween<double>(begin: 0.5, end: 1.0).animate(animation),
            child: child,
          ),
        );
      },
    );
  }
}
