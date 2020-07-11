import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../model/slide.dart';

class SlideItem extends StatelessWidget {
  final int index;
  SlideItem(this.index);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          slideList[index].title,
          style: GoogleFonts.poppins(
            color: Colors.black,
            fontSize: 40.0,
            fontWeight: FontWeight.w400,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 30.0,),
        Text(
          slideList[index].description,
          style: GoogleFonts.poppins(
            color: Colors.black,
            fontSize: 20.0,
            fontWeight: FontWeight.w400,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 40.0,),
        Image.asset(slideList[index].imageUrl),
      ],
    );
  }
}