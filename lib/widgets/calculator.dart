import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  const Calculator({
    Key? key,
  }) : super(key: key);

  @override
  State<Calculator> createState() => _Calculator();
}

class _Calculator extends State<Calculator> {
  String history = '';
  String expresion = '';
  void onButtonPress(buttonText) {
    setState(() {
      expresion += buttonText;
    });
  }

  bool isOperator(String button) {
    if (button == 'C' ||
        button == '+/-' ||
        button == '%' ||
        button == '+' ||
        button == '-' ||
        button == 'X' ||
        button == '/' ||
        button == '=') {
      return true;
    } else {
      return false;
    }
  }

  List<String> buttons = [
    'C',
    '+/-',
    '%',
    '/',
    '7',
    '8',
    '9',
    'X',
    '4',
    '5',
    '6',
    '-',
    '1',
    '2',
    '3',
    '+',
    ',',
    '0',
    '00',
    '='
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      Expanded(
          flex: 2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                flex: 1,
                child: Container(
                    color: const Color.fromARGB(255, 232, 232, 232),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 20.0),
                        child: Text(
                          history,
                          style: const TextStyle(
                            fontSize: 28,
                            color: Color(0xFF545F61),
                          ),
                        ),
                      ),
                    )),
              ),
              Expanded(
                flex: 1,
                child: Container(
                    color: const Color.fromARGB(255, 232, 232, 232),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 20.0),
                        child: Text(
                          expresion,
                          style: const TextStyle(
                              fontSize: 48,
                              color: Color.fromARGB(255, 18, 18, 19)),
                        ),
                      ),
                    )),
              ),
            ],
          )),
      Expanded(
        flex: 6,
        child: Container(
          color: const Color.fromARGB(255, 232, 232, 232),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: GridView.builder(
              padding: const EdgeInsets.all(0.0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4),
              itemCount: buttons.length,
              itemBuilder: (BuildContext context, int index) => Padding(
                padding: const EdgeInsets.all(5.0),
                child: MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0)),
                    color: isOperator(buttons[index])
                        ? const Color(0xFF1D3354)
                        : const Color(0xFF467599),
                    textColor: Colors.white,
                    onPressed: () {
                      onButtonPress(buttons[index]);
                    },
                    child: Text(buttons[index],
                        style: const TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2))),
              ),
            ),
          ),
        ),
      ),
    ]));
  }
}
