import 'package:flutter/material.dart';
import 'package:sliding_switch/sliding_switch.dart';

class PizzaScreen extends StatefulWidget {
  const PizzaScreen({Key? key}) : super(key: key);

  @override
  _PizzaScreenState createState() => _PizzaScreenState();
}

class _PizzaScreenState extends State<PizzaScreen> {
  bool _isTonkoeTesto = false;

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
              SlidingSwitch(
                value: _isTonkoeTesto,
                onChanged: (bool value) {},
                width: 300,
                height: 34,
                onTap: () {},
                onSwipe: () {},
                onDoubleTap: () {},
                textOff: 'Обычное тесто',
                textOn: 'Тонкое тесто',
                colorOn: Colors.white,
                colorOff: Colors.white,
                buttonColor: Colors.blue,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
