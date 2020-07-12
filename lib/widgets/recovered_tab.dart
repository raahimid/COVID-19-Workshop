import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'widgets.dart';
import 'package:flutter_covid_dashboard_ui/data/data.dart';
import 'package:google_fonts/google_fonts.dart';



class RecoveredTab extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 20.0),
            color: Colors.white,
            height: 250.0,
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(10.0),
                  padding: EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: Column(
                    children: <Widget>[
                      StatsBoxes(
                        data: formatter
                            .format(WorldData['recovered'])
                            .toString(),
                        icon: Icons.public,
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      StatsBoxes(
                        data: formatter
                            .format(USData['recovered'])
                            .toString(),
                        icon: Icons.flag,
                      ),
                    ],
                  ),
                ),
                Text(
                  "*These numbers are updated daily.",
                  textAlign: TextAlign.start,
                  style: GoogleFonts.roboto(
                    color: Color(0xFFACABBB),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}