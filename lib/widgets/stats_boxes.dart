import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class StatsBoxes extends StatelessWidget {
  final String data;
  final IconData icon;

  const StatsBoxes({
    @required this.data,
    @required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65.0,
      decoration: BoxDecoration(
        color: Color(0xFFEC6969),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(
              icon,
              color: Colors.white,
              size: 36.0,
            ),
            Spacer(),
            Text(
              data,
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 30.0,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(width: 50.0,)
          ],
        ),
      ),
    );
  }
}