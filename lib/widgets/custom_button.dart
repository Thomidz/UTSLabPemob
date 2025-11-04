import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isSelected;
  final bool isCorrect;
  final bool showResult;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isSelected = false,
    this.isCorrect = false,
    this.showResult = false,
  });

  @override
  Widget build(BuildContext context) {
    Color getButtonColor() {
      if (!showResult) return isSelected ? Theme.of(context).primaryColor : Colors.grey[300]!;
      if (isCorrect) return Colors.green;
      return isSelected ? Colors.red : Colors.grey[300]!;
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: getButtonColor(),
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          child: Text(
            text,
            style: TextStyle(
              color: isSelected || showResult ? Colors.white : Colors.black,
              fontSize: 16.0,
              fontFamily: 'Poppins',
            ),
          ),
        ),
      ),
    );
  }
}