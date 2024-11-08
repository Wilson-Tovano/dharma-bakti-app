import 'package:dharma_bakti_app/constants/global_constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextFieldCustom extends StatefulWidget {
  TextFieldCustom({super.key, required this.text, required this.controller, required this.isPassword});
  
  String text;
  bool isPassword;
  TextEditingController controller;
  

  @override
  State<TextFieldCustom> createState() => _TextFieldCustomState();
}

class _TextFieldCustomState extends State<TextFieldCustom> {
  bool _obscureText = true;

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    if(widget.isPassword){
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          controller: widget.controller,
          obscureText: _obscureText,
          decoration: InputDecoration(
            hintText: widget.text,
            hintStyle: GoogleFonts.poppins(
              color: Colors.grey,
              fontSize: 14
            ),
            filled: true,
            fillColor: Colors.grey[200],
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(
                  color: AppColors.primaryColor,
                )
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(
                color: Colors.transparent
              )
            ),
            suffixIcon: IconButton(
              icon: Icon(
                (_obscureText ? Icons.visibility : Icons.visibility_off), color: Colors.grey,
              ),
              onPressed: (){
                _togglePasswordVisibility();
              },
            )
          )
        ),
      );
    }else{
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          controller: widget.controller,
          decoration: InputDecoration(
            hintText: widget.text,
            hintStyle: GoogleFonts.poppins(
              color: Colors.grey,
              fontSize: 14
            ),
            filled: true,
            fillColor: Colors.grey[200],
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(
                  color: AppColors.primaryColor,
                )
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(
                color: Colors.transparent
              )
            ),
          )
        ),
      );
    } 
  }
}