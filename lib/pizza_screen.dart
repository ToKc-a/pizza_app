import 'package:flutter/material.dart';
import 'package:pizza_app/utils/globalTheme.dart';
import 'package:toggle_switch/toggle_switch.dart';

class PizzaApp extends StatelessWidget {
  const PizzaApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: globalTheme1(),
      home: const PizzaScreen(),
    );
  }
}

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
        body: SingleChildScrollView(
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
              Text("Калькулятор пиццы",
                  style: Theme.of(context).textTheme.headline1),
              const SizedBox(
                height: 9,
              ),
              Text('Выберите параметры:',
                  style: Theme.of(context).textTheme.headline2),
              const SizedBox(
                height: 33,
              ),
              ToggleSwitch(
                minWidth: 300,
                minHeight: 34,
                cornerRadius: 36,
                inactiveBgColor: Theme.of(context).colorScheme.secondary,
                inactiveFgColor: Color.fromRGBO(0, 0, 0, 4),
                fontSize: 16,
                totalSwitches: 2,
                initialLabelIndex: _isTonkoeTesto,
                labels: ['Обычное тесто', 'Тонкое тесто'],
                activeBgColor: [Theme.of(context).colorScheme.primary],
                activeFgColor: Color.fromRGBO(255, 255, 255, 1),
                onToggle: (index) {
                  _tipTesta(index);
                },
              ),
              const SizedBox(
                height: 25,
              ),
              Row(children: [
                const SizedBox(
                  width: 17,
                ),
                Text(
                  'Размер: $_pizzaSize',
                  style: Theme.of(context).textTheme.headline2,
                )
              ]),
              const SizedBox(
                height: 5,
              ),
              Container(
                width: 360,
                height: 34,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(36),
                  color: Theme.of(context).colorScheme.secondary,
                ),
                child: SliderTheme(
                  data: SliderThemeData(
                    overlayColor: Theme.of(context).colorScheme.primary,
                    activeTrackColor: Theme.of(context).colorScheme.primary,
                    thumbColor: Theme.of(context).colorScheme.primary,
                    activeTickMarkColor: Colors.white,
                    inactiveTickMarkColor: Theme.of(context).colorScheme.primary,
                    tickMarkShape:
                        RoundSliderTickMarkShape(tickMarkRadius: 2),
                    thumbShape: const RoundSliderThumbShape(
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
              Row(children: [
                const SizedBox(
                  width: 17,
                ),
                Text(
                  'Соус:',
                  style: Theme.of(context).textTheme.headline2,
                )
              ]),
              RadioListTile<Sauce>(
                  controlAffinity: ListTileControlAffinity.trailing,
                  activeColor: Colors.green,
                  title: Text('Острый'),
                  value: Sauce.hot,
                  groupValue: _sauce,
                  onChanged: _onSauceChanged),
              const Divider(),
              RadioListTile<Sauce>(
                  controlAffinity: ListTileControlAffinity.trailing,
                  activeColor: Colors.green,
                  title: Text('Кисло-сладкий'),
                  value: Sauce.sweetAndSour,
                  groupValue: _sauce,
                  onChanged: _onSauceChanged),
              const Divider(),
              RadioListTile<Sauce>(
                  controlAffinity: ListTileControlAffinity.trailing,
                  activeColor: Colors.green,
                  title: Text('Сырный'),
                  value: Sauce.cheesy,
                  groupValue: _sauce,
                  onChanged: _onSauceChanged),
              const Divider(),
              const SizedBox(
                width: 18,
              ),
              Container(
                width: 360,
                height: 56,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Theme.of(context).colorScheme.secondary,
                ),
                child: Row(
                  children: [
                    const SizedBox(
                      width: 6,
                    ),
                    const SizedBox(
                      width: 36,
                      height: 34,
                      child: Image(
                        image: AssetImage('assets/images/pizza_icon.png'),
                      ),
                    ),
                    const SizedBox(
                      width: 40,
                    ),
                    Text(
                      'Дополнительный сыр',
                      style: Theme.of(context).textTheme.headline3
                    ),
                    const SizedBox(
                      width: 40,
                    ),
                    Switch(value: _cheese, onChanged: _extraCheese),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(children: [
                const SizedBox(
                  width: 17,
                ),
                Text(
                  'Стоимость:',
                  style: Theme.of(context).textTheme.headline2
                )
              ]),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: 360,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(36),
                  color: Theme.of(context).colorScheme.secondary,
                ),
                child: Center(
                  child: Text(
                    "Стоимость вашей пиццы - ${_calculateCost()} руб.",
                    style: Theme.of(context).textTheme.headline2
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                width: 154,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text('Заказать', style: Theme.of(context).textTheme.headline4),
                  style: ElevatedButton.styleFrom(
                      primary: Theme.of(context).colorScheme.primary,
                      minimumSize: const Size.fromHeight(42),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(22))),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
