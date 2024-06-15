import 'package:calculadora/app/controller/calculadora_controller.dart';
import 'package:flutter/material.dart';

class CalculadoraPage extends StatefulWidget {
  const CalculadoraPage({super.key});

  @override
  State<CalculadoraPage> createState() => _CalculadoraPageState();
}

class _CalculadoraPageState extends State<CalculadoraPage> {
  CalculadoraController controller = CalculadoraController.instance;
  final TextEditingController calcController = TextEditingController();

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    calcController.text = controller.calc;
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        const SizedBox(
          height: 40,
        ),
        TextFormField(
          readOnly: true,
          controller: calcController,
          decoration: const InputDecoration(
            contentPadding: EdgeInsets.all(10),
            hintText: '0',
            hintStyle: TextStyle(
              fontSize: 50,
              fontWeight: FontWeight.w500,
            ),
          ),
          style: const TextStyle(
            fontSize: 50,
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.right,
        ),
        Row(
          children: [
            Digit('AC'),
            Digit('+/-'),
            Digit('%'),
            Digit('/'),
          ],
        ),
        Row(
          children: [
            Digit('7'),
            Digit('8'),
            Digit('9'),
            Digit('x'),
          ],
        ),
        Row(
          children: [
            Digit('4'),
            Digit('5'),
            Digit('6'),
            Digit('-'),
          ],
        ),
        Row(
          children: [
            Digit('1'),
            Digit('2'),
            Digit('3'),
            Digit('+'),
          ],
        ),
        Row(
          children: [
            Digit('0'),
            Digit(''),
            Digit(','),
            Digit('='),
          ],
        ),
      ],
    ));
  }
}

class Digit extends StatelessWidget {
  Digit(this.digit, {super.key});

  final String digit;
  final CalculadoraController controller = CalculadoraController.instance;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        child: InkWell(
          onTap: () {
            if ((controller.calc.endsWith('+') ||
                    controller.calc.endsWith('-') ||
                    controller.calc.endsWith('x') ||
                    controller.calc.endsWith('/')) &&
                (digit == '+' ||
                    digit == '-' ||
                    digit == 'x' ||
                    digit == '/' ||
                    digit == ',' ||
                    digit == '=')) {
              return;
            }
            if (digit == 'AC') {
              return controller.clear();
            } else if (digit == '=') {
              return controller.calculate();
            } else {
              return controller.addDigit(digit);
            }
          },
          child: Ink(
              height: 100,
              color: int.tryParse(digit) != null ? Colors.grey : Colors.orange,
              child: Center(
                child: Text(
                  digit,
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              )),
        ),
      ),
    );
  }
}
