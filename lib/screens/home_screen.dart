import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_covid_dashboard_ui/config/palette.dart';
import 'package:flutter_covid_dashboard_ui/config/styles.dart';
import 'package:flutter_covid_dashboard_ui/data/data.dart';
import 'package:flutter_covid_dashboard_ui/widgets/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' show json;

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {

  Map worldData;
  fetchWorldWideData() async {
    http.Response response = await http.get('https://corona.lmao.ninja/v3/covid-19/all');
    setState(() {
      worldData = json.decode(response.body);
    });
  }
  Future fetchData() async{
    fetchWorldWideData();
    print('fetchData called');
  }
  @override

  void initState() {
    fetchData();
    super.initState();
  }

  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Palette.primaryColor,
      appBar: CustomAppBar(),
      body: CustomScrollView(
        physics: ClampingScrollPhysics(),
        slivers: <Widget>[
          _buildHeader(screenHeight),
          _buildStatistics(screenHeight),
        ],
      ),
    );
  }

  SliverToBoxAdapter _buildHeader(double screenHeight) {
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 20.0),
        decoration: BoxDecoration(
          color: Palette.primaryColor,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(0.0),
            bottomRight: Radius.circular(0.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
              ],
            ),
            SizedBox(height: screenHeight * 0.02),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Feeling Sick?',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                Text(
                  'If someone is showing any symptoms, seek emergency medical care immediately.',
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 17.0,
                  ),
                ),
                SizedBox(height: screenHeight * 0.03),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    FlatButton.icon(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10.0,
                        horizontal: 20.0,
                      ),
                      onPressed: () {},
                      color: Colors.red[900],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      icon: const Icon(
                        Icons.phone,
                        color: Colors.white,
                      ),
                      label: Text(
                        'Call Now',
                        style: Styles.buttonTextStyle,
                      ),
                      textColor: Colors.white,
                    ),
                    FlatButton.icon(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10.0,
                        horizontal: 20.0,
                      ),
                      onPressed: () {},
                      color: Color(0xFF14B5D0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      icon: const Icon(
                        Icons.chat_bubble,
                        color: Colors.white,
                      ),
                      label: Text(
                        'Send SMS',
                        style: Styles.buttonTextStyle,
                      ),
                      textColor: Colors.white,
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  SliverToBoxAdapter _buildStatistics(double screenHeight) {
    return SliverToBoxAdapter(
      child: Container(
        height: 400.0,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            DefaultTabController(
              length: 3,
              child: TabBar(
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Color(0xFFEC6969)
                ),
                indicatorColor: Colors.transparent,
                labelStyle: Styles.tabTextStyle,
                labelPadding: EdgeInsets.all(10.0),
                labelColor: Colors.white,
                unselectedLabelColor: Color(0xFFACABBB),
                tabs: <Widget>[
                  Text('Confirmed'),
                  Text('Deaths'),
                  Text('Fatality %'),
                ],
                onTap: (index) {},
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(top: 20.0),
                color: Colors.white,
                height: 0.0,

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
                          StatsBoxes(data: worldData['cases'].toString(),icon: Icons.public,),
                          SizedBox(height: 20.0,),
                          StatsBoxes(data: worldData['deaths'].toString(), icon: Icons.flag,),
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
            ),
          ],
        ),
      ),
    );


  }
}
