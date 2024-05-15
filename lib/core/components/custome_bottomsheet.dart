import 'package:flutter/material.dart';


Future<void> BaseBottomSheet({
  required BuildContext context,
  required Widget child,
}) async {
  showModalBottomSheet(
    context: context,
    isDismissible: true,
    isScrollControlled: true,
    useSafeArea: true,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20)
        )
    ),
    builder: (context) {
      return child;
    },
  );
}