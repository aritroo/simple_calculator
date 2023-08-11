import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomButton extends StatelessWidget {
  CustomButton({
    super.key,
    required this.color,
    required this.buttonText,
    required this.textColor,
    required this.onPressed,
  });
  final color;
  final textColor;
  final String buttonText;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            color: color,
            child: Center(
              child: Text(
                buttonText,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: textColor,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
