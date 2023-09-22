import 'package:flutter/material.dart';

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
                children: [
                  const SizedBox(height: 20),
                  MaterialButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/hra');
                    },
                    color: Colors.black38,
                    padding: const EdgeInsets.all(30),
                    minWidth: double.infinity,
                    child: const Text("HRA Calculator", style: TextStyle(fontSize: 20)),
                  ),
                  const SizedBox(height: 20),
                  MaterialButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/nps');
                    },
                    color: Colors.black38,
                    padding: const EdgeInsets.all(30),
                    minWidth: double.infinity,
                    child: const Text("NPS Calculator", style: TextStyle(fontSize: 20)),
                  ),
                  const SizedBox(height: 20),
                  MaterialButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/oldCapitalGain');
                    },
                    color: Colors.black38,
                    padding: const EdgeInsets.all(30),
                    minWidth: double.infinity,
                    child: const Text("Old Capital Gain Calculator", style: TextStyle(fontSize: 20)),
                  ),
                  const SizedBox(height: 20),
                  MaterialButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/capitalGain');
                    },
                    color: Colors.black38,
                    padding: const EdgeInsets.all(30),
                    minWidth: double.infinity,
                    child: const Text("Capital Gain Calculator", style: TextStyle(fontSize: 20)),
                  ),
                  const SizedBox(height: 20),
                  MaterialButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/tax');
                    },
                    color: Colors.black38,
                    padding: const EdgeInsets.all(30),
                    minWidth: double.infinity,
                    child: const Text("Tax Calculator", style: TextStyle(fontSize: 20)),
                  ),
                  const SizedBox(height: 20),
                  MaterialButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/form16');
                    },
                    color: Colors.black38,
                    padding: const EdgeInsets.all(30),
                    minWidth: double.infinity,
                    child: const Text("Form 16 Calculator", style: TextStyle(fontSize: 20)),
                  ),
                  const SizedBox(height: 20),
                  // HRACalculator(),
                  // Divider(height: 4, color: Colors.black,thickness: 6),
                  // NPSCalculator(),
                  // Divider(height: 4, color: Colors.black,thickness: 6),
                  // CapitalGainCalculator(),
                  // Divider(height: 4, color: Colors.black,thickness: 6),
                  // CapitalGains(),
                  // Divider(height: 4, color: Colors.black,thickness: 6),
                  // TaxCalculator(),
                  // Divider(height: 4, color: Colors.black,thickness: 6),
                  // UploadForm16(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}