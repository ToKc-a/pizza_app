import 'package:flutter/material.dart';
import 'package:sliding_switch/sliding_switch.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';
import 'package:toggle_switch/toggle_switch.dart';

class PizzaScreen extends StatefulWidget {
  const PizzaScreen({Key? key}) : super(key: key);

  @override
  _PizzaScreenState createState() => _PizzaScreenState();
}

class _PizzaScreenState extends State<PizzaScreen> {
  int isTonkoeTesto = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          child: Column(
            children: [
              Row(
                children: const [
                  SizedBox(
                    width: 160,
                  ),
                  SizedBox(
                    width: 232,
                    height: 123,
                    child: Image(
                      image: AssetImage('assets/images/pizza_logo.png'),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 33,
              ),
              const Text(
                "Калькулятор пиццы",
                style: TextStyle(
                    fontSize: 36,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 9,
              ),
              const Text(
                'Выберите параметры:',
                style: TextStyle(
                    fontSize: 19,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 33,
              ),
              // SlidingSwitch(
              //   value: _isTonkoeTesto,
              //   onChanged: (bool value) {},
              //   width: 300,
              //   height: 34,
              //   onTap: () {},
              //   onSwipe: () {},
              //   onDoubleTap: () {},
              //   textOff: 'Обычное тесто',
              //   textOn: 'Тонкое тесто',
              //   colorOn: Colors.white,
              //   colorOff: Colors.white,
              //   buttonColor: Colors.blue,
              // ),
              // const SizedBox(
              //   height: 33,
              // ),
              // FlutterToggleTab(
              //     width: 300,
              //     height: 34,
              //     borderRadius: 36,
              //     labels: ["Обычное тесто", "Тонкое тесто"],
              //     selectedLabelIndex: (index) {},
              //     selectedTextStyle: TextStyle(
              //         color: Colors.white,
              //         fontSize: 16,
              //         fontWeight: FontWeight.w400),
              //     unSelectedTextStyle: TextStyle(
              //         color: Color(0x00000066),
              //         fontSize: 16,
              //         fontWeight: FontWeight.w400),
              //     selectedIndex: _isTonkoeTesto,
              // ),
              ToggleSwitch(
                minWidth: 300,
                minHeight: 34,
                cornerRadius: 36,
                inactiveBgColor: Color.fromRGBO(236, 239, 241, 1),
                inactiveFgColor: Color.fromRGBO(0, 0, 0, 4),
                fontSize: 16,
                totalSwitches: 2,
                initialLabelIndex: isTonkoeTesto,
                labels: ['Обычное тесто', 'Тонкое тесто'],
                activeBgColor: [Color.fromRGBO(0, 121, 208, 1)],
                activeFgColor: Color.fromRGBO(255, 255, 255, 1),
                onToggle: (index) {
                  print('switched to $index');
                },
              ),
              SizedBox()
            ],
          ),
        ),
      ),
    );
  }
}
