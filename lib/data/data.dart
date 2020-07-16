import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'dart:convert' show json;

final prevention = [
  {'assets/images/Social Distancing.png': 'Avoid close\ncontact'},
  {'assets/images/HandWash.png': 'Clean your\nhands often'},
  {'assets/images/MaskGirl.png': 'Wear a\nfacemask'},
];

Map WorldData;
Map USData;

final String Global = 'https://corona.lmao.ninja/v3/covid-19/all';
final String USA = 'https://corona.lmao.ninja/v3/covid-19/countries/US';


fetchUSData() async {
    final response = await http.get(USA);


    if (response.statusCode == 200) {
      USData = json.decode(response.body);
    } else {

      throw Exception('Failed to load data');
    }
  }

  fetchWorldWideData() async {
    http.Response response = await http.get(Global);
    
    WorldData = json.decode(response.body);
    
  }

Future fetchData() async{
    fetchWorldWideData();
    fetchUSData();
    print('fetchData called');
  }

final formatter = new NumberFormat("#,###");
  






