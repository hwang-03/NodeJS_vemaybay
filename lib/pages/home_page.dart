import 'package:flutter/material.dart';
import '../components/elevated_button.dart';
import '../components/text_field.dart';
import 'package:app_solve/utils/extension.dart';
import 'package:app_solve/utils/solve.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController aController = TextEditingController();
  TextEditingController bController = TextEditingController();
  TextEditingController cController = TextEditingController();

  String solutions = '';
  String? errorA;
  String? errorB;
  String? errorC;

  bool _validateInput() {
    errorA = _validateCoefficient(aController.text.trim(), 'A');
    errorB = _validateCoefficient(bController.text.trim(), 'B');
    errorC = _validateCoefficient(cController.text.trim(), 'C');

    setState(() {});
    return errorA == null && errorB == null && errorC == null;
  }

  String? _validateCoefficient(String value, String field) {
    if (value.isEmpty) {
      return 'Hệ số $field không được để trống';
    }
    if (double.tryParse(value) == null) {
      return 'Hệ số $field phải là số';
    }
    return null;
  }

  void _calculateSolve() {
    if (_validateInput()) {
      double a = double.parse(aController.text.trim());
      double b = double.parse(bController.text.trim());
      double c = double.parse(cController.text.trim());

      (double?, double?)? result = Solve.solve(a, b, c);
      if (result == null) {
        solutions = 'Phương Trình Vô Số Nghiệm';
      } else if (result == (null, null)) {
        solutions = 'Phương Trình Vô Nghiệm';
      } else if (result.$1 != null && result.$2 == null) {
        solutions = 'Nghiệm X1= ${result.$1?.format}';
      } else {
        solutions =
            'Nghiệm X1= ${result.$1?.format} ; Nghiệm X2= ${result.$2?.format}';
      }

      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.menu,
          size: 32.0,
          color: Colors.red,
        ),
        title: const Text('App Solve'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0)
              .copyWith(top: 25.0, bottom: 30.0),
          child: Column(
            children: [
              const Text(
                'Solving Quadratic Equations',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 26.0,
                ),
              ),
              DoubleExt(42.0).sizeHeight,
              FormTextField(
                controller: aController,
                hintText: 'Enter A',
                labelText: 'Enter A',
                errorText: errorA,
                textInputAction: TextInputAction.next,
              ),
              DoubleExt(42.0).sizeHeight,
              FormTextField(
                controller: bController,
                hintText: 'Enter B',
                labelText: 'Enter B',
                errorText: errorB,
                textInputAction: TextInputAction.next,
              ),
              DoubleExt(42.0).sizeHeight,
              FormTextField(
                controller: cController,
                hintText: 'Enter C',
                labelText: 'Enter C',
                errorText: errorC,
                textInputAction: TextInputAction.done,
              ),
              DoubleExt(48.0).sizeHeight,
              FormElevatedButton(
                text: 'Calculate',
                onPressed: _calculateSolve,
              ),
              DoubleExt(30.0).sizeHeight,
              Container(
                width: 3000,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(18.0),
                  border: Border.all(
                    color: Colors.blue,
                    width: 2.0,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(7.7),
                  child: Text(
                    solutions,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
