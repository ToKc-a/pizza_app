import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';

class PizzaScreen extends StatefulWidget {
  const PizzaScreen({Key? key}) : super(key: key);

  @override
  _PizzaScreenState createState() => _PizzaScreenState();
}

enum Sauce { hot, sweetAndSour, cheesy }

class _PizzaScreenState extends State<PizzaScreen> {
  bool _cheese = false;
  int _isTonkoeTesto = 0;
  double _currentVal = 1;
  String _pizzaSize = 'Средняя';
  Sauce? _sauce = Sauce.hot;
  double _costPizza = 0;

  void _onSauceChanged(Sauce? value) {
    setState(() {
      _sauce = value;
    });
  }

  void _extraCheese(bool? val) {
    setState(() {
      _cheese = !_cheese;
    });
  }

  void _tipTesta(int? index) {
    setState(() {
      _isTonkoeTesto = index!;
    });
  }

  double _calculateCost() {
    _costPizza = 0;

    switch (_isTonkoeTesto) {
      case 0:
        _costPizza += 50;
        break;
      case 1:
        _costPizza += 100;
        break;
    }

    switch (_pizzaSize) {
      case 'Маленькая':
        _costPizza += 150;
        break;
      case 'Средняя':
        _costPizza += 200;
        break;
      case 'Большая':
        _costPizza += 300;
        break;
    }

    switch (_sauce) {
      case Sauce.cheesy:
        _costPizza += 40;
        break;
      case Sauce.hot:
        _costPizza += 80;
        break;
      case Sauce.sweetAndSour:
        _costPizza += 60;
        break;
    }

    _cheese == true ? _costPizza += 100 : _costPizza += 0;

    return _costPizza;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          child: SingleChildScrollView(
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
          Container(
            child: ToggleSwitch(
              minWidth: 300,
              minHeight: 34,
              cornerRadius: 36,
              inactiveBgColor: Color.fromRGBO(236, 239, 241, 1),
              inactiveFgColor: Color.fromRGBO(0, 0, 0, 4),
              fontSize: 16,
              totalSwitches: 2,
              initialLabelIndex: _isTonkoeTesto,
              labels: ['Обычное тесто', 'Тонкое тесто'],
              activeBgColor: [Color.fromRGBO(0, 121, 208, 1)],
              activeFgColor: Color.fromRGBO(255, 255, 255, 1),
              onToggle: (index) {
                _tipTesta(index);
              },
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Row(children: [
            SizedBox(
              width: 17,
            ),
            Text(
              'Размер: $_pizzaSize',
              style: TextStyle(fontSize: 21, fontWeight: FontWeight.w400),
            )
          ]),
          SizedBox(
            height: 5,
          ),
          Container(
            width: 360,
            height: 34,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(36),
              color: Color.fromRGBO(236, 239, 241, 1),
            ),
            child: SliderTheme(
              data: const SliderThemeData(
                activeTickMarkColor: Colors.white,
                inactiveTickMarkColor: Color(0xFF0079D0),
                tickMarkShape:
                RoundSliderTickMarkShape(tickMarkRadius: 2),
                thumbShape: RoundSliderThumbShape(
                  elevation: 5,
                  enabledThumbRadius: 5,
                ),
              ),
              child: Slider(
                  value: _currentVal,
                  max: 2,
                  divisions: 2,
                  onChanged: (double value) {
                    setState(() {
                      if (value == 0) {
                        _pizzaSize = 'Маленькая';
                        print('$_pizzaSize');
                      } else if (value == 1) {
                        _pizzaSize = 'Средняя';
                        print('$_pizzaSize');
                      } else {
                        _pizzaSize = 'Большая';
                        print('$_pizzaSize');
                      }
                      _currentVal = value;
                    });
                  }),
            ),
          ),
          const SizedBox(
            height: 13,
          ),
          Row(children: const [
            SizedBox(
              width: 17,
            ),
            Text(
              'Соус:',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Inter'),
            )
          ]),
          RadioListTile<Sauce>(
              controlAffinity: ListTileControlAffinity.trailing,
              activeColor: Colors.green,
              title: Text('Острый'),
              value: Sauce.hot,
              groupValue: _sauce,
              onChanged: _onSauceChanged),
          Divider(),
          RadioListTile<Sauce>(
              controlAffinity: ListTileControlAffinity.trailing,
              activeColor: Colors.green,
              title: Text('Кисло-сладкий'),
              value: Sauce.sweetAndSour,
              groupValue: _sauce,
              onChanged: _onSauceChanged),
          Divider(),
          RadioListTile<Sauce>(
              controlAffinity: ListTileControlAffinity.trailing,
              activeColor: Colors.green,
              title: Text('Сырный'),
              value: Sauce.cheesy,
              groupValue: _sauce,
              onChanged: _onSauceChanged),
          Divider(),
          SizedBox(
            width: 18,
          ),
          Container(
            width: 360,
            height: 56,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Color.fromRGBO(240, 240, 240, 1),
            ),
            child: Row(
              children: [
                SizedBox(
                  width: 6,
                ),
                const SizedBox(
                  width: 36,
                  height: 34,
                  child: Image(
                    image: AssetImage('assets/images/pizza_icon.png'),
                  ),
                ),
                SizedBox(
                  width: 40,
                ),
                const Text(
                  'Дополнительный сыр',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    fontFamily: "Inter",
                  ),
                ),
                SizedBox(
                  width: 40,
                ),
                Switch(value: _cheese, onChanged: _extraCheese),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(children: const [
            SizedBox(
              width: 17,
            ),
            Text(
              'Стоимость:',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Inter'),
            )
          ]),
          SizedBox(
            height: 10,
          ),
          Container(
            width: 360,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(36),
              color: Color.fromRGBO(240, 240, 240, 1),
            ),
            child: Center(
              child: Text(
                "Стоимость вашей пиццы - ${_calculateCost()} руб.",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Inter'),
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            width: 154,
            child: ElevatedButton(
              onPressed: () {},
              child: Text('Заказать', style: TextStyle(fontSize: 16)),
              style: ElevatedButton.styleFrom(
                primary: Color.fromRGBO(0, 121, 208, 1),
                  minimumSize: const Size.fromHeight(42),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(22))),
            ),
          ),
        ],
      ),
    ),)
    ,
    )
    ,
    );
  }
}
