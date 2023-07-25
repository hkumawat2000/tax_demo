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
  double netCorpusAt60NPS = 0;
  double netCorpusAt60Asset = 0;
  double profitOnInvNPS = 0;
  double profitOnInvAsset = 0;
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
  double netReturnNSP = 0;
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
              Expanded(child: Text("Corpus at 60 : ₹ ${numberToString(corpusAt60NPS.toStringAsFixed(2))}")),
              const SizedBox(width: 20),
              Expanded(child: Text("Corpus at 60 : ₹ ${numberToString(corpusAt60Asset.toStringAsFixed(2))}")),
            ],
          ),

          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(child: Text("Profit on Investment : ₹ ${numberToString(profitOnInvNPS.toStringAsFixed(2))}")),
              const SizedBox(width: 20),
              Expanded(child: Text("Profit on Investment : ₹ ${numberToString(profitOnInvAsset.toStringAsFixed(2))}")),
            ],
          ),

          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(child: Text("Tax on Profit : ₹ ${numberToString(taxOnProNPS.toStringAsFixed(2))}")),
              const SizedBox(width: 20),
              Expanded(child: Text("Tax on Profit : ₹ ${numberToString(taxOnProAsset.toStringAsFixed(2))}")),
            ],
          ),

          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(child: Text("Lumpsum withdraw (at 60) : ₹ ${numberToString(withdrawNPS.toStringAsFixed(2))}")),
              const SizedBox(width: 20),
              Expanded(child: Text("Lumpsum withdraw (at 60) : ₹ ${numberToString(withdrawAsset.toStringAsFixed(2))}")),
            ],
          ),

          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(child: Text("Balance to be invested for Annuity : ₹ ${numberToString(balanceInvForAnnuityNPS.toStringAsFixed(2))}")),
              const SizedBox(width: 20),
              Expanded(child: Text("Balance to be invested for Annuity : ₹ ${numberToString(balanceInvForAnnuityAsset.toStringAsFixed(2))}")),
            ],
          ),

          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(child: Text("Annuity @ 6.5% per year : ₹ ${numberToString(annuityPerYearNPS.toStringAsFixed(2))}")),
              const SizedBox(width: 20),
              Expanded(child: Text("Annuity @ 6.5% per year : ₹ ${numberToString(annuityPerYearAsset.toStringAsFixed(2))}")),
            ],
          ),

          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(child: Text("Net Corpus at 60 : ₹ ${numberToString(netCorpusAt60NPS.toStringAsFixed(2))}")),
              const SizedBox(width: 20),
              Expanded(child: Text("Net Corpus at 60 : ₹ ${numberToString(netCorpusAt60Asset.toStringAsFixed(2))}")),
            ],
          ),

          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(child: Text("Value at 60 for 1 time investment : ₹ ${numberToString(valueAt60NPS.toStringAsFixed(2))}")),
              const SizedBox(width: 20),
              Expanded(child: Text("Value at 60 for 1 time investment : ₹ ${numberToString(valueAt60Asset.toStringAsFixed(2))}")),
            ],
          ),

          const SizedBox(height: 20),
          Row(
            children: [
              const Expanded(child: Text("")),
              const SizedBox(width: 20),
              Expanded(child: Text("Profit for 1 year : ₹ ${numberToString(profitFor1YearAsset.toStringAsFixed(2))}")),
            ],
          ),

          const SizedBox(height: 20),
          Row(
            children: [
              const Expanded(child: Text("")),
              const SizedBox(width: 20),
              Expanded(child: Text("Tax on profit : ₹ ${numberToString(taxOnProfitAsset.toStringAsFixed(2))}")),
            ],
          ),

          const SizedBox(height: 20),
          Row(
            children: [
              const Expanded(child: Text("")),
              const SizedBox(width: 20),
              Expanded(child: Text("Net return : ₹ ${numberToString(netReturnAsset.toStringAsFixed(2))}")),
            ],
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  calculateNPSValues(){

    double getCurrentAge = getStringToDouble(currentAgeTextEditingController.text.trim());
    double getTaxSlab = getStringToDouble(taxSlabTextEditingController.text.trim());
    double getInvNSP = getStringToDouble(investmentAmountTextEditingController.text.trim());
    double getInvAsset = getStringToDouble(investmentAssetAmountTextEditingController.text.trim());
    double getReturnOnNSP = getStringToDouble(returnOnNPSTextEditingController.text.trim());
    double getReturnOnAsset = getStringToDouble(returnOnAssetsTextEditingController.text.trim());

    if(investmentAmountTextEditingController.text.isNotEmpty) {
      investmentAssetAmountTextEditingController.text = (getInvNSP * (100 - getStringToDouble(taxSlabTextEditingController.text.trim())) / 100).toStringAsFixed(0);
    }

    yearTo60NPS = 60 - getCurrentAge;
    yearTo60Asset = 60 - getCurrentAge;


    corpusAt60NPS = 0;
    corpusAt60Asset = 0;
    valueAt60NPS = 0;
    valueAt60NPS += getInvNSP;
    for(int i=0; i<yearTo60NPS; i++){
      if(i != 0){
        corpusAt60NPS += corpusAt60NPS * (getReturnOnNSP / 100);
      }
      corpusAt60NPS += getInvNSP;
      valueAt60NPS += valueAt60NPS * (getReturnOnNSP / 100);
    }


    valueAt60Asset = 0;
    valueAt60Asset += getInvAsset;
    for(int i=0; i<yearTo60Asset; i++){
      if(i != 0){
        corpusAt60Asset += corpusAt60Asset * (getReturnOnAsset / 100);
      }
      corpusAt60Asset += getInvAsset;
      valueAt60Asset += valueAt60Asset * (getReturnOnAsset / 100);
    }


    profitOnInvNPS = corpusAt60NPS - (getInvNSP * yearTo60NPS);
    profitOnInvAsset = corpusAt60Asset - (getInvAsset * yearTo60Asset);

    taxOnProNPS = 0;
    taxOnProAsset = (profitOnInvAsset - 100000) * 0.1;

    withdrawNPS = corpusAt60NPS * 0.6;
    withdrawAsset = corpusAt60Asset;

    balanceInvForAnnuityNPS = corpusAt60NPS - withdrawNPS;
    balanceInvForAnnuityAsset = 0;

    annuityPerYearNPS = balanceInvForAnnuityNPS * 0.065;
    annuityPerYearAsset = 0;

    netCorpusAt60NPS = corpusAt60NPS - taxOnProNPS;
    netCorpusAt60Asset = corpusAt60Asset - taxOnProAsset;

    profitFor1YearAsset = valueAt60Asset - getInvAsset;

    taxOnProfitAsset = profitFor1YearAsset * 0.1;

    netReturnNSP = valueAt60NPS;
    netReturnAsset = valueAt60Asset - taxOnProfitAsset;

    setState(() {});
  }


  String numberToString(String str) {
    return str.replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => "${m[1]},");
  }

  getStringToDouble(String value){
    return value.isNotEmpty ? double.parse(value) : 0.0;
  }
}
