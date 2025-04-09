import 'package:flutter/material.dart';

// class MyRoute extends MaterialPageRoute {
//   MyRoute({WidgetBuilder? builder}) : super(builder: builder!);

//   @override
//   Duration get transitionDuration => Duration(seconds: 3,);
// }


// import 'package:flutter/material.dart';

class MyRoute<T> extends PageRouteBuilder<T> {
  final Widget page;

  MyRoute({required this.page})
      : super(
          transitionDuration: const Duration(milliseconds: 500),
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            // Add your desired animation here
            return FadeTransition(opacity: animation, child: child);
            // You can use other transitions like SlideTransition, ScaleTransition, etc.
          },
        );
}