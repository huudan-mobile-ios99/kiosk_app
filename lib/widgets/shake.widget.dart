
import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Shake'),
        ),
        body: Padding(padding: const EdgeInsets.all(32.0), child: MyHomePage()),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);
  // 1. declare a GlobalKey
  final shakeKey = GlobalKey<ShakeWidgetState>();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 300,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 16),
            TextField(
              controller: TextEditingController(text: 'abc@email.com'),
              decoration: const InputDecoration(hintText: 'Email address'),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: TextEditingController(text: '1234'),
              obscureText: true,
              decoration: const InputDecoration(hintText: 'Password'),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 48,
              // 2. shake the widget via the GlobalKey when a button is pressed
              child: ElevatedButton(
                child: const Text('Sign In', style: TextStyle(fontSize: 20)),
                onPressed: () => shakeKey.currentState?.shake(),
              ),
            ),
            const SizedBox(height: 16),
            // 3. Add a parent ShakeWidget to the child widget we want to animate
            ShakeWidget(
              // 4. pass the GlobalKey as an argument
              key: shakeKey,
              // 5. configure the animation parameters
              shakeCount: 3,
              shakeOffset: 10,
              shakeDuration: const Duration(milliseconds: 500),
              // 6. Add the child widget that will be animated
              child: const Text(
                'Invalid credentials',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.red,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

abstract class AnimationControllerState<T extends StatefulWidget>
    extends State<T> with SingleTickerProviderStateMixin {
  AnimationControllerState(this.animationDuration);
  final Duration animationDuration;
  late final animationController =
      AnimationController(vsync: this, duration: animationDuration);

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}

class ShakeWidget extends StatefulWidget {
  const ShakeWidget({
    Key? key,
    required this.child,
    required this.shakeOffset,
    this.shakeCount = 3,
    this.shakeDuration = const Duration(milliseconds: 400),
  }) : super(key: key);
  final Widget child;
  final double shakeOffset;
  final int shakeCount;
  final Duration shakeDuration;

  @override
  ShakeWidgetState createState() => ShakeWidgetState(shakeDuration);
}

class ShakeWidgetState extends AnimationControllerState<ShakeWidget> {
  ShakeWidgetState(Duration duration) : super(duration);

  @override
  void initState() {
    super.initState();
    animationController.addStatusListener(_updateStatus);
  }

  @override
  void dispose() {
    animationController.removeStatusListener(_updateStatus);
    super.dispose();
  }

  void _updateStatus(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      animationController.reset();
    }
  }

  void shake() {
    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    // 1. return an AnimatedBuilder
    return AnimatedBuilder(
      // 2. pass our custom animation as an argument
      animation: animationController,
      // 3. optimization: pass the given child as an argument
      child: widget.child,
      builder: (context, child) {
        final sineValue =
            sin(widget.shakeCount * 2 * pi * animationController.value);
        return Transform.translate(
          // 4. apply a translation as a function of the animation value
          offset: Offset(sineValue * widget.shakeOffset, 0),
          // 5. use the child widget
          child: child,
        );
      },
    );
  }
}