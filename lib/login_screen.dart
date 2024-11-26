import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:mtgi/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'model.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailText = TextEditingController();
  var passText = TextEditingController();
  bool showSpinner = false;
  Position?position;
  String ?latitude;

  String ?dropdownvalue = 'Agriculture';

  // List of items in our dropdown menu
  var items = [
    'Agriculture',
    'Nursing',
    'Pharmacy',
    'Engineering',
    'Law',
    'Arts & Science',
    'Main Office',
    'Health Inspector',
    'Education',
    'Polytechnic',
    'Naturopathy',
    'Physiotherapy',
    'School'
  ];

  getCurrentLocation(String email,pass)async{

    LocationPermission permission = await Geolocator.checkPermission();

    if(permission == LocationPermission.denied || permission ==LocationPermission.deniedForever){

      LocationPermission ask = await Geolocator.requestPermission();
    }else{

      setState(() {
        showSpinner = true;
      });

      Position currentposition = await Geolocator.getCurrentPosition();

      final SharedPreferences prefs = await SharedPreferences.getInstance();

      await prefs.setString('email', email);
      await prefs.setString('college', dropdownvalue!);

      print(dropdownvalue);

      setState(() {
        position = currentposition;
        latitude = currentposition.latitude.toString();
      });

      if(dropdownvalue == 'Agriculture'){

        Model model = Model(email: email, password: pass,value: dropdownvalue!);
        Response response = await post(
            Uri.parse('https://fusionix.tech/Test/login.php'),
            body: json.encode(model.toJson())
        );

        print(response.statusCode);

        if(response.statusCode == 200){

          setState(() {
            showSpinner = false;
          });

          print(position);

          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("Login Successfull..."),
          ));

          Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()
              ));


        }else {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("Invalid Crendentials"),
          ));

          setState(() {
            showSpinner = false;
          });

        }
      }
      if(dropdownvalue == 'Nursing'){

        Model model = Model(email: email, password: pass,value: dropdownvalue!);
        Response response = await post(
            Uri.parse('https://fusionix.tech/Test/nursing.php'),
            body: json.encode(model.toJson())
        );

        print(response.statusCode);

        if(response.statusCode == 200){

          setState(() {
            showSpinner = false;
          });

          print(position);

          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("Login Successfull..."),
          ));

          Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()
              ));


        }else {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("Invalid Crendentials"),
          ));

          setState(() {
            showSpinner = false;
          });

        }
      }
      if(dropdownvalue == 'Engineering'){

        Model model = Model(email: email, password: pass,value: dropdownvalue!);
        Response response = await post(
            Uri.parse('https://fusionix.tech/Test/eng.php'),
            body: json.encode(model.toJson())
        );

        print(response.statusCode);

        if(response.statusCode == 200){

          setState(() {
            showSpinner = false;
          });

          print(position);

          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("Login Successfull..."),
          ));

          Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()
              ));


        }else {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("Invalid Crendentials"),
          ));

          setState(() {
            showSpinner = false;
          });

        }
      }
      if(dropdownvalue == 'Pharmacy'){

        Model model = Model(email: email, password: pass,value: dropdownvalue!);
        Response response = await post(
            Uri.parse('https://fusionix.tech/Test/pharma.php'),
            body: json.encode(model.toJson())
        );

        print(response.statusCode);

        if(response.statusCode == 200){

          setState(() {
            showSpinner = false;
          });

          print(position);

          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("Login Successfull..."),
          ));

          Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()
              ));


        }else {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("Invalid Crendentials"),
          ));

          setState(() {
            showSpinner = false;
          });

        }
      }
      if(dropdownvalue == 'Law'){

        Model model = Model(email: email, password: pass,value: dropdownvalue!);
        Response response = await post(
            Uri.parse('https://fusionix.tech/Test/law.php'),
            body: json.encode(model.toJson())
        );

        print(response.statusCode);

        if(response.statusCode == 200){

          setState(() {
            showSpinner = false;
          });

          print(position);

          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("Login Successfull..."),
          ));

          Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()
              ));


        }else {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("Invalid Crendentials"),
          ));

          setState(() {
            showSpinner = false;
          });

        }
      }
      if(dropdownvalue == 'Arts & Science'){

        Model model = Model(email: email, password: pass,value: dropdownvalue!);
        Response response = await post(
            Uri.parse('https://fusionix.tech/Test/ars.php'),
            body: json.encode(model.toJson())
        );

        print(response.statusCode);

        if(response.statusCode == 200){

          setState(() {
            showSpinner = false;
          });

          print(position);

          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("Login Successfull..."),
          ));

          Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()
              ));


        }else {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("Invalid Crendentials"),
          ));

          setState(() {
            showSpinner = false;
          });

        }
      }
      if(dropdownvalue == 'Main Office'){

        Model model = Model(email: email, password: pass,value: dropdownvalue!);
        Response response = await post(
            Uri.parse('https://fusionix.tech/Test/main.php'),
            body: json.encode(model.toJson())
        );

        print(response.statusCode);

        if(response.statusCode == 200){

          setState(() {
            showSpinner = false;
          });

          print(position);

          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("Login Successfull..."),
          ));

          Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()
              ));


        }else {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("Invalid Crendentials"),
          ));

          setState(() {
            showSpinner = false;
          });

        }
      }
      if(dropdownvalue == 'Health Inspector'){

        Model model = Model(email: email, password: pass,value: dropdownvalue!);
        Response response = await post(
            Uri.parse('https://fusionix.tech/Test/health.php'),
            body: json.encode(model.toJson())
        );

        print(response.statusCode);

        if(response.statusCode == 200){

          setState(() {
            showSpinner = false;
          });

          print(position);

          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("Login Successfull..."),
          ));

          Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()
              ));


        }else {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("Invalid Crendentials"),
          ));

          setState(() {
            showSpinner = false;
          });

        }
      }
      if(dropdownvalue == 'Education'){

        Model model = Model(email: email, password: pass,value: dropdownvalue!);
        Response response = await post(
            Uri.parse('https://fusionix.tech/Test/edu.php'),
            body: json.encode(model.toJson())
        );

        print(response.statusCode);

        if(response.statusCode == 200){

          setState(() {
            showSpinner = false;
          });

          print(position);

          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("Login Successfull..."),
          ));

          Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()
              ));


        }else {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("Invalid Crendentials"),
          ));

          setState(() {
            showSpinner = false;
          });

        }
      }
      if(dropdownvalue == 'Polytechnic'){

        Model model = Model(email: email, password: pass,value: dropdownvalue!);
        Response response = await post(
            Uri.parse('https://fusionix.tech/Test/poly.php'),
            body: json.encode(model.toJson())
        );

        print(response.statusCode);

        if(response.statusCode == 200){

          setState(() {
            showSpinner = false;
          });

          print(position);

          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("Login Successfull..."),
          ));

          Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()
              ));


        }else {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("Invalid Crendentials"),
          ));

          setState(() {
            showSpinner = false;
          });

        }
      }
      if(dropdownvalue == 'Naturopathy'){

        Model model = Model(email: email, password: pass,value: dropdownvalue!);
        Response response = await post(
            Uri.parse('https://fusionix.tech/Test/nature.php'),
            body: json.encode(model.toJson())
        );

        print(response.statusCode);

        if(response.statusCode == 200){

          setState(() {
            showSpinner = false;
          });

          print(position);

          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("Login Successfull..."),
          ));

          Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()
              ));


        }else {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("Invalid Crendentials"),
          ));

          setState(() {
            showSpinner = false;
          });

        }
      }
      if(dropdownvalue == 'Physiotherapy'){

        Model model = Model(email: email, password: pass,value: dropdownvalue!);
        Response response = await post(
            Uri.parse('https://fusionix.tech/Test/physio.php'),
            body: json.encode(model.toJson())
        );

        print(response.statusCode);

        if(response.statusCode == 200){

          setState(() {
            showSpinner = false;
          });

          print(position);

          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("Login Successfull..."),
          ));

          Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()
              ));


        }else {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("Invalid Crendentials"),
          ));

          setState(() {
            showSpinner = false;
          });

        }
      }
      if(dropdownvalue == 'School'){

        Model model = Model(email: email, password: pass,value: dropdownvalue!);
        Response response = await post(
            Uri.parse('https://fusionix.tech/Test/school.php'),
            body: json.encode(model.toJson())
        );

        print(response.statusCode);

        if(response.statusCode == 200){

          setState(() {
            showSpinner = false;
          });

          print(position);

          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("Login Successfull..."),
          ));

          Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()
              ));


        }else {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("Invalid Crendentials"),
          ));

          setState(() {
            showSpinner = false;
          });

        }
      }
      }

  }
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: showSpinner,
      child: Scaffold(
        body:  Center(
          child: SizedBox(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                    width: 120,
                    height: 120,
                    child: Image.asset('assets/images/teresa.jpg')),
                const Text('Welcome !!',style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.w500
                ),),
                const Center(
                  child: Text('Please Enter Your Credentials',style: TextStyle(
                    fontSize: 15,
                  ),),
                ),
                const SizedBox(height: 20,),
                TextField(
                  controller: emailText,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11)
                      ),
                      suffixText: "Username..",
                      prefixIcon: const Icon(Icons.keyboard)
                  ),
                ),
                const SizedBox(height: 11,),
                TextField(
                  controller: passText,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11)
                      ),
                      suffixText: "Password",
                      prefixIcon: const Icon(Icons.keyboard)
                  ),
                ),
                const SizedBox(height: 20,),
                DropdownButton(

                  // Initial Value
                  value: dropdownvalue,

                  // Down Arrow Icon
                  icon: const Icon(Icons.keyboard_arrow_down),

                  // Array list of items
                  items: items.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),
                  // After selecting the desired option,it will
                  // change button value to selected value
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownvalue = newValue!;
                    });
                  },
                ),
                const SizedBox(height: 7),
                ElevatedButton(onPressed: (){

                  String email = emailText.text.toString();
                  String pass = passText.text.toString();

                  getCurrentLocation(email,pass);


                },
                  child: const Text('Procceed',style: TextStyle(
                      color: Colors.black
                  ),),
                ),
                const SizedBox(height: 15,),
                const Text('www.mtgi.in')
              ],
            ),
          ),
        ),
      ),
    );
  }
}
