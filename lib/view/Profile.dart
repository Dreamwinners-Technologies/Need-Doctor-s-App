import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:need_doctors/Animation/FadeAnimation.dart';
import 'package:need_doctors/Colors/Colors.dart';



class EditProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController nameController = TextEditingController();


  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: profileView()// This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget profileView() {
    return Column(
      children: <Widget>[
        Container(
    width: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              colors: [
                Color(0xff008080),
                Color(0xff008080)
              ]
          )),
          child:
          Column(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(1, 30, 10, 30),
                child: Row(
                  children: <Widget>[
                    GestureDetector(child: Container(height: 45, width: 45 ,child: Icon(Icons.arrow_back_ios, size: 24,color: Colors.white), decoration: BoxDecoration(border: Border.all(color: Colors.black26), borderRadius: BorderRadius.all(Radius.circular(50))),),onTap: (){
                      print('back');
                    },),
                    SizedBox(width: 15,),
                    Text('My Profile', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),),
                    SizedBox(width: 200,),
                    GestureDetector(child: Container(height: 50, width: 50 ,child: Icon(Icons.edit_road_outlined , size: 24,color: Colors.white), decoration: BoxDecoration(border: Border.all(color: Colors.black26), borderRadius: BorderRadius.all(Radius.circular(50))),),
                    onTap: (){
                      print('Edit');
                    },
                    ),
                  ],
                ),
              ),
              Row(
                children: <Widget>[
                  Container(
                    height: 59,
                    width: 59,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(image: AssetImage("asset/Avatar1.png")),
                    ),
                  ),
                  Column(
                    children: [
                         FadeAnimation(1, Text('Dr. Name', style: TextStyle(color: Colors.white, fontSize: 20,),
                        ),),
                  FadeAnimation(1, Text('018********', style: TextStyle(color: Colors.white, fontSize: 20,),
                  ),),

                    ],
                  ),
                ],
              ),
              SizedBox(height: 20,),
            ],
          ),
        ),
        SizedBox(height: 30,),

        Expanded(
            child: Container(
          child: Column(
            children: <Widget>[
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 5, 20, 4),
                child:  FadeAnimation(1, _buildText(
                  nameController,  'doctor@gmail.com',),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 5, 20, 4),
                child:  FadeAnimation(1,  _buildText(
                  nameController,  '274****',),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 5, 20, 4),
                child:  FadeAnimation(1,  _buildText(
                  nameController,  'Specalization',),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 5, 20, 4),
                child:  FadeAnimation(1,  _buildText(
                  nameController,  'Organization',),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 5, 20, 4),
                child:  FadeAnimation(1,  _buildText(
                   nameController ,'Address',),
                ),
              ),
            ],
          ),
        ))
      ],
    );
  }
}


_buildText(
    TextEditingController controller, String labelText) {
  return Container(
    margin: EdgeInsets.all(5),
    decoration: BoxDecoration(
      border: Border(
        bottom: BorderSide(
          color: Color(0xff008080),
          width: 1,
        ),
      ),
    ),
    child:
    Row(
      children: <Widget>[
        Text(labelText,
          style: TextStyle(color: Color(0xff008080), fontSize: 18),
        ),
      ],
    ),
  );
}

