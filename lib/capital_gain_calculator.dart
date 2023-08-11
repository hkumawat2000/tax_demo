import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CapitalGainCalculator extends StatefulWidget {
  const CapitalGainCalculator({super.key});

  @override
  State<CapitalGainCalculator> createState() => _CapitalGainCalculatorState();
}

class _CapitalGainCalculatorState extends State<CapitalGainCalculator> {

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
  double taxableIncome = 0;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      expandedCrossAxisAlignment: CrossAxisAlignment.start,
      childrenPadding: const EdgeInsets.symmetric(horizontal: 20),
      tilePadding: EdgeInsets.zero,
      title: const Text("Capital Gain Calculator"),
      children: [
        const SizedBox(height: 10),
        DropdownButton(
          hint: const Text("Choose a Asset"),
          value: selectedAssetType,
          onChanged: (String? newValue) => setState(() => selectedAssetType = newValue),
          items: assetList.map((value) => DropdownMenuItem(value: value,child: Text(value))).toList(),
          elevation: 0,
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
              Text("Tax Percentage : $taxPercentage", style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              Text("Total Taxable Capital Gain : ${taxableIncome.toStringAsFixed(2)}", style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
            ],
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }


  capitalGainCalculation(){
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

    switch(selectedAssetType){
      case "Immovable property":
        if(years <= 2){
          capitalGainType = "Short Term Capital Gain";
        } else {
          capitalGainType = "Long Term Capital Gain";
        }
        break;
      case "Listed equity shares":
        if(years <= 1){
          capitalGainType = "Short Term Capital Gain";
        } else {
          capitalGainType = "Long Term Capital Gain";
        }
        break;
      case "Unlisted shares":
        if(years <= 2){
          capitalGainType = "Short Term Capital Gain";
        } else {
          capitalGainType = "Long Term Capital Gain";
        }
        break;
      case "Equity Mutual funds":
        if(years <= 1){
          capitalGainType = "Short Term Capital Gain";
        } else {
          capitalGainType = "Long Term Capital Gain";
        }
        break;
      case "Debt mutual funds":
        if(years <= 3){
          capitalGainType = "Short Term Capital Gain";
        } else {
          capitalGainType = "Long Term Capital Gain";
        }
        break;
      case "Other assets":
        if(years <= 3){
          capitalGainType = "Short Term Capital Gain";
        } else {
          capitalGainType = "Long Term Capital Gain";
        }
        break;
      case "Zero Coupon Bond":
        if(years <= 1){
          capitalGainType = "Short Term Capital Gain";
        } else {
          capitalGainType = "Long Term Capital Gain";
        }
        break;
    }
    indexedPurchasePrice = (purchasePrice * getCostInflationIndex(saleDate)) / getCostInflationIndex(purchaseDate);

    if(capitalGainType == "Short Term Capital Gain") {
      totalExpense = expense + improvementCode;
    } else {
      totalExpense = ((improvementCode * getCostInflationIndex(saleDate)) / getCostInflationIndex(improvementDate)) + expense;
    }

    capitalGain = netSalePrice - indexedPurchasePrice - totalExpense;

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
