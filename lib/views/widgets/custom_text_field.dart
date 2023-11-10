import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  
   final int maxLines;

  const CustomTextField({
    super.key,
     this.maxLines=1,
    required this.controller,
    required this.hintText,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: TextField(
        controller: controller,
        cursorColor: kPrimaryColor,
        maxLines: maxLines,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              16,
            ),
            borderSide: const BorderSide(
              color: kPrimaryColor,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              16,
            ),
            borderSide: const BorderSide(
              color: kPrimaryColor,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              16,
            ),
            borderSide: const BorderSide(
              color: Colors.white,
            ),
          ),
          hintText: hintText,
          hintStyle: const TextStyle(color: kPrimaryColor),
        ),
      ),
    );
  }
}
