import 'package:flutter/material.dart';

class LoadingDialogWidget {
  static showDialogLoading(BuildContext context, String message) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: SizedBox(
            height: 100,
            width: 30,
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  const CircularProgressIndicator(),
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0),
                    child: Text(message),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

}