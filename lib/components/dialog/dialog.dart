import 'package:travel/components/btns/button_primary.dart';
import 'package:travel/resource/constant.dart';
import 'package:flutter/material.dart';

class DialogPrimary extends StatelessWidget {
  DialogPrimary({super.key, required this.title, this.onTap});
  String title;
  void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Center(
        child: Text(
          title,
          textAlign: TextAlign.center,
        ),
      ),
      actions: [
        Padding(
          padding: EdgeInsets.all(smallPadding),
          child: ButtonPrimary(nameButton: 'OK', onTap: onTap),
        )
      ],
    );
  }
}
