import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tax/all_calculator.dart';
import 'package:tax/capital_gain.dart';
import 'package:tax/capital_gain_calculator.dart';
import 'package:tax/form16/upload_form16_a.dart';
import 'package:tax/hra_calculator.dart';
import 'package:tax/nps_calculator.dart';
import 'package:tax/tax_calculator.dart';

void main() async {

  if(kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyA-ZM43ATaQWPf2H3UCSCRHnfMn8ZA7eMI",
        authDomain: "tax-planning-a0ce7.firebaseapp.com",
        projectId: "tax-planning-a0ce7",
        storageBucket: "tax-planning-a0ce7.appspot.com",
        messagingSenderId: "470562996829",
        appId: "1:470562996829:web:3bae83f0e15948ba96c3b4",
        measurementId: "G-LD0HHMFYHF",
      ),
    );
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/' : (context) => const AllCalculator(),
        '/hra': (context) => const HRACalculator(),
        '/nps': (context) => const NPSCalculator(),
        '/oldCapitalGain': (context) => const CapitalGains(),
        '/capitalGain': (context) => const CapitalGainCalculator(),
        '/tax': (context) => const TaxCalculator(),
        '/form16': (context) => const UploadForm16(),
      },
      title: 'Taxation',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.light
      ),
    );
  }


}


/*
  npm install firebase
  npm install -g firebase-tools
  firebase login
  firebase init
  "site": "taxplanning",
  firebase deploy --only hosting:taxplanning
  // Import the functions you need from the SDKs you need
  import { initializeApp } from "firebase/app";
import { getAnalytics } from "firebase/analytics";
// https://firebase.google.com/docs/web/setup#available-libraries

// Your web app's Firebase configuration
// For Firebase JS SDK v7.20.0 and later, measurementId is optional
const firebaseConfig = {
  apiKey: "AIzaSyA-ZM43ATaQWPf2H3UCSCRHnfMn8ZA7eMI",
  authDomain: "tax-planning-a0ce7.firebaseapp.com",
  projectId: "tax-planning-a0ce7",
  storageBucket: "tax-planning-a0ce7.appspot.com",
  messagingSenderId: "470562996829",
  appId: "1:470562996829:web:3bae83f0e15948ba96c3b4",
  measurementId: "G-LD0HHMFYHF"
};

// Initialize Firebase
const app = initializeApp(firebaseConfig);
const analytics = getAnalytics(app);*/


