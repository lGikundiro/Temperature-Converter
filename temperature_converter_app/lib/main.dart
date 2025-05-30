// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

void main() => runApp(const TemperatureConverterApp());

class TemperatureConverterApp extends StatelessWidget {
  const TemperatureConverterApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Temperature Converter',
      theme: ThemeData(
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: Colors.white,
        inputDecorationTheme: const InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
            foregroundColor: Colors.white,
            textStyle:
                const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
            elevation: 8,
            shadowColor: Colors.greenAccent,
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
          ),
        ),
      ),
      home: const TemperatureConverterScreen(),
    );
  }
}

enum ConversionType { fToC, cToF }

class TemperatureConverterScreen extends StatefulWidget {
  const TemperatureConverterScreen({Key? key}) : super(key: key);
  @override
  State<TemperatureConverterScreen> createState() =>
      _TemperatureConverterScreenState();
}

class _TemperatureConverterScreenState
    extends State<TemperatureConverterScreen> {
  ConversionType _conversionType = ConversionType.fToC;
  final TextEditingController _inputController = TextEditingController();
  String _convertedValue = '';
  final List<String> _history = [];

  @override
  void dispose() {
    _inputController.dispose();
    super.dispose();
  }

  void _convert() {
    final input = double.tryParse(_inputController.text);
    if (input == null) {
      setState(() => _convertedValue = 'Invalid input');
      return;
    }
    double result;
    String historyEntry;
    if (_conversionType == ConversionType.fToC) {
      result = (input - 32) * 5 / 9;
      _convertedValue = result.toStringAsFixed(2);
      historyEntry = 'F to C: $input ⇒ $_convertedValue';
    } else {
      result = input * 9 / 5 + 32;
      _convertedValue = result.toStringAsFixed(2);
      historyEntry = 'C to F: $input ⇒ $_convertedValue';
    }
    setState(() => _history.insert(0, historyEntry));
  }

  @override
  Widget build(BuildContext context) {
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return Scaffold(
      appBar: AppBar(title: const Text('Your Temperature Converter')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: isLandscape ? buildLandscapeLayout() : buildPortraitLayout(),
      ),
    );
  }

  Widget buildPortraitLayout() {
    return Center(
      child: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                color: Colors.green.withOpacity(0.2),
                blurRadius: 24,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              buildConversionSelector(),
              const SizedBox(height: 24),
              Row(
                children: [
                  Expanded(child: buildInputField()),
                  const SizedBox(width: 12),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Text('=',
                        style: TextStyle(
                            fontSize: 28,
                            color: Colors.black,
                            fontWeight: FontWeight.bold)),
                  ),
                  const SizedBox(width: 12),
                  Expanded(child: buildOutputField()),
                ],
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _convert,
                child: const Text('CONVERT'),
              ),
              const SizedBox(height: 24),
              const Text(
                'History of conversions:',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 16),
              ),
              const SizedBox(height: 8),
              Container(
                height: 120,
                decoration: BoxDecoration(
                  color: Colors.yellow[50],
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.green.withOpacity(0.08),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: buildHistoryList(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildLandscapeLayout() {
    return Center(
      child: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                color: Colors.green.withOpacity(0.2),
                blurRadius: 24,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              buildConversionSelector(),
              const SizedBox(height: 24),
              Row(
                children: [
                  Expanded(child: buildInputField()),
                  const SizedBox(width: 12),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Text('=',
                        style: TextStyle(
                            fontSize: 28,
                            color: Colors.black,
                            fontWeight: FontWeight.bold)),
                  ),
                  const SizedBox(width: 12),
                  Expanded(child: buildOutputField()),
                  const SizedBox(width: 24),
                  ElevatedButton(
                    onPressed: _convert,
                    child: const Text('CONVERT'),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              const Text(
                'History of conversions:',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 16),
              ),
              const SizedBox(height: 8),
              Container(
                height: 120,
                decoration: BoxDecoration(
                  color: Colors.yellow[50],
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.green.withOpacity(0.08),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: buildHistoryList(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildConversionSelector() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.yellow[50],
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.green.withOpacity(0.08),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          const Text('Conversion:',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
          const SizedBox(width: 16),
          Expanded(
            child: Row(
              children: [
                Radio<ConversionType>(
                  value: ConversionType.fToC,
                  groupValue: _conversionType,
                  activeColor: Colors.black,
                  onChanged: (value) {
                    setState(() => _conversionType = value!);
                  },
                ),
                const Text('Fahrenheit to Celsius',
                    style: TextStyle(color: Colors.black)),
                Radio<ConversionType>(
                  value: ConversionType.cToF,
                  groupValue: _conversionType,
                  activeColor: Colors.green,
                  onChanged: (value) {
                    setState(() => _conversionType = value!);
                  },
                ),
                const Text('Celsius to Fahrenheit',
                    style: TextStyle(color: Colors.black)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildInputField() {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.green.withOpacity(0.08),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextField(
        controller: _inputController,
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
        style: const TextStyle(
            color: Colors.green, fontWeight: FontWeight.bold, fontSize: 18),
        decoration: const InputDecoration(
          labelText: 'Enter temperature',
          labelStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.normal),
          border: OutlineInputBorder(),
        ),
      ),
    );
  }

  Widget buildOutputField() {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.green.withOpacity(0.08),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextField(
        controller: TextEditingController(text: _convertedValue),
        readOnly: true,
        style: const TextStyle(
            color: Colors.green, fontWeight: FontWeight.bold, fontSize: 18),
        decoration: const InputDecoration(
          labelText: 'Converted value',
          labelStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.w400),
          border: OutlineInputBorder(),
        ),
      ),
    );
  }

  Widget buildHistoryList() {
    return ListView.builder(
      itemCount: _history.length,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
          padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.green.withOpacity(0.05),
                blurRadius: 4,
                offset: const Offset(0, 1),
              ),
            ],
          ),
          child: Text(
            _history[index],
            style: const TextStyle(
                color: Colors.green, fontWeight: FontWeight.w500),
          ),
        );
      },
    );
  }
}
