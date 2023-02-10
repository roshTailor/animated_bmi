import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  // late AnimationController animationController;
  // Animation? sizeAnimation;

  @override
  void initState() {
    // TODO: implement initState
    // animationController = AnimationController(vsync: this, duration: const Duration(seconds: 5));
    // sizeAnimation = Tween<double>(begin: 10, end: 50).animate(
    //   CurvedAnimation(
    //     parent: animationController!,
    //     curve: Curves.easeIn,
    //   ),
    // );
    // animationController!.addListener(() {
    //   setState(() {});
    // });
    // animationController.forward();
    super.initState();
  }

  double _height = 0, _weight = 0, meter = 0;
  double BMI = 0;
  int female = 0, male = 0, select = 0, age = 2;
  String category = "";

  @override
  Widget build(BuildContext context) {
    timeDilation = 5;
    double hght = MediaQuery.of(context).size.height;
    double wdth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "BMI Calculator",
        ),
        backgroundColor: Color(0xFF851C51),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF3F5751),
              Color(0xFF851C51),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FadeInLeft(
                    child: InkWell(
                      borderRadius: BorderRadius.circular(5),
                      onTap: () {
                        setState(() {
                          select = 1;
                        });
                      },
                      child: Container(
                        height: hght / 5,
                        width: wdth / 2.3,
                        decoration: BoxDecoration(
                          color: select == 1 ? const Color(0xff3B3C4C) : Color(0xff1D1E33),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Column(
                          children: [
                            Icon(
                              Icons.female,
                              color: select == 1 ? Color(0xffEB1555) : Colors.white,
                              size: 120,
                            ),
                            Text(
                              "Female",
                              style: TextStyle(
                                fontSize: 20,
                                color: Color(0xffFFFFFF),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  FadeInRight(
                    child: InkWell(
                      borderRadius: BorderRadius.circular(5),
                      onTap: () {
                        setState(() {
                          select = 2;
                        });
                      },
                      child: Container(
                        height: hght / 5,
                        width: wdth / 2.3,
                        decoration: BoxDecoration(
                          color: select == 2 ? const Color(0xff3B3C4C) : Color(0xff1D1E33),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Column(
                          children: [
                            Icon(
                              Icons.male,
                              color: select == 2 ? Color(0xffEB1555) : Colors.white,
                              size: 120,
                            ),
                            Text(
                              "Male",
                              style: TextStyle(
                                fontSize: 20,
                                color: Color(0xffFFFFFF),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: hght / 30,
              ),
              FadeIn(
                child: Container(
                  height: hght / 6,
                  width: wdth / 0.9,
                  decoration: BoxDecoration(
                    color: const Color(0xff1D1E33),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "HEIGHT",
                          style: TextStyle(
                            fontSize: 25,
                            color: Color(0xff626473),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "${_height.toInt()}",
                              style: const TextStyle(
                                color: Color(0xffFFFFFF),
                                fontSize: 50,
                              ),
                            ),
                            Text(
                              "cm",
                              style: TextStyle(
                                fontSize: 15,
                                color: Color(0xff626473),
                              ),
                            ),
                          ],
                        ),
                        SliderTheme(
                          data: const SliderThemeData(
                            trackHeight: 1,
                            overlayShape: RoundSliderOverlayShape(overlayRadius: 9),
                            thumbShape: RoundSliderThumbShape(enabledThumbRadius: 8),
                            thumbColor: Color(0xffEB1555),
                            inactiveTrackColor: Color(0xff555555),
                            activeTrackColor: Color(0xffF5C1D1),
                          ),
                          child: Slider(
                            min: 0,
                            max: 200,
                            onChanged: (value) {
                              setState(() {
                                _height = value;
                              });
                            },
                            value: _height,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Expanded(
                flex: 2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: hght / 4,
                      width: wdth / 2.3,
                      decoration: BoxDecoration(
                        color: Color(0xff1D1E33),
                        borderRadius: BorderRadius.circular(7),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "Weight",
                            style: TextStyle(
                              fontSize: 15,
                              color: Color(0xffFFFFFF),
                            ),
                          ),
                          Text(
                            "${_weight.toInt()}",
                            style: TextStyle(
                              fontSize: 40,
                              color: Color(0xffFFFFFF),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    if (_weight.toInt() <= 0) {
                                      _weight = 0;
                                    } else {
                                      _weight--;
                                    }
                                  });
                                },
                                child: Container(
                                  height: 50,
                                  width: 50,
                                  alignment: Alignment.center,
                                  child: Text(
                                    "-",
                                    style: TextStyle(
                                      fontSize: 30,
                                      color: Color(0xff626473),
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xff4C4F5E),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    _weight++;
                                  });
                                },
                                child: Container(
                                  height: 50,
                                  width: 50,
                                  alignment: Alignment.center,
                                  child: Text(
                                    "+",
                                    style: TextStyle(
                                      fontSize: 30,
                                      color: Color(0xff6E6F7A),
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xff4C4F5E),
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: hght / 4,
                      width: wdth / 2.3,
                      decoration: BoxDecoration(
                        color: Color(0xff1D1E33),
                        borderRadius: BorderRadius.circular(7),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "Age",
                            style: TextStyle(
                              fontSize: 15,
                              color: Color(0xffFFFFFF),
                            ),
                          ),
                          Text(
                            "$age",
                            style: TextStyle(
                              fontSize: 40,
                              color: Color(0xffFFFFFF),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    if (age <= 2) {
                                      age = 2;
                                    } else {
                                      age--;
                                    }
                                  });
                                },
                                child: Container(
                                  height: 50,
                                  width: 50,
                                  alignment: Alignment.center,
                                  child: Text(
                                    "-",
                                    style: TextStyle(
                                      fontSize: 30,
                                      color: Color(0xff626473),
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xff4C4F5E),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    age++;
                                  });
                                },
                                child: Container(
                                  height: 50,
                                  width: 50,
                                  alignment: Alignment.center,
                                  child: Text(
                                    "+",
                                    style: TextStyle(
                                      fontSize: 30,
                                      color: Color(0xff6E6F7A),
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xff4C4F5E),
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                flex: 1,
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xff1D1E33),
                    borderRadius: BorderRadius.circular(7),
                  ),
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "${BMI.toStringAsFixed(2)}",
                        style: TextStyle(
                          fontSize: 30,
                          color: Color(0xffFFFFFF),
                        ),
                      ),
                      Text(
                        "$category",
                        style: TextStyle(
                          fontSize: 20,
                          color: Color(0xffFFFFFF),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                flex: 1,
                child: InkWell(
                  borderRadius: BorderRadius.circular(40),
                  onTap: () {
                    setState(() {
                      if (select != 0 && age >= 2) {
                        meter = _height / 100;
                        BMI = _weight / (meter * meter);
                        if (BMI <= 18.5) {
                          category = "Underweight";
                        } else if (BMI >= 18.5 && BMI <= 24.9) {
                          category = "Normal weight";
                        } else if (BMI >= 25 && BMI <= 29.9) {
                          category = "Overweight";
                        } else {
                          category = "Obesity";
                        }
                      }
                    });
                  },
                  child: Container(
                    height: 60,
                    //width: 200,
                    alignment: Alignment.center,
                    child: Text(
                      "Calculate",
                      style: TextStyle(
                        color: Color(0xffFFFFFF),
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: Color(0xffEB1555),
                      borderRadius: BorderRadius.circular(40),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),

      // body: Center(
      //   child: AnimatedBuilder(
      //     animation: animationController,
      //     builder: (BuildContext context, Widget? child) {
      //       return Hero(
      //           tag: "tag",
      //           child: Container(
      //             height: sizeAnimation!.value,
      //             width: sizeAnimation!.value,
      //             color: Colors.cyanAccent,
      //           ));
      //     },
      //   ),
      // ),
    );
  }
}
