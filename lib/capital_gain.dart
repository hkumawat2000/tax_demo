import 'package:flutter/material.dart';

class _CapitalGainsState extends State<CapitalGains> {

  TextEditingController saleValueTextEditingController = TextEditingController();
  TextEditingController expenseOnSaleTextEditingController = TextEditingController();
  TextEditingController purchasePriceTextEditingController = TextEditingController();
  TextEditingController costTextEditingController = TextEditingController();


  double stNetSaleValue = 0;
  double stTotalCost = 0;
  double stCapitalGain = 0;
  double stTaxableGain = 0;

  double ltNetSaleValue = 0;
  double ltPurchasePrice = 0;
  double ltTotalCost = 0;
  double ltCapitalGain = 0;
  double ltTaxableGain = 0;

  List<String> yearList = [
    "2001-02", "20012-03", "2003-04", "2004-05", "2005-06", "2006-07",
    "2007-08", "2008-09", "2009-10", "2010-11", "2011-12", "2012-13",
    "2013-14", "2014-15", "2015-16", "2016-17", "2017-18", "2018-19",
    "2019-20", "2020-21", "2021-22", "2022-23", "2023-24"
  ];

  String? purchaseYear;
  String? saleYear;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      expandedCrossAxisAlignment: CrossAxisAlignment.start,
      childrenPadding: const EdgeInsets.symmetric(horizontal: 20),
      tilePadding: EdgeInsets.zero,
      title: const Text("Capital Gains"),
      children: [
        const SizedBox(height: 10),
        TextField(
          controller: saleValueTextEditingController,
          keyboardType: TextInputType.number,
          style: const TextStyle(color: Colors.black),
          decoration: InputDecoration(
              labelText: "Sale value",
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
        const SizedBox(height: 10),
        TextField(
          controller: expenseOnSaleTextEditingController,
          keyboardType: TextInputType.number,
          style: const TextStyle(color: Colors.black),
          decoration: InputDecoration(
              labelText: "Expenses on sale",
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
        const SizedBox(height: 10),
        TextField(
          controller: purchasePriceTextEditingController,
          keyboardType: TextInputType.number,
          style: const TextStyle(color: Colors.black),
          decoration: InputDecoration(
              labelText: "Purchase price",
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
        const SizedBox(height: 10),
        TextField(
          controller: costTextEditingController,
          keyboardType: TextInputType.number,
          style: const TextStyle(color: Colors.black),
          decoration: InputDecoration(
              labelText: "Improvement cost (Renovation etc)",
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
        const SizedBox(height: 10),
        const Text("Purchase Year"),
        const SizedBox(height: 5),
        DropdownButton(
          hint: const Text("Please choose a year"),
          value: purchaseYear,
          onChanged: (String? newValue) => setState(() => purchaseYear = newValue),
          items: yearList.map((value) => DropdownMenuItem(value: value,child: Text(value))).toList(),
        ),
        const SizedBox(height: 10),
        const Text("Sale Year"),
        const SizedBox(height: 5),
        DropdownButton(
          hint: const Text("Please choose a year"),
          value: saleYear,
          onChanged: (String? newValue) => setState(() => saleYear = newValue),
          items: yearList.map((value) => DropdownMenuItem(value: value,child: Text(value))).toList(),
        ),
        const SizedBox(height: 10),
        MaterialButton(
          color: Colors.blue,
          minWidth: double.infinity,
          height: 50,
          onPressed: (){
            FocusScope.of(context).unfocus();
            calculateTaxTerm();
            setState(() {});
          },
          child: const Text("Calculate", style: TextStyle(color: Colors.white, fontSize: 20),),
        ),
        const SizedBox(height: 20),

        const Text("Short term capital gain", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        Text("Net sales value                     :  ${numberToString(stNetSaleValue.toStringAsFixed(2))}"),
        Text("Total cost                              :  ${numberToString(stTotalCost.toStringAsFixed(2))}"),
        Text("Capital Gain                          :  ${numberToString(stCapitalGain.toStringAsFixed(2))}"),
        const Text("Exemptions u/s 54B/ 54D  :  50,000"),
        Text("Taxable Capital Gain           :  ${numberToString(stTaxableGain.toStringAsFixed(2))}"),
        const SizedBox(height: 20),
        const Text("Long term capital gain", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        Text("Net sales value                     :  ${numberToString(ltNetSaleValue.toStringAsFixed(2))}"),
        Text("Purchase price (Indexed)   :  ${numberToString(ltTotalCost.toStringAsFixed(2))}"),

        Text("Total cost                              :  ${numberToString(ltTotalCost.toStringAsFixed(2))}"),
        Text("Capital Gain                          :  ${numberToString(ltCapitalGain.toStringAsFixed(2))}"),
        const Text("Exemptions u/s 54B/ 54D  :  0"),
        Text("Taxable Capital Gain           :  ${numberToString(ltTaxableGain.toStringAsFixed(2))}"),
        const SizedBox(height: 20),
      ],
    );
  }

  calculateTaxTerm(){
    double etSaleVault = getStringToDouble(saleValueTextEditingController.text.toString().trim());
    double etExpenseOnSale = getStringToDouble(expenseOnSaleTextEditingController.text.toString().trim());
    double etPurchasePrice = getStringToDouble(purchasePriceTextEditingController.text.toString().trim());
    double etImproveCost = getStringToDouble(costTextEditingController.text.toString().trim());


    stNetSaleValue = etSaleVault - etExpenseOnSale;
    stTotalCost = etPurchasePrice + etImproveCost;
    stCapitalGain = stNetSaleValue - stTotalCost;
    stTaxableGain = stCapitalGain - 50000;




    ltNetSaleValue = etSaleVault - etExpenseOnSale;
    ltPurchasePrice = (etPurchasePrice * getCostInflationIndex(saleYear!)) / getCostInflationIndex(purchaseYear!);
    ltTotalCost = ltPurchasePrice + etImproveCost;
    ltCapitalGain = ltNetSaleValue - ltTotalCost;
    ltTaxableGain = ltCapitalGain - 0;

  }

  int getCostInflationIndex(String year) {
    switch(year){
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
        return 0;
    }
  }

  String numberToString(String str) {
    return str.replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => "${m[1]},");
  }

  getStringToDouble(String value){
    return value.isNotEmpty ? double.parse(value) : 0;
  }
}

class CapitalGains extends StatefulWidget {
  const CapitalGains({Key? key}) : super(key: key);

  @override
  State<CapitalGains> createState() => _CapitalGainsState();
}
