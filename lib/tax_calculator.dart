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

  TextEditingController ageTextEditingController = TextEditingController();


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





  //Deduction TextFields
  TextEditingController pfDeductionTextEditingController = TextEditingController();
  TextEditingController vpfDeductionTextEditingController = TextEditingController();
  TextEditingController ptDeductionTextEditingController = TextEditingController();
  TextEditingController tdsDeductionTextEditingController = TextEditingController();
  TextEditingController ad1DeductionTextEditingController = TextEditingController();
  TextEditingController ad2DeductionTextEditingController = TextEditingController();

  TextEditingController li80CDeductionTextEditingController = TextEditingController();
  TextEditingController ppf80CDeductionTextEditingController = TextEditingController();
  TextEditingController nscAI80CDeductionTextEditingController = TextEditingController();
  TextEditingController hlPr80CDeductionTextEditingController = TextEditingController();
  TextEditingController ssa80CDeductionTextEditingController = TextEditingController();
  TextEditingController tfFc80CDeductionTextEditingController = TextEditingController();
  TextEditingController tsFdIb80CDeductionTextEditingController = TextEditingController();
  TextEditingController tsb80CDeductionTextEditingController = TextEditingController();
  TextEditingController eLSS80CDeductionTextEditingController = TextEditingController();
  TextEditingController tfFcDeductionTextEditingController = TextEditingController();

  TextEditingController pp80cccDeductionTextEditingController = TextEditingController();

  TextEditingController nps80ccdDeductionTextEditingController = TextEditingController();

  TextEditingController addDeductionTextEditingController = TextEditingController();

  TextEditingController section80s1DeductionTextEditingController = TextEditingController();
  TextEditingController section80s2DeductionTextEditingController = TextEditingController();
  TextEditingController section80s3DeductionTextEditingController = TextEditingController();
  TextEditingController section80s4DeductionTextEditingController = TextEditingController();
  TextEditingController section80s5DeductionTextEditingController = TextEditingController();
  TextEditingController section80s6DeductionTextEditingController = TextEditingController();
  TextEditingController section80s7DeductionTextEditingController = TextEditingController();
  TextEditingController section80s8DeductionTextEditingController = TextEditingController();
  TextEditingController section80s9DeductionTextEditingController = TextEditingController();
  TextEditingController section80s10DeductionTextEditingController = TextEditingController();
  TextEditingController section80s11DeductionTextEditingController = TextEditingController();
  TextEditingController section80s12DeductionTextEditingController = TextEditingController();
  TextEditingController section80s13DeductionTextEditingController = TextEditingController();


  double section80s1DeductionValue = 0;
  double section80s2DeductionValue = 0;
  double section80s3DeductionValue = 0;
  double section80s4DeductionValue = 0;
  double section80s5DeductionValue = 0;
  double section80s6DeductionValue = 0;
  double section80s7DeductionValue = 0;
  double section80s8DeductionValue = 0;
  double section80s9DeductionValue = 0;
  double section80s10DeductionValue = 0;
  double section80s11DeductionValue = 0;
  double section80s12DeductionValue = 0;
  double section80s13DeductionValue = 0;

  String year = "2022-23";
  double oldPayableTaxAmount = 0;
  double newPayableTaxAmount = 0;
  double grossSalary = 0;
  double netSalaryReceived = 0;
  double totalDeduction = 0;
  double total80sDeduction = 0;
  double totalSection80sDeduction = 0;
  double totalHouseIncome = 0;
  double totalOtherIncomeSource = 0;
  String cityType = "metro";
  String citizenType = "";
  double ofBasic = 0;
  double ofRentPaid = 0;
  double ofHraExemption = 0;
  double ofHraTaxable = 0;
  double netTaxableOfSalaryIncome = 0;
  double overAllTotalDeduction = 0;
  double totalTaxableIncomeOldRegime = 0;

  String selectedAssessmentYear = "2023-24";
  String selectedDisability = "Less than 40%";
  String selectedClaiming = "Claiming 80U?";

  bool isResultVisibility = false;
  double lessRebateOldRegime = 0;
  double afterLessRebateOldRegime = 0;
  double surchargeOldRegime = 0;
  double educationTaxOldRegime = 0;
  double totalTaxLiabilityOldRegime = 0;
  String oldTaxSlab = "";
  double netDeductionInNewRegime = 0;
  double totalTaxableIncomeNewRegime = 0;
  String newTaxSlab = "";
  double lessRebateNewRegime = 0;
  double afterLessRebateNewRegime = 0;
  double surchargeNewRegime = 0;
  double educationTaxNewRegime = 0;
  double totalTaxLiabilityNewRegime = 0;

  @override
  void initState(){
    super.initState();
  }

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
        Row(
          children: [
            const Text("Assessment Year"),
            const SizedBox(width: 20),
            DropdownButton(
              value: selectedAssessmentYear,
              onChanged: (String? newValue) => setState(() => selectedAssessmentYear = newValue!),
              items: ["2024-25", "2023-24", "2022-23", "2021-22"].map((value) => DropdownMenuItem(value: value,child: Text(value))).toList(),
            ),
          ],
        ),
        const SizedBox(height: 10),
        TextField(
          controller: ageTextEditingController,
          keyboardType: TextInputType.number,
          style: const TextStyle(color: Colors.black),
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp('[0-9]')),
          ],
          decoration: InputDecoration(
              labelText: "Age",
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
          onChanged: (val) => getCitizenType(int.parse(getStringToDouble(ageTextEditingController.text.toString().trim()).toString())),
        ),
        const SizedBox(height: 10),
        Text("Citizen Type : $citizenType", style: const TextStyle(fontWeight: FontWeight.bold)),
        salaryIncomeChildWidget(),
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
            calculateOnlySalary();
            calculateOnlyHousePropertiesIncome();
            calculateOnlyOtherSourceIncome();
            calculateAllDeduction();
            calculateAllSection80sDeduction();
            isResultVisibility = true;
            taxCalculateWithOldRegime();
            taxCalculateWithNewRegime();
          },
          child: const Text("Calculate", style: TextStyle(color: Colors.white, fontSize: 20),),
        ),
        const SizedBox(height: 40),
        Visibility(
          visible: isResultVisibility,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Old Regime Payable Tax Amount", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              Text("Income taxable under the head Salaries : ₹ ${numberToString(netTaxableOfSalaryIncome.toStringAsFixed(0))}"),
              Text("Income taxable under the head House Property : ₹ ${numberToString(totalHouseIncome.toStringAsFixed(0))}"),
              Text("Income taxable under the head Other Sources : ₹ ${numberToString(totalOtherIncomeSource.toStringAsFixed(0))}"),
              Text("Total Deductions : ₹ ${numberToString(overAllTotalDeduction.toStringAsFixed(0))}"),
              const SizedBox(height: 6),
              Text("Total Taxable Income : ₹ ${numberToString(totalTaxableIncomeOldRegime.toStringAsFixed(0))}"),
              const SizedBox(height: 6),
              Text("Old Regime Payable Tax Amount is : ₹ ${numberToString(oldPayableTaxAmount.toStringAsFixed(0))}"),
              Text("Less : Rebate u/s 87A : ₹ ${numberToString(lessRebateOldRegime.toStringAsFixed(0))}"),
              Text("Tax Payable after rebate : ₹ ${numberToString(afterLessRebateOldRegime.toStringAsFixed(0))}"),
              Text("Add : Surcharge : ₹ ${numberToString(surchargeOldRegime.toStringAsFixed(0))}"),
              Text("Add : Education + Health Cess : ₹ ${numberToString(educationTaxOldRegime.toStringAsFixed(0))}"),
              Text("Total Tax Liability : ₹ ${numberToString(totalTaxLiabilityOldRegime.toStringAsFixed(0))}"),
              Text("Less : TDS from Salary : ₹ ${numberToString(getStringToDouble(tdsDeductionTextEditingController.text.trim()).toStringAsFixed(0))}"),
              const SizedBox(height: 10),
              Text("Tax Payable / (Refundable): ₹ ${numberToString((totalTaxLiabilityOldRegime + getStringToDouble(tdsDeductionTextEditingController.text.trim())).toStringAsFixed(0))} ($oldTaxSlab)"),
              const SizedBox(height: 20),


              const Text("New Regime Payable Tax Amount", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              Text("Income from Salary : ₹ ${numberToString(grossSalary.toStringAsFixed(0))}"),
              Text("Income from House property : ₹ ${numberToString(totalHouseIncome.toStringAsFixed(0))}"),
              Text("Income from Other Sources : ₹ ${numberToString(totalOtherIncomeSource.toStringAsFixed(0))}"),
              const Text("Less Deductions"),
              Text("Additional Deduction under Sec 80CCD NPS (Max. ₹ 50,000/-): ₹ ${numberToString(netDeductionInNewRegime.toStringAsFixed(0))}"),
              const SizedBox(height: 6),
              Text("Total Taxable Income : ₹ ${numberToString(totalTaxableIncomeNewRegime.toStringAsFixed(0))}"),
              const SizedBox(height: 6),
              Text("Tax Payable : ₹ ${numberToString(newPayableTaxAmount.toStringAsFixed(0))}"),
              Text("Less : Rebate u/s 87A : ₹ ${numberToString(lessRebateNewRegime.toStringAsFixed(0))}"),
              Text("Tax Payable after rebate : ₹ ${numberToString(afterLessRebateNewRegime.toStringAsFixed(0))}"),
              Text("Add : Surcharge : ₹ ${numberToString(surchargeNewRegime.toStringAsFixed(0))}"),
              Text("Add : Education + Health Cess : ₹ ${numberToString(educationTaxNewRegime.toStringAsFixed(0))}"),
              Text("Total Tax Liability : ₹ ${numberToString(totalTaxLiabilityNewRegime.toStringAsFixed(0))}"),
              Text("Less : TDS from Salary : ₹ ${numberToString(getStringToDouble(tdsDeductionTextEditingController.text.trim()).toStringAsFixed(0))}"),
              const SizedBox(height: 10),
              Text("Tax Payable / (Refundable): ₹ ${numberToString((totalTaxLiabilityNewRegime + getStringToDouble(tdsDeductionTextEditingController.text.trim())).toStringAsFixed(0))} ($newTaxSlab)"),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ],
    );
  }

  salaryIncomeChildWidget(){
    return ExpansionTile(
      title: const Text("Income From Salary"),
      expandedCrossAxisAlignment: CrossAxisAlignment.start,
      childrenPadding: const EdgeInsets.symmetric(horizontal: 20),
      tilePadding: EdgeInsets.zero,
      trailing: Text("₹${numberToString(netTaxableOfSalaryIncome.toStringAsFixed(0))}"),
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
        Text("Gross Salary                           :  ${numberToString(grossSalary.toStringAsFixed(0))}", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
        const SizedBox(height: 10),
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
          onChanged: (val) {
            calculateOnlySalary();
            calculateAllDeduction();
          },
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
          onChanged: (val) {
            calculateOnlySalary();
            calculateAllDeduction();
          },
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
          onChanged: (val) => calculateOnlySalary(),
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
          onChanged: (val) => calculateOnlySalary(),
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
          onChanged: (val) => calculateOnlySalary(),
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
          onChanged: (val) => calculateOnlySalary(),
        ),
        const SizedBox(height: 10),
        Text("Net Salary received               :  ${numberToString(netSalaryReceived.toStringAsFixed(0))}", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
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
        Text("HRA Received                        :  ${numberToString(getStringToDouble(hraSalaryTextEditingController.text.toString().trim()).toStringAsFixed(0))}", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
        Text("40% or 50% of Basic             :  ${numberToString(ofBasic.toStringAsFixed(0))}", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
        Text("Rent Paid > 10% of Salary    :  ${numberToString(ofRentPaid.toStringAsFixed(0))}", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
        Text("HRA Exemption                     :  ${numberToString(ofHraExemption.toStringAsFixed(0))}", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
        Text("HRA Taxable                          :  ${numberToString(ofHraTaxable.toStringAsFixed(0))}", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
        Text("Taxable Salary                       :  ${numberToString((grossSalary - ofHraExemption).toStringAsFixed(0))}", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
        Text("Standard Deduction             :  ${numberToString((min((grossSalary - ofHraExemption), 50000)).toStringAsFixed(0))}", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
        const SizedBox(height: 10),
        Text("Income taxable under the head Salaries :  ${numberToString(netTaxableOfSalaryIncome.toStringAsFixed(0))}",
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
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
      trailing: Text("₹${numberToString(totalHouseIncome.toStringAsFixed(0))}"),
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
      trailing: Text("₹${numberToString(totalOtherIncomeSource.toStringAsFixed(0))}"),
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
          onChanged: (val) {
            calculateOnlyOtherSourceIncome();
            calculateAllSection80sDeduction();
          },
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
          onChanged: (val) {
            calculateOnlyOtherSourceIncome();
            calculateAllSection80sDeduction();
          },
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
      trailing: Text("₹${numberToString(overAllTotalDeduction.toStringAsFixed(0))}"),
      children: [
        const SizedBox(height: 20),
        const Text("Section 80 C", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
        const SizedBox(height: 20),
        TextField(
          controller: li80CDeductionTextEditingController,
          keyboardType: TextInputType.number,
          style: const TextStyle(color: Colors.black),
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp('[0-9]')),
          ],
          decoration: InputDecoration(
              labelText: "Life insurance",
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
          onChanged: (val) => calculateAllDeduction(),
        ),
        const SizedBox(height: 10),
        Text("Provident Fund                      :  ${
            numberToString((getStringToDouble(pfDeductionTextEditingController.text.toString().trim())
                + getStringToDouble(vpfDeductionTextEditingController.text.toString().trim())).toStringAsFixed(0))
        }", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
        const SizedBox(height: 10),
        TextField(
          controller: ppf80CDeductionTextEditingController,
          keyboardType: TextInputType.number,
          style: const TextStyle(color: Colors.black),
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp('[0-9]')),
          ],
          decoration: InputDecoration(
              labelText: "Public Provident Fund",
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
          onChanged: (val) => calculateAllDeduction(),
        ),
        const SizedBox(height: 10),
        TextField(
          controller: nscAI80CDeductionTextEditingController,
          keyboardType: TextInputType.number,
          style: const TextStyle(color: Colors.black),
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp('[0-9]')),
          ],
          decoration: InputDecoration(
              labelText: "NSC investment + Accrued interest",
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
          onChanged: (val) => calculateAllDeduction(),
        ),
        const SizedBox(height: 10),
        TextField(
          controller: hlPr80CDeductionTextEditingController,
          keyboardType: TextInputType.number,
          style: const TextStyle(color: Colors.black),
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp('[0-9]')),
          ],
          decoration: InputDecoration(
              labelText: "Housing loan principal repayment",
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
          onChanged: (val) => calculateAllDeduction(),
        ),
        const SizedBox(height: 10),
        TextField(
          controller: ssa80CDeductionTextEditingController,
          keyboardType: TextInputType.number,
          style: const TextStyle(color: Colors.black),
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp('[0-9]')),
          ],
          decoration: InputDecoration(
              labelText: "Sukanya Samriddhi Account",
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
          onChanged: (val) => calculateAllDeduction(),
        ),
        const SizedBox(height: 10),
        TextField(
          controller: tfFc80CDeductionTextEditingController,
          keyboardType: TextInputType.number,
          style: const TextStyle(color: Colors.black),
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp('[0-9]')),
          ],
          decoration: InputDecoration(
              labelText: "Tuition fees for 2 children",
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
          onChanged: (val) => calculateAllDeduction(),
        ),
        const SizedBox(height: 10),
        TextField(
          controller: tsFdIb80CDeductionTextEditingController,
          keyboardType: TextInputType.number,
          style: const TextStyle(color: Colors.black),
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp('[0-9]')),
          ],
          decoration: InputDecoration(
              labelText: "Tax Saving Fixed deposit in Bank (5 years)",
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
          onChanged: (val) => calculateAllDeduction(),
        ),
        const SizedBox(height: 10),
        TextField(
          controller: tsb80CDeductionTextEditingController,
          keyboardType: TextInputType.number,
          style: const TextStyle(color: Colors.black),
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp('[0-9]')),
          ],
          decoration: InputDecoration(
              labelText: "Tax Saving Bonds",
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
          onChanged: (val) => calculateAllDeduction(),
        ),
        const SizedBox(height: 10),
        TextField(
          controller: eLSS80CDeductionTextEditingController,
          keyboardType: TextInputType.number,
          style: const TextStyle(color: Colors.black),
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp('[0-9]')),
          ],
          decoration: InputDecoration(
              labelText: "E.L.S.S (Tax Saving Mutual Fund)",
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
          onChanged: (val) => calculateAllDeduction(),
        ),
        const SizedBox(height: 30),
        const Text("Section 80 CCC", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
        const SizedBox(height: 20),
        TextField(
          controller: pp80cccDeductionTextEditingController,
          keyboardType: TextInputType.number,
          style: const TextStyle(color: Colors.black),
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp('[0-9]')),
          ],
          decoration: InputDecoration(
              labelText: "Pension Plan from Insurance Companies/Mutual Funds (u/s 80CCC)",
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
          onChanged: (val) => calculateAllDeduction(),
        ),
        const SizedBox(height: 30),
        const Text("Section 80 CCD", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
        const SizedBox(height: 20),
        TextField(
          controller: nps80ccdDeductionTextEditingController,
          keyboardType: TextInputType.number,
          style: const TextStyle(color: Colors.black),
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp('[0-9]')),
          ],
          decoration: InputDecoration(
              labelText: "Contribution to NPS notified by the Central Government ",
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
          onChanged: (val) => calculateAllDeduction(),
        ),
        const SizedBox(height: 20),
        Text("Total of 80 C, 80 CCC and 80 CCD                  :  ${numberToString(total80sDeduction.toStringAsFixed(0))}", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
        Text("Net deduction of 80 C, 80 CCC and 80 CCD  :  ${numberToString(min(total80sDeduction, 150000).toStringAsFixed(0))}", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
        const SizedBox(height: 20),
        TextField(
          controller: addDeductionTextEditingController,
          keyboardType: TextInputType.number,
          style: const TextStyle(color: Colors.black),
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp('[0-9]')),
          ],
          decoration: InputDecoration(
              labelText: "Less: Additional Deduction under Sec 80CCD NPS (Max. ₹ 50,000/-)",
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
          onChanged: (val) => calculateAllDeduction(),
        ),
        const SizedBox(height: 10),
        Text("Net Additional Deduction :  ${numberToString(min(int.parse(getStringToDouble(addDeductionTextEditingController.text.toString().trim()).toString()), 50000).toStringAsFixed(0))}", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
        const SizedBox(height: 20),
        TextField(
          controller: section80s1DeductionTextEditingController,
          keyboardType: TextInputType.number,
          style: const TextStyle(color: Colors.black),
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp('[0-9]')),
          ],
          decoration: InputDecoration(
            labelText: "80D - Mediclaim Insurance (Self & dependent)",
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
            focusColor: Colors.grey,
            suffix: Text(section80s1DeductionValue.toStringAsFixed(0)),
          ),
          onChanged: (val) => calculateAllSection80sDeduction(),
        ),
        const SizedBox(height: 10),
        TextField(
          controller: section80s2DeductionTextEditingController,
          keyboardType: TextInputType.number,
          style: const TextStyle(color: Colors.black),
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp('[0-9]')),
          ],
          decoration: InputDecoration(
            labelText: "80D - Mediclaim Insurance (Parents)",
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
            focusColor: Colors.grey,
            suffix: Text(section80s2DeductionValue.toStringAsFixed(0)),
          ),
          onChanged: (val) {
            calculateAllSection80sDeduction();
          },
        ),
        const SizedBox(height: 10),
        TextField(
          controller: section80s3DeductionTextEditingController,
          keyboardType: TextInputType.number,
          style: const TextStyle(color: Colors.black),
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp('[0-9]')),
          ],
          decoration: InputDecoration(
            labelText: "80E - Interest on education loan  ",
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
            focusColor: Colors.grey,
            suffix: Text(section80s3DeductionValue.toStringAsFixed(0)),
          ),
          onChanged: (val) {
            calculateAllSection80sDeduction();
          },
        ),
        const SizedBox(height: 10),
        TextField(
          controller: section80s4DeductionTextEditingController,
          keyboardType: TextInputType.number,
          style: const TextStyle(color: Colors.black),
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp('[0-9]')),
          ],
          decoration: InputDecoration(
            labelText: "80EE - Interest on Home Loan as per conditions mentioned therein",
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
            focusColor: Colors.grey,
            suffix: Text(section80s4DeductionValue.toStringAsFixed(0)),
          ),
          onChanged: (val) {
            calculateAllSection80sDeduction();
          },
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: section80s5DeductionTextEditingController,
                keyboardType: TextInputType.number,
                style: const TextStyle(color: Colors.black),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp('[0-9]')),
                ],
                decoration: InputDecoration(
                  labelText: "80DD - Medical Treatment of handicapped Dependent",
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
                  focusColor: Colors.grey,
                  suffix: Text(section80s5DeductionValue.toStringAsFixed(0)),
                ),
                onChanged: (val) {
                  calculateAllSection80sDeduction();
                },
              ),
            ),
            const SizedBox(width: 10),
            DropdownButton(
              hint: const Text("Choose a Disability"),
              value: selectedDisability,
              onChanged: (String? newValue) => setState(() => selectedDisability = newValue!),
              items: ["Less than 40%", "40% to 79%", "80% & more"].map((value) => DropdownMenuItem(value: value,child: Text(value))).toList(),
            ),
            const SizedBox(width: 10),
            DropdownButton(
              hint: const Text("Choose a Claiming"),
              value: selectedClaiming,
              onChanged: (String? newValue) => setState(() => selectedClaiming = newValue!),
              items: ["Claiming 80U?", "Yes", "No"].map((value) => DropdownMenuItem(value: value,child: Text(value))).toList(),
            ),
          ],
        ),
        const SizedBox(height: 10),
        TextField(
          controller: section80s6DeductionTextEditingController,
          keyboardType: TextInputType.number,
          style: const TextStyle(color: Colors.black),
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp('[0-9]')),
          ],
          decoration: InputDecoration(
            labelText: "80DDB - 80DDB Expenditure on Selected Medical Treatment",
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
            focusColor: Colors.grey,
            suffix: Text(section80s6DeductionValue.toStringAsFixed(0)),
          ),
          onChanged: (val) {
            calculateAllSection80sDeduction();
          },
        ),
        const SizedBox(height: 10),
        TextField(
          controller: section80s7DeductionTextEditingController,
          keyboardType: TextInputType.number,
          style: const TextStyle(color: Colors.black),
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp('[0-9]')),
          ],
          decoration: InputDecoration(
            labelText: "80G, 80GGA, 80GGC Donation to approved funds",
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
            focusColor: Colors.grey,
            suffix: Text(section80s7DeductionValue.toStringAsFixed(0)),
          ),
          onChanged: (val) {
            calculateAllSection80sDeduction();
          },
        ),
        const SizedBox(height: 10),
        TextField(
          controller: section80s8DeductionTextEditingController,
          keyboardType: TextInputType.number,
          style: const TextStyle(color: Colors.black),
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp('[0-9]')),
          ],
          decoration: InputDecoration(
            labelText: "80GG For Rent to an Individual, not receiving HRA (File Form 10BA)",
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
            focusColor: Colors.grey,
            suffix: Text(section80s8DeductionValue.toStringAsFixed(0)),
          ),
          onChanged: (val) {
            calculateAllSection80sDeduction();
          },
        ),
        const SizedBox(height: 10),
        TextField(
          controller: section80s9DeductionTextEditingController,
          keyboardType: TextInputType.number,
          readOnly: true,
          style: const TextStyle(color: Colors.black),
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp('[0-9]')),
          ],
          decoration: InputDecoration(
            labelText: "80TTA - SB interest received by Normal Citizen",
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
            focusColor: Colors.grey,
            suffix: Text(section80s9DeductionValue.toStringAsFixed(0)),
          ),
          onChanged: (val) {
            calculateAllSection80sDeduction();
          },
        ),
        const SizedBox(height: 10),
        TextField(
          controller: section80s10DeductionTextEditingController,
          keyboardType: TextInputType.number,
          readOnly: true,
          style: const TextStyle(color: Colors.black),
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp('[0-9]')),
          ],
          decoration: InputDecoration(
            labelText: "80TTB - Interest on SB Act. & deposits received by Sr. & very Sr. Citizen",
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
            focusColor: Colors.grey,
            suffix: Text(section80s10DeductionValue.toStringAsFixed(0)),
          ),
          onChanged: (val) {
            calculateAllSection80sDeduction();
          },
        ),
        const SizedBox(height: 10),
        TextField(
          controller: section80s11DeductionTextEditingController,
          keyboardType: TextInputType.number,
          style: const TextStyle(color: Colors.black),
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp('[0-9]')),
          ],
          decoration: InputDecoration(
            labelText: "80U - Physically Disable Assess",
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
            focusColor: Colors.grey,
            suffix: Text(section80s11DeductionValue.toStringAsFixed(0)),
          ),
          onChanged: (val) {
            calculateAllSection80sDeduction();
          },
        ),
        const SizedBox(height: 10),
        TextField(
          controller: section80s12DeductionTextEditingController,
          keyboardType: TextInputType.number,
          style: const TextStyle(color: Colors.black),
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp('[0-9]')),
          ],
          decoration: InputDecoration(
            labelText: "Any other section (Enter the component here)",
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
            focusColor: Colors.grey,
            suffix: Text(section80s12DeductionValue.toStringAsFixed(0)),
          ),
          onChanged: (val) {
            calculateAllSection80sDeduction();
          },
        ),
        const SizedBox(height: 10),
        TextField(
          controller: section80s13DeductionTextEditingController,
          keyboardType: TextInputType.number,
          style: const TextStyle(color: Colors.black),
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp('[0-9]')),
          ],
          decoration: InputDecoration(
            labelText: "Any other section (Enter the component here)",
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
            focusColor: Colors.grey,
            suffix: Text(section80s13DeductionValue.toStringAsFixed(0)),
          ),
          onChanged: (val) {
            calculateAllSection80sDeduction();
          },
        ),
        const SizedBox(height: 10),
        Text("Total of Section 80's deductions : ${numberToString(totalSection80sDeduction.toStringAsFixed(0))}", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
        Text("Over All Total Deduction : ${numberToString(overAllTotalDeduction.toStringAsFixed(0))}", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
        const SizedBox(height: 10),
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
    calculateOnlyTotalDeduction();

    netTaxableOfSalaryIncome = (grossSalary - ofHraExemption)
        - (min((grossSalary - ofHraExemption), 50000))
        - getStringToDouble(ptDeductionTextEditingController.text.toString().trim());

    setState(() {
      grossSalary = salary;
      netSalaryReceived = grossSalary - totalDeduction;
    });
  }

  calculateOnlyTotalDeduction(){
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

  calculateAllDeduction(){
    double deduction = getStringToDouble(li80CDeductionTextEditingController.text.toString().trim())
        + getStringToDouble(pfDeductionTextEditingController.text.toString().trim())
        + getStringToDouble(vpfDeductionTextEditingController.text.toString().trim())
        + getStringToDouble(ppf80CDeductionTextEditingController.text.toString().trim())
        + getStringToDouble(nscAI80CDeductionTextEditingController.text.toString().trim())
        + getStringToDouble(hlPr80CDeductionTextEditingController.text.toString().trim())
        + getStringToDouble(ssa80CDeductionTextEditingController.text.toString().trim())
        + getStringToDouble(tfFc80CDeductionTextEditingController.text.toString().trim())
        + getStringToDouble(tsFdIb80CDeductionTextEditingController.text.toString().trim())
        + getStringToDouble(tsb80CDeductionTextEditingController.text.toString().trim())
        + getStringToDouble(eLSS80CDeductionTextEditingController.text.toString().trim())
        + getStringToDouble(pp80cccDeductionTextEditingController.text.toString().trim())
        + getStringToDouble(nps80ccdDeductionTextEditingController.text.toString().trim());

    setState(() {
      total80sDeduction = deduction;
    });
  }

  calculateAllSection80sDeduction(){
    // Section 1
    double value1 = getStringToDouble(section80s1DeductionTextEditingController.text.toString().trim());
    if(citizenType == "Normal Citizen"){
      section80s1DeductionValue =  min(value1, 25000);
    } else {
      section80s1DeductionValue = min(value1, 50000);
    }

    // Section 2
    double value2 = getStringToDouble(section80s2DeductionTextEditingController.text.toString().trim());
    if(citizenType == "Normal Citizen"){
      section80s2DeductionValue =  min(value2, 25000);
    } else {
      section80s2DeductionValue = min(value2, 50000);
    }

    // Section 3
    section80s3DeductionValue = getStringToDouble(section80s3DeductionTextEditingController.text.toString().trim());

    // Section 4
    section80s4DeductionValue = getStringToDouble(section80s4DeductionTextEditingController.text.toString().trim());

    // Section 5
    if(selectedClaiming == "No"){
      if(selectedDisability == "40% to 79%"){
        section80s5DeductionValue = 75000;
      } else if(selectedDisability == "80% & more"){
        section80s5DeductionValue = 125000;
      } else {
        section80s5DeductionValue = 0;
      }
    } else {
      section80s5DeductionValue = 0;
    }

    // Section 6
    double value6 = getStringToDouble(section80s6DeductionTextEditingController.text.toString().trim());
    if(citizenType == "Normal Citizen"){
      section80s6DeductionValue =  min(value6, 40000);
    } else {
      section80s6DeductionValue = min(value6, 100000);
    }

    // Section 7
    section80s7DeductionValue = getStringToDouble(section80s7DeductionTextEditingController.text.toString().trim());

    // Section 8
    double value = getStringToDouble(section80s8DeductionTextEditingController.text.toString().trim());
    if(value > 1){
      /*Minimum of these values
              * value - ((netTaxableOfSalaryIncome - total80sDeduction - int.parse(getStringToDouble(addDeductionTextEditingController.text.toString().trim()).toString()) - section80s1DeductionValue - section80s2DeductionValue - section80s3DeductionValue - section80s5DeductionValue - section80s6DeductionValue - section80s7DeductionValue - section80s9DeductionValue - section80s10DeductionValue, section80s11DeductionValue) * 0.1))
              * 60000
              *((netTaxableOfSalaryIncome - total80sDeduction - int.parse(getStringToDouble(addDeductionTextEditingController.text.toString().trim()).toString()) - section80s1DeductionValue - section80s2DeductionValue - section80s3DeductionValue - section80s5DeductionValue - section80s6DeductionValue - section80s7DeductionValue - section80s9DeductionValue - section80s10DeductionValue, section80s11DeductionValue) * 0.25)
              * */
      double calculatedValue = netTaxableOfSalaryIncome - total80sDeduction - int.parse(getStringToDouble(addDeductionTextEditingController.text.toString().trim()).toString()) - section80s1DeductionValue - section80s2DeductionValue - section80s3DeductionValue - section80s5DeductionValue - section80s6DeductionValue - section80s7DeductionValue - section80s9DeductionValue - section80s10DeductionValue - section80s11DeductionValue;
      section80s8DeductionValue =  min(min(value - (calculatedValue * 0.1), 60000), (calculatedValue * 0.25));
    } else {
      section80s8DeductionValue = 0;
    }

    // Section 9
    if(citizenType == "Normal Citizen"){
      section80s9DeductionTextEditingController.text = biSBAOtherSourceTextEditingController.text;
      section80s9DeductionValue = min(getStringToDouble(section80s9DeductionTextEditingController.text.toString().trim()), 10000);
    } else {
      section80s9DeductionTextEditingController.text = "0";
      section80s9DeductionValue = 0;
    }

    // Section 10
    if(citizenType == "Normal Citizen"){
      section80s10DeductionTextEditingController.text = "0";
      section80s10DeductionValue = 0;
    } else {
      section80s10DeductionTextEditingController.text = (getStringToDouble(biSBAOtherSourceTextEditingController.text.trim()) + getStringToDouble(biTDOtherSourceTextEditingController.text.trim())).toString();
      section80s10DeductionValue = min(getStringToDouble(section80s10DeductionTextEditingController.text.toString().trim()), 50000);
    }

    // Section 11
    if(selectedClaiming == "Yes"){
      if(selectedDisability == "40% to 79%"){
        section80s11DeductionValue = 75000;
      } else if(selectedDisability == "80% & more"){
        section80s11DeductionValue = 125000;
      } else{
        section80s11DeductionValue = 0;
      }
    } else {
      section80s11DeductionValue = 0;
    }

    // Section 12
    section80s12DeductionValue = getStringToDouble(section80s12DeductionTextEditingController.text.toString().trim());

    // Section 13
    section80s13DeductionValue = getStringToDouble(section80s13DeductionTextEditingController.text.toString().trim());


    double section80Deduction = section80s1DeductionValue + section80s2DeductionValue + section80s3DeductionValue + section80s4DeductionValue +
        section80s5DeductionValue + section80s6DeductionValue + section80s7DeductionValue + section80s8DeductionValue +
    section80s9DeductionValue + section80s10DeductionValue + section80s11DeductionValue + section80s12DeductionValue + section80s13DeductionValue;

    overAllTotalDeduction = min(int.parse(getStringToDouble(addDeductionTextEditingController.text.toString().trim()).toString()), 50000) +
        min(total80sDeduction, 150000) + section80Deduction;
    setState(() {
      totalSection80sDeduction = section80Deduction;
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
    totalTaxableIncomeOldRegime = netTaxableOfSalaryIncome + totalHouseIncome + totalOtherIncomeSource - overAllTotalDeduction;
    oldPayableTaxAmount = 0;

    if(citizenType == "Normal Citizen"){
      if(totalTaxableIncomeOldRegime <= 250000){
        oldTaxSlab = "Tax Slab 1";
        oldPayableTaxAmount = 0;
      } else if(totalTaxableIncomeOldRegime > 250001 && totalTaxableIncomeOldRegime <= 500000){
        oldTaxSlab = "Tax Slab 2";
        oldPayableTaxAmount = (totalTaxableIncomeOldRegime - 250000) * 0.05;
      } else if(totalTaxableIncomeOldRegime > 500001 && totalTaxableIncomeOldRegime <= 1000000){
        oldTaxSlab = "Tax Slab 3";
        oldPayableTaxAmount = 12500 + (totalTaxableIncomeOldRegime - 500000) * 0.2;
      } else if(totalTaxableIncomeOldRegime > 1000001){
        oldTaxSlab = "Tax Slab 4";
        oldPayableTaxAmount = 112500 + (totalTaxableIncomeOldRegime - 1000000) * 0.3;
      }
    } else if(citizenType == "Senior Citizen"){
      if(totalTaxableIncomeOldRegime <= 300000){
        oldTaxSlab = "Tax Slab 1";
        oldPayableTaxAmount = 0;
      } else if(totalTaxableIncomeOldRegime > 300001 && totalTaxableIncomeOldRegime <= 500000){
        oldTaxSlab = "Tax Slab 2";
        oldPayableTaxAmount = (totalTaxableIncomeOldRegime - 300000) * 0.05;
      } else if(totalTaxableIncomeOldRegime > 500001 && totalTaxableIncomeOldRegime <= 1000000){
        oldTaxSlab = "Tax Slab 3";
        oldPayableTaxAmount = 10000 + (totalTaxableIncomeOldRegime - 500000) * 0.2;
      } else if(totalTaxableIncomeOldRegime > 1000001){
        oldTaxSlab = "Tax Slab 4";
        oldPayableTaxAmount = 110000 + (totalTaxableIncomeOldRegime - 1000000) * 0.3;
      }
    } else {
      if(totalTaxableIncomeOldRegime <= 500000){
        oldTaxSlab = "Tax Slab 1";
        oldPayableTaxAmount = 0;
      } else if(totalTaxableIncomeOldRegime > 500001 && totalTaxableIncomeOldRegime <= 1000000){
        oldTaxSlab = "Tax Slab 2";
        oldPayableTaxAmount = (totalTaxableIncomeOldRegime - 500000) * 0.2;
      } else if(totalTaxableIncomeOldRegime > 1000001){
        oldTaxSlab = "Tax Slab 4";
        oldPayableTaxAmount = 100000 + (totalTaxableIncomeOldRegime - 1000000) * 0.3;
      }
    }

    if(totalTaxableIncomeOldRegime > 0 && totalTaxableIncomeOldRegime <= 500000){
      lessRebateOldRegime = min(oldPayableTaxAmount, 12500);
    } else {
      lessRebateOldRegime = 0;
    }

    afterLessRebateOldRegime = oldPayableTaxAmount - lessRebateOldRegime;

    if(totalTaxableIncomeOldRegime <= 5000000){
      surchargeOldRegime = 0;
    } else if(totalTaxableIncomeOldRegime > 5000000 && totalTaxableIncomeOldRegime <= 10000000){
      surchargeOldRegime = afterLessRebateOldRegime * 0.1;
    } else if(totalTaxableIncomeOldRegime > 10000000 && totalTaxableIncomeOldRegime <= 20000000){
      surchargeOldRegime = afterLessRebateOldRegime * 0.15;
    } else if(totalTaxableIncomeOldRegime > 20000000 && totalTaxableIncomeOldRegime <= 50000000){
      surchargeOldRegime = afterLessRebateOldRegime * 0.25;
    } else {
      surchargeOldRegime = afterLessRebateOldRegime * 0.37;
    }

    educationTaxOldRegime = (afterLessRebateOldRegime + surchargeOldRegime) * 0.04;

    totalTaxLiabilityOldRegime = afterLessRebateOldRegime + surchargeOldRegime + educationTaxOldRegime;
    setState(() {
    });
  }

  taxCalculateWithNewRegime(){
    netDeductionInNewRegime = min(getStringToDouble(addDeductionTextEditingController.text.toString().trim()), 50000);
    totalTaxableIncomeNewRegime = grossSalary + totalHouseIncome + totalOtherIncomeSource - netDeductionInNewRegime;

    newPayableTaxAmount = 0;
    if(totalTaxableIncomeNewRegime <= 250000){
      newTaxSlab = "Tax Slab 1";
      newPayableTaxAmount = 0;
    } else if(totalTaxableIncomeNewRegime >= 250001 && totalTaxableIncomeNewRegime <= 500000){
      newTaxSlab = "Tax Slab 2";
      newPayableTaxAmount = (totalTaxableIncomeNewRegime - 250000) * 0.05;
    } else if(totalTaxableIncomeNewRegime >= 500001 && totalTaxableIncomeNewRegime <= 750000){
      newTaxSlab = "Tax Slab 3";
      newPayableTaxAmount = 12500 + (totalTaxableIncomeNewRegime - 500000) * 0.1;
    } else if(totalTaxableIncomeNewRegime >= 750001 && totalTaxableIncomeNewRegime <= 1000000){
      newTaxSlab = "Tax Slab 4";
      newPayableTaxAmount = 37500 + (totalTaxableIncomeNewRegime - 750000) * 0.15;
    } else if(totalTaxableIncomeNewRegime >= 1000001 && totalTaxableIncomeNewRegime <= 1250000){
      newTaxSlab = "Tax Slab 5";
      newPayableTaxAmount = 75000 + (totalTaxableIncomeNewRegime - 1000000) * 0.2;
    } else if(totalTaxableIncomeNewRegime >= 1250001 && totalTaxableIncomeNewRegime <= 1500000){
      newTaxSlab = "Tax Slab 6";
      newPayableTaxAmount = 125000 + (totalTaxableIncomeNewRegime - 1250000) * 0.25;
    } else if(totalTaxableIncomeNewRegime >= 1500001){
      newTaxSlab = "Tax Slab 7";
      newPayableTaxAmount = 187500 + (totalTaxableIncomeNewRegime - 1500000) * 0.3;
    }

    if(totalTaxableIncomeNewRegime > 0 && totalTaxableIncomeNewRegime <= 500000){
      lessRebateNewRegime = min(newPayableTaxAmount, 12500);
    } else {
      lessRebateNewRegime = 0;
    }

    afterLessRebateNewRegime = newPayableTaxAmount - lessRebateNewRegime;


    if(totalTaxableIncomeNewRegime <= 5000000){
      surchargeNewRegime = 0;
    } else if(totalTaxableIncomeNewRegime > 5000000 && totalTaxableIncomeNewRegime <= 10000000){
      surchargeNewRegime = afterLessRebateNewRegime * 0.1;
    } else if(totalTaxableIncomeNewRegime > 10000000 && totalTaxableIncomeNewRegime <= 20000000){
      surchargeNewRegime = afterLessRebateNewRegime * 0.15;
    } else if(totalTaxableIncomeNewRegime > 20000000 && totalTaxableIncomeNewRegime <= 50000000){
      surchargeNewRegime = afterLessRebateNewRegime * 0.25;
    } else {
      surchargeNewRegime = afterLessRebateNewRegime * 0.37;
    }

    educationTaxNewRegime = (afterLessRebateNewRegime + surchargeNewRegime) * 0.04;

    totalTaxLiabilityNewRegime = afterLessRebateNewRegime + surchargeNewRegime + educationTaxNewRegime;


    setState(() {});
  }

  getCitizenType(int age){
    if(age == 0) {
      citizenType = "";
    } else if(age <= 60) {
      citizenType = "Normal Citizen";
    } else if(age >= 60 && age <= 80){
      citizenType = "Senior Citizen";
    } else {
      citizenType = "Super Senior Citizen";
    }
    setState(() {});
  }


  String numberToString(String str) {
    return str.replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => "${m[1]},");
  }

  getStringToDouble(String value){
    return value.isNotEmpty ? double.parse(value) : 0.0;
  }
}
