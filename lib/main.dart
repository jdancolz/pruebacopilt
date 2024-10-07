import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Sumar 2 Números'),
        ),
        body: SumTwoNumbers(),
      ),
    );
  }
}

class SumTwoNumbers extends StatefulWidget {
  @override
  _SumTwoNumbersState createState() => _SumTwoNumbersState();
}

class _SumTwoNumbersState extends State<SumTwoNumbers> {
  final TextEditingController _num1Controller = TextEditingController();
  final TextEditingController _num2Controller = TextEditingController();
  String _result = '';

  void _calculateSum() {
    final double num1 = double.tryParse(_num1Controller.text) ?? 0;
    final double num2 = double.tryParse(_num2Controller.text) ?? 0;
    setState(() {
      _result = (num1 + num2).toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextField(
            controller: _num1Controller,
            decoration: InputDecoration(labelText: 'Primer Número'),
            keyboardType: TextInputType.number,
          ),
          TextField(
            controller: _num2Controller,
            decoration: InputDecoration(labelText: 'Segundo Número'),
            keyboardType: TextInputType.number,
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: _calculateSum,
            child: Text('Calcular Suma'),
          ),
          SizedBox(height: 20),
          Text(
            'Resultado: $_result',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ],
      ),
    );
  }
}
