import 'package:flutter/material.dart';
import 'package:tax/capital_gain_calculator.dart';
import 'package:tax/form16/upload_form16_a.dart';
import 'package:tax/hra_calculator.dart';
import 'package:tax/nps_calculator.dart';
import 'package:tax/tax_calculator.dart';

class AllCalculator extends StatefulWidget {
  const AllCalculator({super.key});

  @override
  State<AllCalculator> createState() => _AllCalculatorState();
}

class _AllCalculatorState extends State<AllCalculator> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  HRACalculator(),
                  Divider(height: 4, color: Colors.black,thickness: 6),
                  NPSCalculator(),
                  Divider(height: 4, color: Colors.black,thickness: 6),
                  CapitalGainCalculator(),
                  // Divider(height: 4, color: Colors.black,thickness: 6),
                  // CapitalGains(),
                  Divider(height: 4, color: Colors.black,thickness: 6),
                  TaxCalculator(),
                  Divider(height: 4, color: Colors.black,thickness: 6),
                  UploadForm16(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}