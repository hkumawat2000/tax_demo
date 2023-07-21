import 'package:flutter/material.dart';

class NPSCalculator extends StatefulWidget {
  const NPSCalculator({Key? key}) : super(key: key);

  @override
  State<NPSCalculator> createState() => _NPSCalculatorState();
}

class _NPSCalculatorState extends State<NPSCalculator> {


  TextEditingController currentAgeTextEditingController = TextEditingController();
  TextEditingController taxSlabTextEditingController = TextEditingController();
  TextEditingController investmentAmountTextEditingController = TextEditingController();
  TextEditingController investmentAssetAmountTextEditingController = TextEditingController();
  TextEditingController returnOnNPSTextEditingController = TextEditingController();
  TextEditingController returnOnAssetsTextEditingController = TextEditingController();

  double yearTo60NPS = 0;
  double yearTo60Asset = 0;
  double corpusAt60NPS = 0;
  double corpusAt60Asset = 0;
  double profitOnInvNPS = 0;
  double profileOnInvAsset = 0;
  double taxOnProNPS = 0;
  double taxOnProAsset = 0;
  double withdrawNPS = 0;
  double withdrawAsset = 0;
  double balanceInvForAnnuityNPS = 0;
  double balanceInvForAnnuityAsset = 0;
  double annuityPerYearNPS = 0;
  double annuityPerYearAsset = 0;
  double valueAt60NPS = 0;
  double valueAt60Asset = 0;
  double profitFor1YearAsset = 0;
  double taxOnProfitAsset = 0;
  double netReturnAsset = 0;





  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ExpansionTile(
        title: const Text("NPS Calculator"),
        expandedCrossAxisAlignment: CrossAxisAlignment.start,
        childrenPadding: const EdgeInsets.symmetric(horizontal: 20),
        tilePadding: EdgeInsets.zero,
        children: [
          const SizedBox(height: 20),
          TextField(
            controller: currentAgeTextEditingController,
            keyboardType: TextInputType.number,
            style: const TextStyle(color: Colors.black),
            onChanged: (val) => calculateNPSValues(),
            decoration: InputDecoration(
                labelText: "Current Age",
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
            controller: taxSlabTextEditingController,
            keyboardType: TextInputType.number,
            style: const TextStyle(color: Colors.black),
            onChanged: (val) => calculateNPSValues(),
            decoration: InputDecoration(
                labelText: "Current Tax Slab",
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
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: investmentAmountTextEditingController,
                  keyboardType: TextInputType.number,
                  style: const TextStyle(color: Colors.black),
                  onChanged: (val) => calculateNPSValues(),
                  decoration: InputDecoration(
                      labelText: "Investment (10% of basic of employer contribution)",
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
              const SizedBox(width: 20),
              Expanded(
                child: TextField(
                  controller: investmentAssetAmountTextEditingController,
                  keyboardType: TextInputType.number,
                  style: const TextStyle(color: Colors.black),
                  onChanged: (val) => calculateNPSValues(),
                  readOnly: true,
                  decoration: InputDecoration(
                      labelText: "Investment (10% of basic of employer contribution)",
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
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: returnOnNPSTextEditingController,
                  keyboardType: TextInputType.number,
                  style: const TextStyle(color: Colors.black),
                  onChanged: (val) => calculateNPSValues(),
                  decoration: InputDecoration(
                      labelText: "Return On NPS",
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
              const SizedBox(width: 20),
              Expanded(
                child: TextField(
                  controller: returnOnAssetsTextEditingController,
                  keyboardType: TextInputType.number,
                  style: const TextStyle(color: Colors.black),
                  onChanged: (val) => calculateNPSValues(),
                  decoration: InputDecoration(
                      labelText: "Return On other asset",
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
          Row(
            children: [
              Expanded(child: Text("Years to 60 : ₹ $yearTo60NPS")),
              const SizedBox(width: 20),
              Expanded(child: Text("Years to 60 : ₹ $yearTo60Asset")),
            ],
          ),

          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(child: Text("Corpus at 60 : ₹ $corpusAt60NPS")),
              const SizedBox(width: 20),
              Expanded(child: Text("Corpus at 60 : ₹ $corpusAt60Asset")),
            ],
          ),

          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(child: Text("Profit on Investment : ₹ $profitOnInvNPS")),
              const SizedBox(width: 20),
              Expanded(child: Text("Profit on Investment : ₹ $profileOnInvAsset")),
            ],
          ),

          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(child: Text("Tax on Profit : ₹ $taxOnProNPS")),
              const SizedBox(width: 20),
              Expanded(child: Text("Tax on Profit : ₹ $taxOnProAsset")),
            ],
          ),

          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(child: Text("Lumpsum withdraw (at 60) : ₹ $withdrawNPS")),
              const SizedBox(width: 20),
              Expanded(child: Text("Lumpsum withdraw (at 60) : ₹ $withdrawAsset")),
            ],
          ),

          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(child: Text("Balance to be invested for Annuity : ₹ $balanceInvForAnnuityNPS")),
              const SizedBox(width: 20),
              Expanded(child: Text("Balance to be invested for Annuity : ₹ $balanceInvForAnnuityAsset")),
            ],
          ),

          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(child: Text("Annuity @ 5% per year : ₹ $annuityPerYearNPS")),
              const SizedBox(width: 20),
              Expanded(child: Text("Annuity @ 5% per year : ₹ $annuityPerYearAsset")),
            ],
          ),

          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(child: Text("Value at 60 for 1 time investment : ₹ $valueAt60NPS")),
              const SizedBox(width: 20),
              Expanded(child: Text("Value at 60 for 1 time investment : ₹ $valueAt60Asset")),
            ],
          ),

          const SizedBox(height: 20),
          Row(
            children: [
              const Expanded(child: Text("")),
              const SizedBox(width: 20),
              Expanded(child: Text("Profit for 1 year : ₹ $profitFor1YearAsset")),
            ],
          ),

          const SizedBox(height: 20),
          Row(
            children: [
              const Expanded(child: Text("")),
              const SizedBox(width: 20),
              Expanded(child: Text("Tax on profit : ₹ $taxOnProAsset")),
            ],
          ),

          const SizedBox(height: 20),
          Row(
            children: [
              const Expanded(child: Text("")),
              const SizedBox(width: 20),
              Expanded(child: Text("Net return : ₹ $netReturnAsset")),
            ],
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  calculateNPSValues(){

  }


  String numberToString(String str) {
    return str.replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => "${m[1]},");
  }

  getStringToDouble(String value){
    return value.isNotEmpty ? double.parse(value) : 0.0;
  }
}
