import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:need_doctors/Animation/FadeAnimation.dart';
import 'package:need_doctors/Colors/Colors.dart';
import 'package:need_doctors/view/Profile.dart';

class  ProfileEdit extends StatelessWidget {
  // This widget is the root of your application.
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
       appBar: AppBar(title: Text("Edit Profile")),
        body: profileView()// This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget profileView() {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.fromLTRB(30, 50, 30, 30),
          child: Row(
            children: <Widget>[
              GestureDetector(child: Container(height: 50, width: 50 ,child: Icon(Icons.arrow_back_ios, size: 24,color: Color(0xff008080)), decoration: BoxDecoration(border: Border.all(color: Colors.black26), borderRadius: BorderRadius.all(Radius.circular(50))),),
              onTap: (){
                Navigator.pop(context);
                print('back');
              },
              ),
              SizedBox(width: 15,),
              Text('Edit Profile', style: TextStyle(color: Color(0xff008080), fontSize: 18, fontWeight: FontWeight.bold),),
              Container(height: 24,width: 24)
            ],
          ),
        ),
        Expanded(
            child: Container(
              child: Column(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Align(
                        alignment: FractionalOffset(0.1, 0.2),
                        child: Text('Personal Info', style: TextStyle(color: Color(0xff008080), fontSize: 20,),
                        ),)
                    ],
                  ),
                  SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 5, 20, 4),
                    child:  FadeAnimation(1,  _buildTextField1(
                      nameController,  'Dr. Name',),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 5, 20, 4),
                    child:  FadeAnimation(1,  _buildTextField1(
                      nameController,  'BMDC Reg',),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 5, 20, 4),
                    child:  FadeAnimation(1,  _buildTextField1(
                      nameController,  'Specalization',),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 5, 20, 4),
                    child:  FadeAnimation(1,  _buildTextField1(
                      nameController,  'Phone No',),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 5, 20, 4),
                    child:  FadeAnimation(1,  District(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 5, 20, 4),
                    child:  FadeAnimation(1,  Thana()
                    ),
                  ),
                  SizedBox(height: 40,),
                  FadeAnimation(1,
                    MaterialButton(
                      minWidth: 100,
                      height: 35,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(24.0))),
                      onPressed: () {
                        print("tap");
                      },
                      color: Color(0xff008080),
                      child: Text('Update',
                          style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold)),
                    ),),
                ],
              ),
            ))
      ],
    );
  }
}


_buildTextField1(
    TextEditingController controller, String labelText) {
  return Container(
    decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10)),border: Border.all(width: 2.0, color: Color(0xff008080))),
    child: TextField(
      controller: controller,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 8,vertical: 0),
          labelText: labelText,
          labelStyle: TextStyle(color: Color(0xff008080), fontSize: 20),
          border: InputBorder.none),
    ),
  );
}


class Thana extends StatelessWidget {

  String valueChoose;
  String selectText;
  List ListItem = [
    "Item 1", "Item 2", "Item 3", "Item 4"
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(1.0),
        child: Container(
          padding: EdgeInsets.only(left: 10, right: 16),
          decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10)),border: Border.all(width: 2.0, color: Color(0xff008080))),
          child: DropdownButton(
            hint: Text('Thana',
            style: TextStyle(color: Color(0xff008080), fontSize: 20),
            ),
            icon: Icon(Icons.arrow_drop_down),
            iconSize: 50,
            iconEnabledColor: Color(0xff008080),
            isExpanded: true,
            underline: SizedBox(),
            style: TextStyle(color: primaryColor,
            fontSize: 22,
            ),
            value: valueChoose,
            onChanged: (newValue) {
              setState(() {
                valueChoose = newValue;
              });
            },
            items: ListItem.map((valueItem) {
              return DropdownMenuItem(
                  value: valueItem,
                  child: Text(valueItem));
            },
            ).toList(),
          ),
        ),
      ),
    );
  }

  void setState(Null Function() param0) {}
}

class District extends StatelessWidget {

  String valueChoose;
  String selectText;
  List ListItem = [
    "Item 1", "Item 2", "Item 3", "Item 4"
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(1.0),
        child: Container(
          padding: EdgeInsets.only(left: 10, right: 16),
          decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10)),border: Border.all(width: 2.0, color: Color(0xff008080))),
          child: DropdownButton(
            hint: Text('District',
              style: TextStyle(color: Color(0xff008080), fontSize: 20),
            ),
            icon: Icon(Icons.arrow_drop_down),
            iconSize: 50,
            iconEnabledColor: Color(0xff008080),
            isExpanded: true,
            underline: SizedBox(),
            style: TextStyle(color: primaryColor,
              fontSize: 22,
            ),
            value: valueChoose,
            onChanged: (newValue) {
              setState(() {
                valueChoose = newValue;
              });
            },
            items: ListItem.map((valueItem) {
              return DropdownMenuItem(
                  value: valueItem,
                  child: Text(valueItem));
            },
            ).toList(),
          ),
        ),
      ),
    );
  }

  void setState(Null Function() param0) {}
}
