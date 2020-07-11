import 'package:flutter/material.dart';
import 'package:flutter_covid_dashboard_ui/model/slide.dart';
import '../widgets/slide_item.dart';
import '../model/slide.dart';

class InfoScreen extends StatefulWidget {
  @override
  _InfoScreenState createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  final PageController _pageController = PageController(
      initialPage: 0
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          color: Colors.white,
          child: Expanded(
            child: PageView.builder(
              scrollDirection: Axis.horizontal,
              controller: _pageController,
              itemCount: slideList.length,
              itemBuilder: (ctx, i) => SlideItem(i),
            ),
          ),
        )

    );
  }
}