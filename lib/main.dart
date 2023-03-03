import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: CalculadoraIMC(),
  ));
}

class CalculadoraIMC extends StatefulWidget {
  @override
  _CalculadoraIMCState createState() => _CalculadoraIMCState();
}

class _CalculadoraIMCState extends State<CalculadoraIMC> {
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();

  double _imc = 0.0;

  void _calculateIMC() {
    double height = double.parse(_heightController.text) / 100.0;
    double weight = double.parse(_weightController.text);
    double imc = weight / (height * height);
    setState(() {
      _imc = imc;
    });
  }

  String _interpretIMC() {
    if (_imc < 18.5) {
      return 'Abaixo do peso';
    } else if (_imc < 25) {
      return 'Peso normal';
    } else if (_imc < 30) {
      return 'Sobrepeso';
    } else if (_imc < 35) {
      return 'Obesidade grau I';
    } else if (_imc < 40) {
      return 'Obesidade grau II';
    } else {
      return 'Obesidade grau III';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora de IMC'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _heightController,
              decoration: InputDecoration(
                labelText: 'Altura (cm)',
              ),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _weightController,
              decoration: InputDecoration(
                labelText: 'Peso (kg)',
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _calculateIMC,
              child: Text('Calcular'),
            ),
            SizedBox(height: 16),
            Text(
              'Seu IMC é ${_imc.toStringAsFixed(1)}',
              style: TextStyle(fontSize: 24),
            ),
            Text(
              _interpretIMC(),
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
