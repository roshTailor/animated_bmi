import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late AnimationController animationController;
  Animation? sizeAnimation;

  @override
  void initState() {
    // TODO: implement initState
    animationController = AnimationController(vsync: this, duration: const Duration(seconds: 5));
    sizeAnimation = Tween<double>(begin: 10, end: 50).animate(
      CurvedAnimation(
        parent: animationController!,
        curve: Curves.easeIn,
      ),
    );
    animationController!.addListener(() {
      setState(() {});
    });
    animationController.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    timeDilation = 10;

    return Scaffold(
        appBar: AppBar(
          title: Text(
            "BMI Calculator",
            style: TextStyle(fontSize: sizeAnimation!.value),
          ),
        ),
        body: Center(
          child: AnimatedBuilder(
            animation: animationController,
            builder: (BuildContext context, Widget? child) {
              return Hero(
                  tag: "tag",
                  child: Container(
                    height: sizeAnimation!.value,
                    width: sizeAnimation!.value,
                    color: Colors.cyanAccent,
                  ));
            },
          ),
        ));
  }
}
