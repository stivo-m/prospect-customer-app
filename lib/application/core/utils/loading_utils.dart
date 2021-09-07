import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadingUtils {
  static void showLoadingState({
    required BuildContext context,
    required bool isLoading,
  }) {
    if (isLoading)
      showDialog(
        context: context,
        builder: (context) {
          return Dialog();
        },
      );
  }
}
