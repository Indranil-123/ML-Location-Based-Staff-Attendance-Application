import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mtgi/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';


class SuccessPage extends StatefulWidget {
  const SuccessPage({super.key});

  @override
  State<SuccessPage> createState() => _SuccessPageState();
}

class _SuccessPageState extends State<SuccessPage> {
  String?finaltime;
  String?finaldate;
  String?status;
  void initState() {
    super.initState();
    dataPrint();
    Timer(const Duration(seconds: 20),(){

      Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) =>const HomeScreen()
          ));

    });
  }

  dataPrint()async{

    var prefs = await SharedPreferences.getInstance();
    final String? time= prefs.getString('time');
    final String? date= prefs.getString('date');
    var times = time.toString();
    var dates = date.toString();

    if(times == "8:00"||times == "8:01"||times == "8:02"||times == "8:03"||times == "8:04"||times == "8:05"||times == "8:06"||times == "8:07"||
        times == "8:08"||times == "8:09"||times == "8:10"||times == "8:11"||times == "8:12"||times == "8:13"||times == "8:14"||times == "8:15"||
        times == "8:16"||times == "8:17"||times == "8:18"||times =="8:19"||times == "8:20"||times =="8:21"||times == "8:22"||times == "8:23"||
        times =="8:24"||times == "8:25"||times == "8:26"||times == "8:27"||times == "8:28"||times == "8:29"||times == "8:30"||times == "8:31"||
        times == "8:32"||times == "8.33"||times == "8:34"||times == "8:35"||times == "8:36"||times =="8:37"||times == "8:38"||times == "8:39"||
        times == "8:40"||times == "8.41"||times == "8:42"||times == "8:44"||times =="8:45"||times =="8:47"||times == "8:48"||times == "8:50"
        ||times == "8:49"||times == "9:00"||times == "9:01"||times == "9:02"||times == "9:03"||times == "9:04"||times == "9:05"||times == "9:06"
        ||times == "9:07"|| times == "9:08"||times == "9:09"||times == "9:10"||times == "9:11"||times == "9:12"||times == "9:13"||times == "9:14"||times == "9:15"||
        times == "9:16"||times == "9:17"||times == "9:18"||times == "9:19"||times == "9:20"||times == "9:21"||times == "9:22"||times == "9:23"||
        times == "9:24"||times == "9:25"||times == "9:26"||times == "9:27"||times == "9:28"||times == "9:29"||times == "9:30"||times == "4:00"
        ||times == "4:12"||times == "4:14"||times == "4.30"||times == "4.20"||times == "4:40"||times == "4:25"||times == "4:01"||times == "4:02"
        ||times == "4:03"||times == "4:04"||times == "4:05"||times == "4:06"||times == "4:07"||times == "4:08"||times == "4:09"||times == "4:10"
        ||times == "4:11"||times == "4:12"||times == "4:13"||times == "4:14"||times == "4:15"||times == "4:16"||times == "4:17"||times == "4:18"
        ||times == "4:19"||times == "4:20"||times == "4:21"||times == "4:22"||times == "4:23"||times == "4:24"||times == "4:25"||times == "4:26"
        ||times == "4:27"||times == "4:28"||times == "4:29"||times == "4:30"||times == "4:31"||times == "4:32"||times == "4:33"||times == "4:34"
        ||times == "4:35"||times == "4:36"||times == "4:37"||times == "4:38"||times == "4:39"||times == "4:40"){
    setState(() {
      finaltime=times;
      finaldate=dates;
      status="You Are Present";
    });
    }else{
      setState(() {
        finaltime=times;
        finaldate=dates;
        status="You Are Present";
      });


    }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 200,
              child: Lottie.network(
                  'https://lottie.host/4f4921ed-62f5-49e1-892a-1541f9f374b7/rRnajeieQw.json'),
            ),
            SizedBox(height: 20),
            Text("Your Attendance Time:$finaltime"),
            SizedBox(height: 10),
            Text("Your Attendance Date:$finaldate"),
            SizedBox(height: 10),
            Text("Status:$status"),

          ],
        ),
      ),

    );
  }
}
