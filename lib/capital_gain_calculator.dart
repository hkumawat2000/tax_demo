import 'dart:html';

import 'package:flutter/foundation.dart';
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
  TextEditingController transferExpenseTextController = TextEditingController();
  TextEditingController transferExpenseDateTextController = TextEditingController();

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
  String? indexedPurchasePrice;
  String? netSalePrice;
  String? totalExpense;
  String? capitalGain;
  int? taxPercentage;
  double? taxableIncome;

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
            ),
            const SizedBox(width: 10),
            Expanded(
              child: TextField(
                controller: transferExpenseDateTextController,
                keyboardType: const TextInputType.numberWithOptions(decimal: false),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp("[0-9/]")),
                  LengthLimitingTextInputFormatter(10),
                  _DateFormatter(),
                ],
                onChanged: (val) => setState((){}),
                decoration: InputDecoration(
                    labelText: "Date of Expense",
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
        const SizedBox(height: 20),
        AbsorbPointer(
          absorbing: isCalculateButtonEnable() ? false : true,
          child: MaterialButton(
            color: isCalculateButtonEnable() ? Colors.blue : Colors.grey,
            minWidth: double.infinity,
            height: 50,
            onPressed: (){
              FocusScope.of(context).unfocus();
              isVisible = !isVisible;
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
              Text("Indexed Purchase Price : $indexedPurchasePrice"),
              const SizedBox(height: 10),
              Text("Net Sale Price : $netSalePrice"),
              const SizedBox(height: 10),
              Text("Total Expense/Improvement : $totalExpense"),
              const SizedBox(height: 10),
              Text("Capital Gain : $capitalGain", style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              Text("Tax Percentage : $taxPercentage", style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              Text("Total Taxable Capital Gain : $taxableIncome", style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
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
    double salePrice = getStringToDouble(salePriceTextController.text.toString());
    String saleDate = dateOfSaleTextController.text.toString();
    double expense = getStringToDouble(transferExpenseTextController.text.toString());
    String expenseDate = transferExpenseDateTextController.text.toString();

    print("purchaseDate ==> $purchaseDate");
    print("saleDate ==> $saleDate");

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
    setState(() {});
  }

  isCalculateButtonEnable(){
    if(selectedAssetType == null || purchasePriceTextController.text.trim().isEmpty
        || salePriceTextController.text.trim().isEmpty
        || dateOfPurchaseTextController.text.trim().isEmpty
        || dateOfSaleTextController.text.trim().isEmpty
        || transferExpenseTextController.text.trim().isEmpty
        || transferExpenseDateTextController.text.trim().isEmpty){
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
