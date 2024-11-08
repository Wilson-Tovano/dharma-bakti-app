import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PrimaryButton extends StatelessWidget {
  PrimaryButton({super.key, required this.color, required this.text, required this.nextPage});
  
  Color color;
  String text;
  Widget nextPage;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: SizedBox(
        height: 50,
        width: 1000,
        child: ElevatedButton(
          onPressed: (){
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => nextPage)
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
            foregroundColor: Colors.white,
            elevation: 0,
            shadowColor: Colors.transparent
          ), 
          child: Text(text, style: GoogleFonts.poppins(fontWeight: FontWeight.bold),)
        ),
      ),
    );
  }
}