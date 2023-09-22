import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CapitalGainCalculator extends StatefulWidget {
  const CapitalGainCalculator({super.key});

  @override
  State<CapitalGainCalculator> createState() => _CapitalGainCalculatorState();
}

class _CapitalGainCalculatorState extends State<CapitalGainCalculator> {

  TextEditingController ageTextController = TextEditingController();
  TextEditingController taxableIncomeTextController = TextEditingController();
  TextEditingController dateOfPurchaseTextController = TextEditingController();
  TextEditingController dateOfSaleTextController = TextEditingController();
  TextEditingController purchasePriceTextController = TextEditingController();
  TextEditingController salePriceTextController = TextEditingController();
  TextEditingController improvementCostTextController = TextEditingController();
  TextEditingController transferExpenseTextController = TextEditingController();
  TextEditingController improvementDateTextController = TextEditingController();

  String? selectedAssetType;
  List<String> assetList = [
    "Immovable property",
    "Listed equity shares",
    "Unlisted shares",
    "Equity Mutual funds",
    "Debt mutual funds",
    "Other assets",
    "Zero Coupon Bond",
  ];

  bool isVisible = false;
  String? capitalGainType;
  double indexedPurchasePrice = 0;
  double netSalePrice = 0;
  double totalExpense = 0;
  double capitalGain = 0;
  int taxPercentage = 0;
  double taxableCapitalGainOldRegime = 0;
  double taxableCapitalGainNewRegime = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          Row(
            children: [
              DropdownButton(
                hint: const Text("Choose a Asset"),
                value: selectedAssetType,
                onChanged: (String? newValue) => setState(() => selectedAssetType = newValue),
                items: assetList.map((value) => DropdownMenuItem(value: value,child: Text(value))).toList(),
                elevation: 0,
                // isExpanded: true,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: TextField(
                  controller: ageTextController,
                  keyboardType: TextInputType.number,
                  style: const TextStyle(color: Colors.black),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp("[0-9]")),
                  ],
                  onChanged: (val) => setState((){}),
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
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: TextField(
                  controller: taxableIncomeTextController,
                  keyboardType: TextInputType.number,
                  style: const TextStyle(color: Colors.black),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp("[0-9]")),
                  ],
                  onChanged: (val) => setState((){}),
                  decoration: InputDecoration(
                      labelText: "Taxable Income",
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
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: purchasePriceTextController,
                  keyboardType: TextInputType.number,
                  style: const TextStyle(color: Colors.black),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp("[0-9]")),
                  ],
                  onChanged: (val) => setState((){}),
                  decoration: InputDecoration(
                      labelText: "Purchase Price",
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
              ),
              const SizedBox(width: 10),
              Expanded(
                child: TextField(
                  controller: dateOfPurchaseTextController,
                  keyboardType: const TextInputType.numberWithOptions(decimal: false),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp("[0-9/]")),
                    LengthLimitingTextInputFormatter(10),
                    _DateFormatter(),
                  ],
                  onChanged: (val) => setState((){}),
                  decoration: InputDecoration(
                      labelText: "Date of Purchase",
                      hintText: "DD/MM/YYYY",
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
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: salePriceTextController,
                  keyboardType: TextInputType.number,
                  style: const TextStyle(color: Colors.black),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp("[0-9]")),
                  ],
                  onChanged: (val) => setState((){}),
                  decoration: InputDecoration(
                      labelText: "Sale Price",
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
              ),
              const SizedBox(width: 10),
              Expanded(
                child: TextField(
                  controller: dateOfSaleTextController,
                  keyboardType: const TextInputType.numberWithOptions(decimal: false),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp("[0-9/]")),
                    LengthLimitingTextInputFormatter(10),
                    _DateFormatter(),
                  ],
                  onChanged: (val) => setState((){}),
                  decoration: InputDecoration(
                      labelText: "Date of Sale",
                      hintText: "DD/MM/YYYY",
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
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: improvementCostTextController,
                  keyboardType: TextInputType.number,
                  style: const TextStyle(color: Colors.black),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp("[0-9]")),
                  ],
                  onChanged: (val) => setState((){}),
                  decoration: InputDecoration(
                      labelText: "Improvement Cost",
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
              ),
              const SizedBox(width: 10),
              Expanded(
                child: TextField(
                  controller: improvementDateTextController,
                  keyboardType: const TextInputType.numberWithOptions(decimal: false),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp("[0-9/]")),
                    LengthLimitingTextInputFormatter(10),
                    _DateFormatter(),
                  ],
                  onChanged: (val) => setState((){}),
                  decoration: InputDecoration(
                      labelText: "Date of Improvement",
                      hintText: "DD/MM/YYYY",
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
              ),
            ],
          ),
          const SizedBox(height: 10),
          TextField(
            controller: transferExpenseTextController,
            keyboardType: TextInputType.number,
            style: const TextStyle(color: Colors.black),
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp("[0-9]")),
            ],
            onChanged: (val) => setState((){}),
            decoration: InputDecoration(
                labelText: "Transfer Expense",
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
          AbsorbPointer(
            absorbing: isCalculateButtonEnable() ? false : true,
            child: MaterialButton(
              color: isCalculateButtonEnable() ? Colors.blue : Colors.grey,
              minWidth: double.infinity,
              height: 50,
              onPressed: (){
                FocusScope.of(context).unfocus();
                isVisible = true;
                capitalGainCalculation();
              },
              child: const Text("Calculate Capital Gain", style: TextStyle(color: Colors.white, fontSize: 20),),
            ),
          ),
          const SizedBox(height: 20),

          Visibility(
            visible: isVisible,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("$capitalGainType", style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                Text("Indexed Purchase Price : ${indexedPurchasePrice.toStringAsFixed(2)}"),
                const SizedBox(height: 10),
                Text("Net Sale Price : ${netSalePrice.toStringAsFixed(2)}"),
                const SizedBox(height: 10),
                Text("Total Expense/Improvement : ${totalExpense.toStringAsFixed(2)}"),
                const SizedBox(height: 10),
                Text("Capital Gain : ${capitalGain.toStringAsFixed(2)}", style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                Text("Tax Percentage : ${taxPercentage == 0 ? "Based on Tax Slab": "$taxPercentage%"}", style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                Text("Total Taxable Capital Gain Old Regime: ${taxableCapitalGainOldRegime.toStringAsFixed(2)}", style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                Text("Total Taxable Capital Gain New Regime: ${taxableCapitalGainNewRegime.toStringAsFixed(2)}", style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
              ],
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }


  capitalGainCalculation(){
    double totalIncome = getStringToDouble(taxableIncomeTextController.text.toString());
    double purchasePrice = getStringToDouble(purchasePriceTextController.text.toString());
    String purchaseDate = dateOfPurchaseTextController.text.toString();
    netSalePrice = getStringToDouble(salePriceTextController.text.toString());
    String saleDate = dateOfSaleTextController.text.toString();
    double expense = getStringToDouble(transferExpenseTextController.text.toString());
    double improvementCode = getStringToDouble(improvementCostTextController.text.toString());
    String improvementDate = improvementDateTextController.text.toString();

    // Get difference in 2 date
    DateTime a = DateTime.utc(int.parse(saleDate.split("/")[2]), int.parse(saleDate.split("/")[1]), int.parse(saleDate.split("/")[0]));
    DateTime b = DateTime.utc(int.parse(purchaseDate.split("/")[2]), int.parse(purchaseDate.split("/")[1]), int.parse(purchaseDate.split("/")[0]));
    double years = a.difference(b).inDays / 365;

    indexedPurchasePrice = (purchasePrice * getCostInflationIndex(saleDate)) / getCostInflationIndex(purchaseDate);

    if(capitalGainType == "Short Term Capital Gain") {
      totalExpense = expense + improvementCode;
    } else {
      totalExpense = ((improvementCode * getCostInflationIndex(saleDate)) / getCostInflationIndex(improvementDate)) + expense;
    }

    capitalGain = netSalePrice - indexedPurchasePrice - totalExpense;

    switch(selectedAssetType){
      case "Immovable property":
        if(years <= 2){
          capitalGainType = "Short Term Capital Gain";
          taxPercentage = 0;
          taxableCapitalGainOldRegime = taxCalculateWithOldRegime(int.parse(ageTextController.text.toString()), totalIncome + capitalGain)
              - taxCalculateWithOldRegime(int.parse(ageTextController.text.toString()), totalIncome);
          taxableCapitalGainNewRegime = taxCalculateWithNewRegime(totalIncome + capitalGain) - taxCalculateWithNewRegime(totalIncome);
        } else {
          capitalGainType = "Long Term Capital Gain";
          taxPercentage = 20;
          taxableCapitalGainOldRegime = capitalGain * taxPercentage / 100;
          taxableCapitalGainNewRegime = taxableCapitalGainOldRegime;
        }
        break;
      case "Listed equity shares":
        if(years <= 1){
          capitalGainType = "Short Term Capital Gain";
          taxPercentage = 15;
          taxableCapitalGainOldRegime = capitalGain * taxPercentage / 100;
          taxableCapitalGainNewRegime = taxableCapitalGainOldRegime;
        } else {
          capitalGainType = "Long Term Capital Gain";
          taxPercentage = 20;
          taxableCapitalGainOldRegime = max((capitalGain - 100000), 0) * taxPercentage / 100;
          taxableCapitalGainNewRegime = taxableCapitalGainOldRegime;
        }
        break;
      case "Unlisted shares":
        if(years <= 2){
          capitalGainType = "Short Term Capital Gain";
          taxPercentage = 0;
          taxableCapitalGainOldRegime = taxCalculateWithOldRegime(int.parse(ageTextController.text.toString()), totalIncome + capitalGain)
              - taxCalculateWithOldRegime(int.parse(ageTextController.text.toString()), totalIncome);
          taxableCapitalGainNewRegime = taxCalculateWithNewRegime(totalIncome + capitalGain) - taxCalculateWithNewRegime(totalIncome);
        } else {
          capitalGainType = "Long Term Capital Gain";
          taxPercentage = 10;
          taxableCapitalGainOldRegime = capitalGain * taxPercentage / 100;
          taxableCapitalGainNewRegime = taxableCapitalGainOldRegime;
        }
        break;
      case "Equity Mutual funds":
        if(years <= 1){
          capitalGainType = "Short Term Capital Gain";
          taxPercentage = 15;
          taxableCapitalGainOldRegime = capitalGain * taxPercentage / 100;
          taxableCapitalGainNewRegime = taxableCapitalGainOldRegime;
        } else {
          capitalGainType = "Long Term Capital Gain";
          taxPercentage = 20;
          taxableCapitalGainOldRegime = max((capitalGain - 100000), 0) * taxPercentage / 100;
          taxableCapitalGainNewRegime = taxableCapitalGainOldRegime;
        }
        break;
      case "Debt mutual funds":
        if(years <= 3){
          capitalGainType = "Short Term Capital Gain";
          taxPercentage = 0;
          taxableCapitalGainOldRegime = taxCalculateWithOldRegime(int.parse(ageTextController.text.toString()), totalIncome + capitalGain)
              - taxCalculateWithOldRegime(int.parse(ageTextController.text.toString()), totalIncome);
          taxableCapitalGainNewRegime = taxCalculateWithNewRegime(totalIncome + capitalGain) - taxCalculateWithNewRegime(totalIncome);
        } else {
          capitalGainType = "Long Term Capital Gain";
          taxPercentage = 20;
          taxableCapitalGainOldRegime = capitalGain * taxPercentage / 100;
          taxableCapitalGainNewRegime = taxableCapitalGainOldRegime;
        }
        break;
      case "Other assets":
        if(years <= 3){
          capitalGainType = "Short Term Capital Gain";
          taxPercentage = 0;
          taxableCapitalGainOldRegime = taxCalculateWithOldRegime(int.parse(ageTextController.text.toString()), totalIncome + capitalGain)
              - taxCalculateWithOldRegime(int.parse(ageTextController.text.toString()), totalIncome);
          taxableCapitalGainNewRegime = taxCalculateWithNewRegime(totalIncome + capitalGain) - taxCalculateWithNewRegime(totalIncome);
        } else {
          capitalGainType = "Long Term Capital Gain";
          taxPercentage = 20;
          taxableCapitalGainOldRegime = capitalGain * taxPercentage / 100;
          taxableCapitalGainNewRegime = taxableCapitalGainOldRegime;
        }
        break;
      case "Zero Coupon Bond":
        if(years <= 1){
          capitalGainType = "Short Term Capital Gain";
          taxPercentage = 0;
          taxableCapitalGainOldRegime = taxCalculateWithOldRegime(int.parse(ageTextController.text.toString()), totalIncome + capitalGain)
              - taxCalculateWithOldRegime(int.parse(ageTextController.text.toString()), totalIncome);
          taxableCapitalGainNewRegime = taxCalculateWithNewRegime(totalIncome + capitalGain) - taxCalculateWithNewRegime(totalIncome);
        } else {
          capitalGainType = "Long Term Capital Gain";
          taxPercentage = 20;
          taxableCapitalGainOldRegime = capitalGain * taxPercentage / 100;
          taxableCapitalGainNewRegime = taxableCapitalGainOldRegime;
        }
        break;
    }

    setState(() {});
  }

  isCalculateButtonEnable(){
    if(selectedAssetType == null || purchasePriceTextController.text.trim().isEmpty
        || salePriceTextController.text.trim().isEmpty
        || dateOfPurchaseTextController.text.trim().isEmpty
        || dateOfSaleTextController.text.trim().isEmpty
        || transferExpenseTextController.text.trim().isEmpty
        || improvementDateTextController.text.trim().isEmpty){
      return false;
    } else {
      return true;
    }
  }

  String numberToString(String str) {
    return str.replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => "${m[1]},");
  }

  getStringToDouble(String value){
    return value.isNotEmpty ? double.parse(value) : 0;
  }


  int getCostInflationIndex(String date) {
    String financialYear = "";
    int month = int.parse(date.split("/")[1]);
    int year = int.parse(date.split("/")[2]);

    if(month <= 3){
      financialYear = "${year - 1}-${year.toString().substring(2)}";
    } else {
      financialYear = "$year-${(year + 1).toString().substring(2)}";
    }

    switch(financialYear){
      case "2001-02":
        return 100;
      case "20012-03":
        return 105;
      case "2003-04":
        return 109;
      case "2004-05":
        return 113;
      case "2005-06":
        return 117;
      case "2006-07":
        return 122;
      case "2007-08":
        return 129;
      case "2008-09":
        return 137;
      case "2009-10":
        return 148;
      case "2010-11":
        return 167;
      case "2011-12":
        return 184;
      case "2012-13":
        return 200;
      case "2013-14":
        return 220;
      case "2014-15":
        return 240;
      case "2015-16":
        return 254;
      case "2016-17":
        return 264;
      case "2017-18":
        return 272;
      case "2018-19":
        return 280;
      case "2019-20":
        return 289;
      case "2020-21":
        return 301;
      case "2021-22":
        return 317;
      case "2022-23":
        return 331;
      case "2023-24":
        return 348;
      default:
        return 1;
    }
  }


  getCitizenType(int age){
    String citizenType = "";
    if(age == 0) {
      citizenType = "";
    } else if(age <= 60) {
      citizenType = "Normal Citizen";
    } else if(age >= 60 && age <= 80){
      citizenType = "Senior Citizen";
    } else {
      citizenType = "Super Senior Citizen";
    }
    return citizenType;
  }


  double taxCalculateWithOldRegime(int age, double totalTaxableIncome){
    double netPayableTax = 0;
    String citizenType = getCitizenType(age);
    if(citizenType == "Normal Citizen"){
      if(totalTaxableIncome <= 250000){
        netPayableTax = 0;
      } else if(totalTaxableIncome > 250001 && totalTaxableIncome <= 500000){
        netPayableTax = (totalTaxableIncome - 250000) * 0.05;
      } else if(totalTaxableIncome > 500001 && totalTaxableIncome <= 1000000){
        netPayableTax = 12500 + (totalTaxableIncome - 500000) * 0.2;
      } else if(totalTaxableIncome > 1000001){
        netPayableTax = 112500 + (totalTaxableIncome - 1000000) * 0.3;
      }
    } else if(citizenType == "Senior Citizen"){
      if(totalTaxableIncome <= 300000){
        netPayableTax = 0;
      } else if(totalTaxableIncome > 300001 && totalTaxableIncome <= 500000){
        netPayableTax = (totalTaxableIncome - 300000) * 0.05;
      } else if(totalTaxableIncome > 500001 && totalTaxableIncome <= 1000000){
        netPayableTax = 10000 + (totalTaxableIncome - 500000) * 0.2;
      } else if(totalTaxableIncome > 1000001){
        netPayableTax = 110000 + (totalTaxableIncome - 1000000) * 0.3;
      }
    } else {
      if(totalTaxableIncome <= 500000){
        netPayableTax = 0;
      } else if(totalTaxableIncome > 500001 && totalTaxableIncome <= 1000000){
        netPayableTax = (totalTaxableIncome - 500000) * 0.2;
      } else if(totalTaxableIncome > 1000001){
        netPayableTax = 100000 + (totalTaxableIncome - 1000000) * 0.3;
      }
    }
    return netPayableTax;
  }


  double taxCalculateWithNewRegime(double totalTaxableIncomeNewRegime){
    double newPayableTaxAmount = 0;
    if(totalTaxableIncomeNewRegime <= 300000){
      newPayableTaxAmount = 0;
    } else if(totalTaxableIncomeNewRegime >= 300001 && totalTaxableIncomeNewRegime <= 600000){
      newPayableTaxAmount = (totalTaxableIncomeNewRegime - 300000) * 0.05;
    } else if(totalTaxableIncomeNewRegime >= 600001 && totalTaxableIncomeNewRegime <= 900000){
      newPayableTaxAmount = 15000 + (totalTaxableIncomeNewRegime - 600000) * 0.1;
    } else if(totalTaxableIncomeNewRegime >= 900001 && totalTaxableIncomeNewRegime <= 1200000){
      newPayableTaxAmount = 45000 + (totalTaxableIncomeNewRegime - 900000) * 0.15;
    } else if(totalTaxableIncomeNewRegime >= 1200001 && totalTaxableIncomeNewRegime <= 1500000){
      newPayableTaxAmount = 90000 + (totalTaxableIncomeNewRegime - 1200000) * 0.2;
    } else if(totalTaxableIncomeNewRegime >= 1500001){
      newPayableTaxAmount = 150000 + (totalTaxableIncomeNewRegime - 1500000) * 0.3;
    }
    return newPayableTaxAmount;
  }
}


class _DateFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue prevText, TextEditingValue currText) {
    int selectionIndex;
    String pText = prevText.text;
    String cText = currText.text;
    int cLen = cText.length;
    int pLen = pText.length;

    if (cLen == 1) {
      if (int.parse(cText) > 3) {
        cText = '';
      }
    } else if (cLen == 2 && pLen == 1) {
      int dd = int.parse(cText.substring(0, 2));
      if (dd == 0 || dd > 31) {
        cText = cText.substring(0, 1);
      } else {
        cText += '/';
      }
    } else if (cLen == 4) {
      if (int.parse(cText.substring(3, 4)) > 1) {
        cText = cText.substring(0, 3);
      }
    } else if (cLen == 5 && pLen == 4) {
      int mm = int.parse(cText.substring(3, 5));
      if (mm == 0 || mm > 12) {
        cText = cText.substring(0, 4);
      } else {
        cText += '/';
      }
    } else if ((cLen == 3 && pLen == 4) || (cLen == 6 && pLen == 7)) {
      cText = cText.substring(0, cText.length - 1);
    } else if (cLen == 3 && pLen == 2) {
      if (int.parse(cText.substring(2, 3)) > 1) {
        cText = '${cText.substring(0, 2)}/';
      } else {
        cText = '${cText.substring(0, pLen)}/${cText.substring(pLen, pLen + 1)}';
      }
    } else if (cLen == 6 && pLen == 5) {
      int y1 = int.parse(cText.substring(5, 6));
      if (y1 < 1 || y1 > 2) {
        cText = '${cText.substring(0, 5)}/';
      } else {
        cText = '${cText.substring(0, 5)}/${cText.substring(5, 6)}';
      }
    } else if (cLen == 7) {
      int y1 = int.parse(cText.substring(6, 7));
      if (y1 < 1 || y1 > 2) {
        cText = cText.substring(0, 6);
      }
    } else if (cLen == 8) {
      int y2 = int.parse(cText.substring(6, 8));
      if (y2 < 19 || y2 > 20) {
        cText = cText.substring(0, 7);
      }
    }

    selectionIndex = cText.length;
    return TextEditingValue(text: cText,
        selection: TextSelection.collapsed(offset: selectionIndex));
  }
}
