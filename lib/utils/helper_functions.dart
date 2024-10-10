import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'colors/color_constants.dart';

class HelperFunctions {
  Color generateRandomColor() {
    Random random = Random();
    return Color.fromARGB(
      255, // Alpha value (opacity)
      random.nextInt(256), // Red value
      random.nextInt(256), // Green value
      random.nextInt(256), // Blue value
    );
  }

  Color generateMaterialColor() {
    // List of some Material colors
    List<Color> materialColors = [
      Colors.red,
      Colors.blue,
      Colors.green,
      Colors.purple,
      Colors.orange,
      Colors.teal,
      Colors.indigo,
      Colors.brown,
      Colors.cyan,
    ];

    Random random = Random();
    return materialColors[random.nextInt(materialColors.length)];
  }

  void showCustomSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: const TextStyle(
              color: ColorConstants
                  .hintColor), // Set text color to white for contrast
        ),
        backgroundColor: Colors.black87, // Set a dark background color
      ),
    );
  }

  Future<bool> showCustomCupertinoDialog(
      BuildContext context, String title, String message) {
    return showCupertinoDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return CupertinoTheme(
          data: CupertinoThemeData(brightness: Theme.of(context).brightness),
          child: CupertinoAlertDialog(
            title: Text(title),
            content: Text(message),
            actions: <Widget>[
              CupertinoDialogAction(
                child: const Text("No"),
                onPressed: () {
                  Navigator.of(context).pop(false); // Return false for "No"
                },
              ),
              CupertinoDialogAction(
                child: const Text("Yes"),
                onPressed: () {
                  Navigator.of(context).pop(true); // Return true for "Yes"
                },
              ),
            ],
          ),
        );
      },
    ).then(
        (value) => value ?? false); // Return false if null (dialog dismissed)
  }

  void showLoadingDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      // Prevent dismissing the dialog by tapping outside
      builder: (context) => Center(
        child: Card(
          elevation: 2,
          child: Container(
            width: 75.0,
            height: 75.0,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(4.0),
            ),
            child: const Padding(
              padding: EdgeInsets.all(12.0),
              child: SizedBox(
                  height: 60,
                  width: 60,
                  child: CircularProgressIndicator.adaptive()),
            ),
          ),
        ),
      ),
    );
  }
}
