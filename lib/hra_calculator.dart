import 'dart:math';

import 'package:flutter/material.dart';

class HRACalculator extends StatefulWidget {
  const HRACalculator({Key? key}) : super(key: key);

  @override
  State<HRACalculator> createState() => _HRACalculatorState();
}

class _HRACalculatorState extends State<HRACalculator> {

  TextEditingController basicSalaryTextEditingController = TextEditingController();
  TextEditingController hraTextEditingController = TextEditingController();
  TextEditingController totalRentTextEditingController = TextEditingController();
  String cityType = "metro";
  double hraReceived = 0;
  double basic = 0;
  double rentPaid = 0;
  double hraExemption = 0;
  double hraTaxable = 0;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: const Text("HRA Calculator"),
      expandedCrossAxisAlignment: CrossAxisAlignment.start,
      childrenPadding: const EdgeInsets.symmetric(horizontal: 20),
      tilePadding: EdgeInsets.zero,
      children: [
        TextField(
          controller: basicSalaryTextEditingController,
          keyboardType: TextInputType.number,
          style: const TextStyle(color: Colors.black),
          decoration: InputDecoration(
              labelText: "Basic Salary",
              counterText: "",
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                  borderSide: const BorderSide(color: Colors.grey)
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: const BorderSide(color: Colors.grey),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: const BorderSide(color: Colors.grey),
              ),
              focusColor: Colors.grey
          ),
        ),
        const SizedBox(height: 20),
        TextField(
          controller: hraTextEditingController,
          keyboardType: TextInputType.number,
          style: const TextStyle(color: Colors.black),
          decoration: InputDecoration(
              labelText: "House Rent Allowance",
              counterText: "",
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                  borderSide: const BorderSide(color: Colors.grey)
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: const BorderSide(color: Colors.grey),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: const BorderSide(color: Colors.grey),
              ),
              focusColor: Colors.grey
          ),
        ),
        const SizedBox(height: 20),
        TextField(
          controller: totalRentTextEditingController,
          keyboardType: TextInputType.number,
          style: const TextStyle(color: Colors.black),
          decoration: InputDecoration(
              labelText: "Total Rent Paid",
              counterText: "",
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                  borderSide: const BorderSide(color: Colors.grey)
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: const BorderSide(color: Colors.grey),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: const BorderSide(color: Colors.grey),
              ),
              focusColor: Colors.grey
          ),
        ),
        const SizedBox(height: 30),
        const Text('City Type:', style: TextStyle(fontSize: 16)),
        RadioListTile(
          value: "metro",
          groupValue: cityType,
          contentPadding: EdgeInsets.zero,
          title: const Text("Metro City"),
          onChanged: (val){
            setState(() {
              cityType = val!;
            });
          },
        ),
        RadioListTile(
          value: "non-metro",
          groupValue: cityType,
          contentPadding: EdgeInsets.zero,
          title: const Text("Non-Metro City"),
          onChanged: (val){
            setState(() {
              cityType = val!;
            });
          },
        ),
        const SizedBox(height: 30),
        MaterialButton(
          color: Colors.blue,
          minWidth: double.infinity,
          height: 50,
          onPressed: (){
            FocusScope.of(context).unfocus();
            calculateHRA();
          },
          child: const Text("Calculate", style: TextStyle(color: Colors.white, fontSize: 20),),
        ),
        const SizedBox(height: 20),
        Text("HRA Received                      : ${numberToString(hraReceived.toString())}"),
        Text("40% or 50% of Basic           : ${numberToString(basic.toString())}"),
        Text("Rent Paid > 10% of Salary  : ${numberToString(rentPaid.toString())}"),
        Text("HRA Exemption                   : ${numberToString(hraExemption.toString())}"),
        Text("HRA Taxable                        : ${numberToString(hraTaxable.toString())}"),
        const SizedBox(height: 20),
      ],
    );
  }

  calculateHRA(){
    if(hraTextEditingController.text.isNotEmpty && basicSalaryTextEditingController.text.isNotEmpty){
      hraReceived = double.parse(hraTextEditingController.text.toString().trim());

      double basicSalary = double.parse(basicSalaryTextEditingController.text.toString().trim());
      if(cityType == "metro"){
        basic = (basicSalary * 50) / 100;
      } else {
        basic = (basicSalary * 40) / 100;
      }

      double totalRentPaid = double.parse(totalRentTextEditingController.text.toString().trim());
      if((totalRentPaid - (basicSalary * 10) / 100) > 0){
        rentPaid = totalRentPaid - (basicSalary * 10) / 100;
      } else {
        rentPaid = 0;
      }

      if(min(min(hraReceived, basicSalary), rentPaid) < 0){
        hraExemption = 0;
      } else {
        hraExemption = min(min(hraReceived, basicSalary), rentPaid);
      }
    }

    hraTaxable = hraReceived - hraExemption;
    setState(() {});
  }

  String numberToString(String str) {
    return str.replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => "${m[1]},");
  }
}
