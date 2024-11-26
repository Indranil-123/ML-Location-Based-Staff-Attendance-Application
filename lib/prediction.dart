import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mtgi/home_screen.dart';
import 'package:mtgi/record.dart';
import 'package:tflite_v2/tflite_v2.dart';


class TfliteModel extends StatefulWidget {
  TfliteModel(this.email);

  final email;

  @override
  _TfliteModelState createState() => _TfliteModelState();
}

class _TfliteModelState extends State<TfliteModel> {


  late File _image;
  late List _results;
  bool imageSelect=false;


  var email;
  @override
  void initState()
  {
    super.initState();
    loadModel();
  }
  Future loadModel()
  async {
    Tflite.close();
    String res;
    res=(await Tflite.loadModel(model: "assets/model/mlmodel.tflite",labels: "assets/model/labels.txt"))!;
    print("Models loading status: $res");
  }

  Future imageClassification(File image)
  async {
    final List? recognitions = await Tflite.runModelOnImage(
      path: image.path,
      numResults: 6,
      threshold: 0.05,
      imageMean: 127.5,
      imageStd: 127.5,
    );
    setState(() {
      _results=recognitions!;
      _image=image;
      imageSelect=true;

      Timer(const Duration(seconds: 2),(){
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => RecordPage()
            ));
      });
    });

    print(_results[0]['label']);

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Motion Recognition"),
        actions: <Widget>[
          IconButton(onPressed: (){
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()
                ));
          },
              icon: Icon(Icons.arrow_back))
        ],
      ),
      body: ListView(
        children: [
          (imageSelect)?Container(
            margin: const EdgeInsets.all(10),
            child: Image.file(_image),
          ):Container(
            margin: const EdgeInsets.all(10),
            child: const Opacity(
              opacity: 0.8,
              child: Center(
                child: Text("Please Smile and Take a Pic",style: TextStyle(
                  fontSize: 20
                ),),
              ),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: (imageSelect)?_results.map((result) {
                return Card(
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.all(10),
                        child: Text(
                          "Your ${result['label']} is recorded",
                          style: const TextStyle(color: Colors.red,
                              fontSize: 20),
                        ),
                      ),

                    ],
                  ),
                );
              }).toList():[],
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: pickImage,
        tooltip: "Pick Image",
        child: const Icon(Icons.image),
      ),
    );
  }
  Future pickImage()
  async {
    final ImagePicker _picker = ImagePicker();
    final XFile? pickedFile = await _picker.pickImage(
      source: ImageSource.camera,
    );
    File image=File(pickedFile!.path);
    imageClassification(image);
  }
}