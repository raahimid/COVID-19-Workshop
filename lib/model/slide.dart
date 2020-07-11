import 'package:flutter/material.dart';

class Slide{
  final String imageUrl;
  final String title;
  final String description;

  Slide({
    @required this.imageUrl,
    @required this.title,
    @required this.description,
  });
}

final slideList = [
  Slide(
      imageUrl: 'assets/images/MaskGirl.png',
      title: 'Wear A Mask!',
      description: 'Cover your mouth and nose when around others'
  ),
  Slide(
      imageUrl: 'assets/images/HandWash.png',
      title: 'Wash your damn hands!',
      description: 'Wash your fucking hands, fool'
  ),
  Slide(
      imageUrl: 'assets/images/Social Distancing.png',
      title: 'Keep your distance!',
      description: 'Keep your fucking distance, fool'
  ),
];