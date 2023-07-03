import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tax/capital_gain.dart';
import 'package:tax/hra_calculator.dart';

class TaxCalculator extends StatefulWidget {
  const TaxCalculator({Key? key}) : super(key: key);

  @override
  State<TaxCalculator> createState() => _TaxCalculatorState();
}

class _TaxCalculatorState extends State<TaxCalculator> {

  TextEditingController basicSalarySalaryTextEditingController = TextEditingController();
  TextEditingController hraSalaryTextEditingController = TextEditingController();
  TextEditingController saSalaryTextEditingController = TextEditingController();
  TextEditingController ccSalaryTextEditingController = TextEditingController();
  TextEditingController taSalaryTextEditingController = TextEditingController();
  TextEditingController pensionIncomeTextEditingController = TextEditingController();
  TextEditingController aa1SalaryTextEditingController = TextEditingController();
  TextEditingController aa2SalaryTextEditingController = TextEditingController();
  TextEditingController rentPaidSalaryTextEditingController = TextEditingController();

  TextEditingController housePropertyTextEditingController = TextEditingController();

  // TextEditingController otherSourceTextEditingController = TextEditingController();
  TextEditingController biSBAOtherSourceTextEditingController = TextEditingController();
  TextEditingController biTDOtherSourceTextEditingController = TextEditingController();
  TextEditingController nscOtherSourceTextEditingController = TextEditingController();
  TextEditingController podOtherSourceTextEditingController = TextEditingController();
  TextEditingController dividendOtherSourceTextEditingController = TextEditingController();
  TextEditingController otherSource1TextEditingController = TextEditingController();
  TextEditingController otherSource2TextEditingController = TextEditingController();






  TextEditingController pfDeductionTextEditingController = TextEditingController();
  TextEditingController vpfDeductionTextEditingController = TextEditingController();
  TextEditingController ptDeductionTextEditingController = TextEditingController();
  TextEditingController tdsDeductionTextEditingController = TextEditingController();
  TextEditingController ad1DeductionTextEditingController = TextEditingController();
  TextEditingController ad2DeductionTextEditingController = TextEditingController();

  String year = "2022-23";
  double oldPayableTaxAmount = 0;
  double newPayableTaxAmount = 0;
  double grossSalary = 0;
  double netSalaryReceived = 0;
  double totalDeduction = 0;
  double totalHouseIncome = 0;
  double totalOtherIncomeSource = 0;
  String cityType = "metro";
  double ofBasic = 0;
  double ofRentPaid = 0;
  double ofHraExemption = 0;
  double ofHraTaxable = 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        // appBar: AppBar(title: const Text("Tax Calculator")),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const HRACalculator(),
                const Divider(height: 4, color: Colors.black,thickness: 6),
                salaryCalculatorWidget(),
                const Divider(height: 4, color: Colors.black,thickness: 6),
                const CapitalGains(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  salaryCalculatorWidget(){
    return ExpansionTile(
      title: const Text("Tax calculator"),
      expandedCrossAxisAlignment: CrossAxisAlignment.start,
      childrenPadding: const EdgeInsets.symmetric(horizontal: 20),
      tilePadding: EdgeInsets.zero,
      children: [
        salaryChildWidget(),
        houseIncomeChildWidget(),
        otherSourceIncomeChildWidget(),
        deductionChildWidget(),
        const SizedBox(height: 20),
        MaterialButton(
          color: Colors.blue,
          minWidth: double.infinity,
          height: 50,
          onPressed: (){
            FocusScope.of(context).unfocus();
            taxCalculateWithOldRegime();
            taxCalculateWithNewRegime();
          },
          child: const Text("Calculate", style: TextStyle(color: Colors.white, fontSize: 20),),
        ),
        const SizedBox(height: 40),
        Text("Old Regime Payable Tax Amount is : ${numberToString(oldPayableTaxAmount.toStringAsFixed(0))}"),
        const SizedBox(height: 20),
        Text("New Regime Payable Tax Amount is : ${numberToString(newPayableTaxAmount.toStringAsFixed(0))}"),
        const SizedBox(height: 20),
      ],
    );
  }

  salaryChildWidget(){
    return ExpansionTile(
      title: const Text("Income From Salary"),
      expandedCrossAxisAlignment: CrossAxisAlignment.start,
      childrenPadding: const EdgeInsets.symmetric(horizontal: 20),
      tilePadding: EdgeInsets.zero,
      trailing: Text("Gross Salary : ${numberToString(grossSalary.toStringAsFixed(0))}"),
      children: [
        const SizedBox(height: 20),
        TextField(
          controller: basicSalarySalaryTextEditingController,
          keyboardType: TextInputType.number,
          style: const TextStyle(color: Colors.black),
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp('[0-9]')),
          ],
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
          onChanged: (val) => calculateOnlySalary(),
        ),
        const SizedBox(height: 10),
        TextField(
          controller: hraSalaryTextEditingController,
          keyboardType: TextInputType.number,
          style: const TextStyle(color: Colors.black),
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp('[0-9]')),
          ],
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
          onChanged: (val) => calculateOnlySalary(),
        ),
        const SizedBox(height: 10),
        TextField(
          controller: saSalaryTextEditingController,
          keyboardType: TextInputType.number,
          style: const TextStyle(color: Colors.black),
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp('[0-9]')),
          ],
          decoration: InputDecoration(
              labelText: "Special Allowance",
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
          onChanged: (val) => calculateOnlySalary(),
        ),
        const SizedBox(height: 10),
        TextField(
          controller: ccSalaryTextEditingController,
          keyboardType: TextInputType.number,
          style: const TextStyle(color: Colors.black),
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp('[0-9]')),
          ],
          decoration: InputDecoration(
              labelText: "City Conveyance",
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
          onChanged: (val) => calculateOnlySalary(),
        ),
        const SizedBox(height: 10),
        TextField(
          controller: taSalaryTextEditingController,
          keyboardType: TextInputType.number,
          style: const TextStyle(color: Colors.black),
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp('[0-9]')),
          ],
          decoration: InputDecoration(
              labelText: "Transport Allowance",
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
          onChanged: (val) => calculateOnlySalary(),
        ),
        const SizedBox(height: 10),
        TextField(
          controller: pensionIncomeTextEditingController,
          keyboardType: TextInputType.number,
          style: const TextStyle(color: Colors.black),
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp('[0-9]')),
          ],
          decoration: InputDecoration(
              labelText: "Pension Income",
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
          onChanged: (val) => calculateOnlySalary(),
        ),
        const SizedBox(height: 10),
        TextField(
          controller: aa1SalaryTextEditingController,
          keyboardType: TextInputType.number,
          style: const TextStyle(color: Colors.black),
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp('[0-9]')),
          ],
          decoration: InputDecoration(
              labelText: "Additional Allowance 1",
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
          onChanged: (val) => calculateOnlySalary(),
        ),
        const SizedBox(height: 10),
        TextField(
          controller: aa2SalaryTextEditingController,
          keyboardType: TextInputType.number,
          style: const TextStyle(color: Colors.black),
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp('[0-9]')),
          ],
          decoration: InputDecoration(
              labelText: "Additional Allowance 2",
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
          onChanged: (val) => calculateOnlySalary(),
        ),
        const SizedBox(height: 10),
        TextField(
          controller: rentPaidSalaryTextEditingController,
          keyboardType: TextInputType.number,
          style: const TextStyle(color: Colors.black),
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp('[0-9]')),
          ],
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
          onChanged: (val) => calculateOnlySalary(),
        ),
        const SizedBox(height: 10),
        const Text('City Type:', style: TextStyle(fontSize: 16)),
        RadioListTile(
          value: "metro",
          groupValue: cityType,
          contentPadding: EdgeInsets.zero,
          title: const Text("Metro City"),
          onChanged: (val){
            cityType = val!;
            calculateOnlySalary();
          },
        ),
        RadioListTile(
          value: "non-metro",
          groupValue: cityType,
          contentPadding: EdgeInsets.zero,
          title: const Text("Non-Metro City"),
          onChanged: (val){
            cityType = val!;
            calculateOnlySalary();
          },
        ),
        const SizedBox(height: 10),
        Text("Gross Salary                           :  ${numberToString(grossSalary.toStringAsFixed(0))}", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
        Text("HRA Received                        :  ${getStringToDouble(hraSalaryTextEditingController.text.toString().trim()).toStringAsFixed(0)}", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
        Text("40% or 50% of Basic             :  ${numberToString(ofBasic.toStringAsFixed(0))}", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
        Text("Rent Paid > 10% of Salary    :  ${numberToString(ofRentPaid.toStringAsFixed(0))}", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
        Text("HRA Exemption                     :  ${numberToString(ofHraExemption.toStringAsFixed(0))}", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
        Text("HRA Taxable                          :  ${numberToString(ofHraTaxable.toStringAsFixed(0))}", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
        Text("Taxable Salary                       :  ${numberToString((grossSalary - ofHraExemption).toStringAsFixed(0))}", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
        Text("Standard Deduction             :  ${numberToString((min((grossSalary - ofHraExemption), 50000)).toStringAsFixed(0))}", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
        const SizedBox(height: 10),
        Text("Income taxable under the head Salaries :  ${numberToString(((grossSalary - ofHraExemption) - (min((grossSalary - ofHraExemption), 50000))).toStringAsFixed(0))}", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
        const SizedBox(height: 20),
      ],
    );
  }

  houseIncomeChildWidget(){
    return ExpansionTile(
      title: const Text("Income from House Property"),
      expandedCrossAxisAlignment: CrossAxisAlignment.start,
      childrenPadding: const EdgeInsets.symmetric(horizontal: 20),
      tilePadding: EdgeInsets.zero,
      trailing: Text("Total : ${numberToString(totalHouseIncome.toStringAsFixed(0))}"),
      children: [
        const SizedBox(height: 20),
        TextField(
          controller: housePropertyTextEditingController,
          keyboardType: TextInputType.number,
          style: const TextStyle(color: Colors.black),
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp('[0-9]')),
          ],
          decoration: InputDecoration(
              labelText: "House Property",
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
          onChanged: (val) => calculateOnlyHousePropertiesIncome(),
        ),
        const SizedBox(height: 10),
        Text("Income taxable under the head House Property : "
            "${numberToString(totalHouseIncome.toStringAsFixed(0))}", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
        const SizedBox(height: 20),
      ],
    );
  }

  otherSourceIncomeChildWidget(){
    return ExpansionTile(
      title: const Text("Income from Other Sources"),
      expandedCrossAxisAlignment: CrossAxisAlignment.start,
      childrenPadding: const EdgeInsets.symmetric(horizontal: 20),
      tilePadding: EdgeInsets.zero,
      trailing: Text("Total : ${numberToString(totalOtherIncomeSource.toStringAsFixed(0))}"),
      children: [
        const SizedBox(height: 20),
        TextField(
          controller: biSBAOtherSourceTextEditingController,
          keyboardType: TextInputType.number,
          style: const TextStyle(color: Colors.black),
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp('[0-9]')),
          ],
          decoration: InputDecoration(
              labelText: "Bank interest (SB account)",
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
          onChanged: (val) => calculateOnlyOtherSourceIncome(),
        ),
        const SizedBox(height: 10),
        TextField(
          controller: biTDOtherSourceTextEditingController,
          keyboardType: TextInputType.number,
          style: const TextStyle(color: Colors.black),
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp('[0-9]')),
          ],
          decoration: InputDecoration(
              labelText: "Bank Interest (Term Deposit)",
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
          onChanged: (val) => calculateOnlyOtherSourceIncome(),
        ),
        const SizedBox(height: 10),
        TextField(
          controller: nscOtherSourceTextEditingController,
          keyboardType: TextInputType.number,
          style: const TextStyle(color: Colors.black),
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp('[0-9]')),
          ],
          decoration: InputDecoration(
              labelText: "NSC Interest for the year",
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
          onChanged: (val) => calculateOnlyOtherSourceIncome(),
        ),
        const SizedBox(height: 10),
        TextField(
          controller: podOtherSourceTextEditingController,
          keyboardType: TextInputType.number,
          style: const TextStyle(color: Colors.black),
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp('[0-9]')),
          ],
          decoration: InputDecoration(
              labelText: "Post office deopsit",
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
          onChanged: (val) => calculateOnlyOtherSourceIncome(),
        ),
        const SizedBox(height: 10),
        TextField(
          controller: dividendOtherSourceTextEditingController,
          keyboardType: TextInputType.number,
          style: const TextStyle(color: Colors.black),
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp('[0-9]')),
          ],
          decoration: InputDecoration(
              labelText: "Dividend",
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
          onChanged: (val) => calculateOnlyOtherSourceIncome(),
        ),
        const SizedBox(height: 10),
        TextField(
          controller: otherSource1TextEditingController,
          keyboardType: TextInputType.number,
          style: const TextStyle(color: Colors.black),
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp('[0-9]')),
          ],
          decoration: InputDecoration(
              labelText: "Other source 1",
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
          onChanged: (val) => calculateOnlyOtherSourceIncome(),
        ),
        const SizedBox(height: 10),
        TextField(
          controller: otherSource2TextEditingController,
          keyboardType: TextInputType.number,
          style: const TextStyle(color: Colors.black),
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp('[0-9]')),
          ],
          decoration: InputDecoration(
              labelText: "Other source 2",
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
          onChanged: (val) => calculateOnlyOtherSourceIncome(),
        ),
        const SizedBox(height: 10),
        Text("Income taxable under the head Other Sources : "
            "${numberToString(totalOtherIncomeSource.toStringAsFixed(0))}", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
        const SizedBox(height: 10),
      ],
    );
  }

  deductionChildWidget(){
    return ExpansionTile(
      title: const Text("Deduction"),
      expandedCrossAxisAlignment: CrossAxisAlignment.start,
      childrenPadding: const EdgeInsets.symmetric(horizontal: 20),
      tilePadding: EdgeInsets.zero,
      trailing: Text("Total : ${numberToString(totalDeduction.toStringAsFixed(0))}"),
      children: [
        const SizedBox(height: 20),
        TextField(
          controller: pfDeductionTextEditingController,
          keyboardType: TextInputType.number,
          style: const TextStyle(color: Colors.black),
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp('[0-9]')),
          ],
          decoration: InputDecoration(
              labelText: "Provident Fund",
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
          onChanged: (val) => calculateOnlyDeduction(),
        ),
        const SizedBox(height: 10),
        TextField(
          controller: vpfDeductionTextEditingController,
          keyboardType: TextInputType.number,
          style: const TextStyle(color: Colors.black),
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp('[0-9]')),
          ],
          decoration: InputDecoration(
              labelText: "V P F",
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
          onChanged: (val) => calculateOnlyDeduction(),
        ),
        const SizedBox(height: 10),
        TextField(
          controller: ptDeductionTextEditingController,
          keyboardType: TextInputType.number,
          style: const TextStyle(color: Colors.black),
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp('[0-9]')),
          ],
          decoration: InputDecoration(
              labelText: "Profession Tax",
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
          onChanged: (val) => calculateOnlyDeduction(),
        ),
        const SizedBox(height: 10),
        TextField(
          controller: tdsDeductionTextEditingController,
          keyboardType: TextInputType.number,
          style: const TextStyle(color: Colors.black),
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp('[0-9]')),
          ],
          decoration: InputDecoration(
              labelText: "TDS Deducted",
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
          onChanged: (val) => calculateOnlyDeduction(),
        ),
        const SizedBox(height: 10),
        TextField(
          controller: ad1DeductionTextEditingController,
          keyboardType: TextInputType.number,
          style: const TextStyle(color: Colors.black),
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp('[0-9]')),
          ],
          decoration: InputDecoration(
              labelText: "Additional Deducted 1",
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
          onChanged: (val) => calculateOnlyDeduction(),
        ),
        const SizedBox(height: 10),
        TextField(
          controller: ad2DeductionTextEditingController,
          keyboardType: TextInputType.number,
          style: const TextStyle(color: Colors.black),
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp('[0-9]')),
          ],
          decoration: InputDecoration(
              labelText: "Additional Deducted 2",
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
          onChanged: (val) => calculateOnlyDeduction(),
        ),
        const SizedBox(height: 10),
        Text("Total Deductions : ${numberToString(totalDeduction.toStringAsFixed(0))}", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
        const SizedBox(height: 20),
      ],
    );
  }


  calculateOnlySalary(){
    double salary = getStringToDouble(basicSalarySalaryTextEditingController.text.toString().trim())
        + getStringToDouble(hraSalaryTextEditingController.text.toString().trim())
        + getStringToDouble(saSalaryTextEditingController.text.toString().trim())
        + getStringToDouble(ccSalaryTextEditingController.text.toString().trim())
        + getStringToDouble(taSalaryTextEditingController.text.toString().trim())
        + getStringToDouble(pensionIncomeTextEditingController.text.toString().trim())
        + getStringToDouble(aa1SalaryTextEditingController.text.toString().trim())
        + getStringToDouble(aa2SalaryTextEditingController.text.toString().trim());

    double hraReceived = getStringToDouble(hraSalaryTextEditingController.text.toString().trim());
    double basicSalary = getStringToDouble(basicSalarySalaryTextEditingController.text.toString().trim());

    if(cityType.toLowerCase() == "metro"){
      ofBasic = (basicSalary * 50) / 100;
    } else {
      ofBasic = (basicSalary * 40) / 100;
    }

    double totalRentPaid = getStringToDouble(rentPaidSalaryTextEditingController.text.toString().trim());
    if((totalRentPaid - (basicSalary * 10 / 100)) > 0){
      ofRentPaid = totalRentPaid - (basicSalary * 10 / 100);
    } else {
      ofRentPaid = 0;
    }

    if(min(min(hraReceived, basicSalary), ofRentPaid) < 0){
      ofHraExemption = 0;
    } else {
      ofHraExemption = min(min(hraReceived, basicSalary), ofRentPaid);
    }

    ofHraTaxable = hraReceived - ofHraExemption;
    setState(() {
      grossSalary = salary;
    });
  }

  calculateOnlyDeduction(){
    double deduction = getStringToDouble(pfDeductionTextEditingController.text.toString().trim())
        + getStringToDouble(vpfDeductionTextEditingController.text.toString().trim())
        + getStringToDouble(ptDeductionTextEditingController.text.toString().trim())
        + getStringToDouble(tdsDeductionTextEditingController.text.toString().trim())
        + getStringToDouble(ad1DeductionTextEditingController.text.toString().trim())
        + getStringToDouble(ad2DeductionTextEditingController.text.toString().trim());

    setState(() {
      totalDeduction = deduction;
    });
  }

  calculateOnlyOtherSourceIncome(){
    double otherSourceIncome = getStringToDouble(biSBAOtherSourceTextEditingController.text.toString().trim())
        + getStringToDouble(biTDOtherSourceTextEditingController.text.toString().trim())
        + getStringToDouble(nscOtherSourceTextEditingController.text.toString().trim())
        + getStringToDouble(podOtherSourceTextEditingController.text.toString().trim())
        + getStringToDouble(dividendOtherSourceTextEditingController.text.toString().trim())
        + getStringToDouble(otherSource1TextEditingController.text.toString().trim())
        + getStringToDouble(otherSource2TextEditingController.text.toString().trim());

    setState(() {
      totalOtherIncomeSource = otherSourceIncome;
    });
  }

  calculateOnlyHousePropertiesIncome(){
    double housePropertiesIncome = getStringToDouble(housePropertyTextEditingController.text.toString().trim());

    setState(() {
      totalHouseIncome = housePropertiesIncome;
    });
  }


  taxCalculateWithOldRegime(){

    double salary = getStringToDouble(basicSalarySalaryTextEditingController.text.toString().trim())
        + getStringToDouble(hraSalaryTextEditingController.text.toString().trim())
        + getStringToDouble(saSalaryTextEditingController.text.toString().trim())
        + getStringToDouble(ccSalaryTextEditingController.text.toString().trim())
        + getStringToDouble(taSalaryTextEditingController.text.toString().trim())
        + getStringToDouble(pensionIncomeTextEditingController.text.toString().trim())
        + getStringToDouble(aa1SalaryTextEditingController.text.toString().trim())
        + getStringToDouble(aa2SalaryTextEditingController.text.toString().trim());

    double houseProperty = getStringToDouble(housePropertyTextEditingController.text.toString().trim());

    double totalDeduction = getStringToDouble(pfDeductionTextEditingController.text.toString().trim())
        + getStringToDouble(vpfDeductionTextEditingController.text.toString().trim())
        + getStringToDouble(ptDeductionTextEditingController.text.toString().trim())
        + getStringToDouble(tdsDeductionTextEditingController.text.toString().trim())
        + getStringToDouble(ad1DeductionTextEditingController.text.toString().trim())
        + getStringToDouble(ad2DeductionTextEditingController.text.toString().trim());

    double deduction = 0;
    if(totalDeduction >= 150000){
      deduction = 150000;
    } else {
      deduction = totalDeduction;
    }

    double netPayableAmount = salary + houseProperty + totalOtherIncomeSource - deduction - 50000;
    oldPayableTaxAmount = 0;
    if(netPayableAmount <= 250000){
      debugPrint("Slab 1");
      oldPayableTaxAmount = 0;
    } else if(netPayableAmount >= 250001 && netPayableAmount <= 500000){
      debugPrint("Slab 2");
      oldPayableTaxAmount = ((netPayableAmount - 250000) * 5) / 100;
    } else if(netPayableAmount >= 500001 && netPayableAmount <= 1000000){
      debugPrint("Slab 3");
      oldPayableTaxAmount = 12500 + ((netPayableAmount - 500000) * 20) / 100;
    } else if(netPayableAmount >= 1000001){
      debugPrint("Slab 5");
      oldPayableTaxAmount = 112500 + ((netPayableAmount - 1000000) * 30) / 100;
    }
    oldPayableTaxAmount += (oldPayableTaxAmount * 4) / 100;
    setState(() {
    });
  }

  taxCalculateWithNewRegime(){
    double salaryIncome = getStringToDouble(basicSalarySalaryTextEditingController.text.toString().trim())
        + getStringToDouble(hraSalaryTextEditingController.text.toString().trim())
        + getStringToDouble(saSalaryTextEditingController.text.toString().trim())
        + getStringToDouble(ccSalaryTextEditingController.text.toString().trim())
        + getStringToDouble(taSalaryTextEditingController.text.toString().trim())
        + getStringToDouble(pensionIncomeTextEditingController.text.toString().trim())
        + getStringToDouble(aa1SalaryTextEditingController.text.toString().trim())
        + getStringToDouble(aa2SalaryTextEditingController.text.toString().trim());

    double houseProperty = getStringToDouble(housePropertyTextEditingController.text.toString().trim());

    double salary = salaryIncome + houseProperty + totalOtherIncomeSource - 50000;
    newPayableTaxAmount = 0;

    if(salary <= 250000){
      debugPrint("Slab 1");
      newPayableTaxAmount = 0;
    } else if(salary >= 250001 && salary <= 500000){
      debugPrint("Slab 2");
      newPayableTaxAmount = ((salary - 250000) * 5) / 100;
    } else if(salary >= 500001 && salary <= 750000){
      debugPrint("Slab 3");
      newPayableTaxAmount = 12500 + ((salary - 500000) * 10) / 100;
    } else if(salary >= 750001 && salary <= 1000000){
      debugPrint("Slab 5");
      newPayableTaxAmount = 37500 + ((salary - 750000) * 15) / 100;
    } else if(salary >= 1000001 && salary <= 1250000){
      debugPrint("Slab 5");
      newPayableTaxAmount = 75000 + ((salary - 1000000) * 20) / 100;
    } else if(salary >= 1250001 && salary <= 1500000){
      debugPrint("Slab 5");
      newPayableTaxAmount = 125000 + ((salary - 1250000) * 25) / 100;
    } else if(salary >= 1500001){
      debugPrint("Slab 6");
      newPayableTaxAmount = 187500 + ((salary - 1500000) * 30) / 100;
    }

    newPayableTaxAmount += (newPayableTaxAmount * 4) / 100;

    setState(() {});
  }

  String numberToString(String str) {
    return str.replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => "${m[1]},");
  }

  getStringToDouble(String value){
    return value.isNotEmpty ? double.parse(value) : 0.0;
  }
}
