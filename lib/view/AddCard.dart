import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:need_doctors/Animation/FadeAnimation.dart';
import 'package:need_doctors/Colors/Colors.dart';
import 'package:need_doctors/objectdata/objectdata.dart';



class AddCard extends StatelessWidget {
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
}  final TextEditingController nameController = TextEditingController();

class _MyHomePageState extends State<MyHomePage> {

  var selectDis, selectThan;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: profileView(),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Container(
          child:
          Padding(
            padding: EdgeInsets.fromLTRB(5, 35, 30, 30),
            child: Row(
              children: <Widget>[
                GestureDetector(child: Container(height: 50, width: 50 ,child: Icon(Icons.arrow_back_ios, size: 24,color: Color(0xff008080)), decoration: BoxDecoration(border: Border.all(color: Colors.black26), borderRadius: BorderRadius.all(Radius.circular(50))),),
                onTap: (){
                  print('back');
                },
                ),
                SizedBox(width: 15,),
                Text('Add Visiting Card', style: TextStyle(color: Color(0xff008080), fontSize: 18, fontWeight: FontWeight.bold),),
                Container(height: 24,width: 24,
                ),
              ],
            ),
          ),
        ),
      ),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }


  Widget profileView() {
    return Column(
      children: <Widget>[
        SizedBox(height: 10,),
        FadeAnimation(1,
           Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10)),border: Border.all(width: 1.0, color: Color(0xff008080))),
          height: 140,
              width: 370,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                child: Icon(Icons.linked_camera, size: 24,color: Color(0xff008080)),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(24.0))),
                onPressed: (){
                  print('tap');
              },
              color: Colors.white,
                elevation: 0,
              ),
            ],
          )
          ),
        ),
        SizedBox(height: 10,),
        Expanded(
            child: Container(
              child: Column(
                children: <Widget>[
                  FadeAnimation(1, Column(
                      children: <Widget>[
                        Align(
                          alignment: FractionalOffset(0.1, 0.2),
                          child: Text('Check Info', style: TextStyle(color: Color(0xff008080), fontSize: 20,),
                          ),)
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 5, 20, 1),
                    child:  FadeAnimation(1,  _buildTextField1(
                      nameController,  'Dr. Name',),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 5, 20, 1),
                    child:  FadeAnimation(1,  _buildTextField1(
                      nameController,  'BMDC Reg',),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 5, 20, 1),
                    child:  FadeAnimation(1,  _buildTextField1(
                      nameController,  'Specalization',),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 5, 20, 1),
                    child:  FadeAnimation(1,  _buildTextField1(
                      nameController,  'Phone No',),
                    ),
                  ),
                  SizedBox(height: 6,),
                  FadeAnimation(1, Container(
                      width: 370,
                      padding: const EdgeInsets.fromLTRB(20, 1, 20, 1),
                      decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10)),border: Border.all(width: 2.0, color: Color(0xff008080))),
                      child: DropdownButton(
                        hint: Text("District",
                            style: TextStyle(
                                color: Colors.black26,
                                fontSize: 15)),
                        iconSize: 40,
                        dropdownColor: primaryLight,
                        isExpanded: true,
                        onChanged: (val) {
                          setState(() {
                            this.selectDis = val;
                          });
                        },
                        value: this.selectDis,
                        items: districtlist.map((val) {
                          return DropdownMenuItem(
                            value: val,
                            child: Text(
                              val,
                              style: TextStyle(
                                  color: Colors.black26,
                                  fontSize: 20),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  SizedBox(height: 6,),
                  FadeAnimation(1, Container(
                      width: 370,
                      padding: const EdgeInsets.fromLTRB(20, 1, 20, 1),
                      decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10)),border: Border.all(width: 2.0, color: Color(0xff008080))),
                      child: DropdownButton(
                        hint: Text("Thana",
                            style: TextStyle(
                                color: Colors.black26,
                                fontSize: 15)),
                        iconSize: 40,
                        dropdownColor: primaryLight,
                        isExpanded: true,
                        onChanged: (val) {
                          setState(() {
                            this.selectThan = val;
                          });
                        },
                        value: this.selectThan,
                        items: thanatlist.map((val) {
                          return DropdownMenuItem(
                            value: val,
                            child: Text(
                              val,
                              style: TextStyle(
                                  color: Colors.black26,
                                  fontSize: 20),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  FadeAnimation(1,
                    MaterialButton(
                      minWidth: 100,
                      height: 35,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(24.0))),
                      onPressed: () {
                        Navigator.pop(context);
                        print("tap");
                      },
                      color: Color(0xff008080),
                      child: Text('Save',
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
      style: TextStyle(color:  Color(0xff008080)),
      decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 8,vertical: 0),
         hintText: labelText,
          hintStyle: TextStyle(color: Colors.black26, fontSize: 15),
          border: InputBorder.none),
    ),
  );
}