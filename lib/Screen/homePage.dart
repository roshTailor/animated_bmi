import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {

  double _height = 0, _weight = 0, meter = 0;
  double bmi = 0;
  int female = 0, male = 0, select = 0, age = 2;
  String category = "";

  @override
  Widget build(BuildContext context) {
    double hght = MediaQuery.of(context).size.height;
    double wdth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "BMI Calculator",
        ),
        backgroundColor: const Color(0xFF851C51),
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
                children: [
                  ZoomIn(
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
                          color: select == 1
                              ? const Color(0xff3B3C4C)
                              : const Color(0xff1D1E33),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Column(
                          children: [
                            Icon(
                              Icons.female,
                              color: select == 1
                                  ? const Color(0xffEB1555)
                                  : Colors.white,
                              size: 100,
                            ),
                            const Text(
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
                  const Spacer(),
                  ZoomIn(
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
                          color: select == 2
                              ? const Color(0xff3B3C4C)
                              : const Color(0xff1D1E33),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Column(
                          children: [
                            Icon(
                              Icons.male,
                              color: select == 2
                                  ? Color(0xffEB1555)
                                  : Colors.white,
                              size: 100,
                            ),
                            const Text(
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
                height: hght / 40,
              ),
              ZoomIn(
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
                            const Text(
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
                            overlayShape:
                                RoundSliderOverlayShape(overlayRadius: 9),
                            thumbShape:
                                RoundSliderThumbShape(enabledThumbRadius: 8),
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
              SizedBox(
                height: hght / 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ZoomIn(
                    
                    child: Container(
                      height: hght / 4.5,
                      width: wdth / 2.3,
                      decoration: BoxDecoration(
                        color: const Color(0xff1D1E33),
                        borderRadius: BorderRadius.circular(7),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Text(
                            "Weight",
                            style: TextStyle(
                              fontSize: 20,
                              color: Color(0xffFFFFFF),
                            ),
                          ),
                          Text(
                            "${_weight.toInt()}",
                            style: const TextStyle(
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
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xff4C4F5E),
                                  ),
                                  child:const Text(
                                    "-",
                                    style: TextStyle(
                                      fontSize: 30,
                                      color: Color(0xff626473),
                                    ),
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
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xff4C4F5E),
                                  ),
                                  child: const Text(
                                    "+",
                                    style: TextStyle(
                                      fontSize: 30,
                                      color: Color(0xff6E6F7A),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  ZoomIn(
                    child: Container(
                      height: hght / 4.5,
                      width: wdth / 2.3,
                      decoration: BoxDecoration(
                        color: const Color(0xff1D1E33),
                        borderRadius: BorderRadius.circular(7),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Text(
                            "Age",
                            style: TextStyle(
                              fontSize: 20,
                              color: Color(0xffFFFFFF),
                            ),
                          ),
                          Text(
                            "$age",
                            style: const TextStyle(
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
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xff4C4F5E),
                                  ),
                                  child: const Text(
                                    "-",
                                    style: TextStyle(
                                      fontSize: 30,
                                      color: Color(0xff626473),
                                    ),
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
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xff4C4F5E),
                                  ),
                                  child: const Text(
                                    "+",
                                    style: TextStyle(
                                      fontSize: 30,
                                      color: Color(0xff6E6F7A),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              ZoomIn(
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xff1D1E33),
                    borderRadius: BorderRadius.circular(7),
                  ),
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        bmi.toStringAsFixed(2),
                        style: const TextStyle(
                          fontSize: 30,
                          color: Color(0xffFFFFFF),
                        ),
                      ),
                      Text(
                        category,
                        style: const TextStyle(
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
              ZoomIn(
                child:GestureDetector(
                  onTap: () {
                    setState(() {
                      if (select != 0 && age >= 2) {
                        meter = _height / 100;
                        bmi = _weight / (meter * meter);
                        if (bmi <= 18.5) {
                          category = "Underweight";
                        } else if (bmi >= 18.5 && bmi <= 24.9) {
                          category = "Normal weight";
                        } else if (bmi >= 25 && bmi <= 29.9) {
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
                    decoration: BoxDecoration(
                      color: const Color(0xffEB1555),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text(
                      "Calculate",
                      style: TextStyle(
                        color: Color(0xffFFFFFF),
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
