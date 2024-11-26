import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:mtgi/success.dart';
import 'home_screen.dart';
import 'models.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:shared_preferences/shared_preferences.dart';



class RecordPage extends StatefulWidget {
  const RecordPage({super.key});

  @override
  State<RecordPage> createState() => _RecordPageState();
}

class _RecordPageState extends State<RecordPage> {
  var emailText = TextEditingController();
  bool showSpinner = false;
  Position?position;
  double ?latitude;
  double ?longitude;
  double crlat2=10.5;
  double crlong2=78.65;
  double crlong3=78.64;
  double shanlat = 11.44;
  double shanlong= 77.88;

  void initState() {
    super.initState();

    RecordAttendence();
  }


  RecordAttendence()async{
    setState(() {
      showSpinner = true;
    });

    Position currentposition = await Geolocator.getCurrentPosition();
    var prefs = await SharedPreferences.getInstance();
    final String? emails= prefs.getString('email');
    var email = emails.toString();
    final String? values= prefs.getString('college');
    var college = values.toString();

    setState(() {
      latitude = currentposition.latitude;
      longitude = currentposition.longitude;
    });

    var finalLat= double.parse(latitude!.toStringAsFixed(2));
    var finalLong = double.parse(longitude!.toStringAsFixed(2));

    // 11.45
    // 77.87

    // 10.5
    // 78.65
    // finalLat==crlat2 && finalLong==crlong2||finalLat==crlat2&&finalLong==crlong3

    if(finalLat==11.44 && finalLong == 77.88){



      var now = DateTime.now();
      var formatterDate = DateFormat('dd-MM-yyyy');
      var formatterTime = DateFormat('kk:mm');
      String actualDate = formatterDate.format(now);
      String actualTime = formatterTime.format(now);

      print(actualDate);
      print(actualTime);

      await prefs.setString('time', actualTime);
      await prefs.setString('date', actualDate);


      Model model = Model(email:email, date: actualDate,time: actualTime,value: college);
      Response response = await post(
          Uri.parse('https://fusionix.tech/Test/record.php'),
          body: json.encode(model.toJson())
        );
      if(response.statusCode == 200){

        print(email);
        print(college);

        setState(() {
            showSpinner = false;
          });

          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("Recorded Successfully"),
          ));

          Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => SuccessPage()
              ));

        }else {
          setState(() {
            showSpinner = false;
          });

          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("Network Busy..try again"),
          ));

      }



    }else{
      setState(() {
        showSpinner = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("You are not in Exact Location"),
      ));

      Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()
          ));
    }

  }
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: showSpinner,
      child: Scaffold(
        body: Center(
          child: Container(),
        )
      ),
    );
  }
}



