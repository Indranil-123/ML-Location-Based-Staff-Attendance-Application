import 'package:flutter/material.dart';
import 'package:mtgi/login_screen.dart';
import 'package:mtgi/prediction.dart';
import 'package:mtgi/profile_screen.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int myIndex = 0;
  var email;
  getValue(){
    setState(() {
      email = this.email;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title:Text("M T G I - Home Page"),
          actions: <Widget>[
            IconButton(onPressed: (){
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()
                  ));
            },
                icon: Icon(Icons.logout))
          ],
        ),

        bottomNavigationBar: BottomNavigationBar(
          onTap: (index){
            setState(() {
              myIndex = index;
            });
          },
          currentIndex: myIndex,
          items: const[
            BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.notification_add_rounded),label: 'Notification'),
            BottomNavigationBarItem(icon: Icon(Icons.supervised_user_circle_outlined),label: 'Profile'),
          ],
        ),
        body: Center(
          child:  Row(

            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              const SizedBox(height: 30),
              Center(
                child: Card(
                    elevation: 15,

                    child: SizedBox(
                      width: 120,
                      height: 120,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Profile"),
                          const SizedBox(height: 10,),
                          ElevatedButton(onPressed: (){
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (context) =>ProfileScreen()
                                ));
                          }, child: const Text("Proceed"))
                        ],
                      ),

                    )

                ),
              ),
              Center(
                child: Card(
                    elevation: 15,

                    child: SizedBox(
                      width: 120,
                      height: 120,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Record"),
                          const SizedBox(height: 10,),
                          ElevatedButton(onPressed: (){

                            getValue();

                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (context) =>TfliteModel(email)
                                ));

                            print("thisssssssssssssss $email");

                          }, child: const Text("Proceed"))
                        ],
                      ),
                    )
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
