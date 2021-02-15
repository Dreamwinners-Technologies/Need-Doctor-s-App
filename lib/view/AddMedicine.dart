import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:need_doctors/Animation/FadeAnimation.dart';
import 'package:need_doctors/Colors/Colors.dart';

class AddMedicine extends StatelessWidget {
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
      body: profileView(),
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text("Add Visiting Card"),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget profileView() {
    return ListView(
      children: <Widget>[
        SizedBox(
          height: 10,
        ),
        Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 5, 20, 1),
                child: FadeAnimation(
                  1,
                  _buildTextField1(
                    nameController,
                    'Medicine Name',
                  ),
                ),
              ),
              SizedBox(height: 6.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  FadeAnimation(1, Type()),
                  FadeAnimation(1, Category()),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 5, 20, 1),
                child: FadeAnimation(
                  1,
                  _buildTextField1(
                    nameController,
                    'Company Name',
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Expanded(
            child: Container(
              child: Column(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Align(
                        alignment: FractionalOffset(0.1, 0.2),
                        child: Text(
                          'Details:',
                          style: TextStyle(
                            color: Color(0xff008080),
                            fontSize: 20,
                          ),
                        ),
                      )
                    ],
                  ),
                  padding11(nameController, 'Indication'),
                  padding11(nameController, 'Adult Dose'),
                  padding11(nameController, 'Child dose'),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 5, 20, 1),
                    child: FadeAnimation(
                      1,
                      _buildTextField1(
                        nameController,
                        'Renal dose',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 5, 20, 1),
                    child: FadeAnimation(
                      1,
                      _buildTextField1(
                        nameController,
                        'Administration',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 5, 20, 1),
                    child: FadeAnimation(
                      1,
                      _buildTextField1(
                        nameController,
                        'Side effect',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 5, 20, 1),
                    child: FadeAnimation(
                      1,
                      _buildTextField1(
                        nameController,
                        'Chield dose',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 5, 20, 1),
                    child: FadeAnimation(
                      1,
                      _buildTextField1(
                        nameController,
                        'Renal dose',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 5, 20, 1),
                    child: FadeAnimation(
                      1,
                      _buildTextField1(
                        nameController,
                        'Side effect',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 5, 20, 1),
                    child: FadeAnimation(
                      1,
                      _buildTextField1(
                        nameController,
                        'Side effect',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  FadeAnimation(
                    1,
                    MaterialButton(
                      minWidth: 100,
                      height: 35,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                              Radius.circular(24.0))),
                      onPressed: () {
                        print("tap");
                      },
                      color: Color(0xff008080),
                      child: Text('Save',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                ],
              ),
            ))
      ],
      addAutomaticKeepAlives: false,
    );
  }

  Padding padding11(TextEditingController controller, String text) {
    return Padding(
                  padding: const EdgeInsets.fromLTRB(20, 5, 20, 1),
                  child: FadeAnimation(
                    1,
                    _buildTextField1(
                      controller,
                      text,
                    ),
                  ),
                );
  }
}

// ignore: must_be_immutable


_buildTextField1(TextEditingController controller, String labelText) {
  return Container(
    decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        border: Border.all(width: 1.0, color: Color(0xff008080))),
    child: TextField(
      style: TextStyle(color: Color(0xff008080)),
      decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
          hintText: labelText,
          hintStyle: TextStyle(color: Colors.black26, fontSize: 15),
          border: InputBorder.none),
    ),
  );
}

class Type extends StatelessWidget {
  String valueChoose;
  String selectText;
  List ListItem = ["Item 1", "Item 2", "Item 3", "Item 4"];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(1.0),
        child: Container(
          padding: EdgeInsets.only(left: 3.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              border: Border.all(width: 1.0, color: Color(0xff008080))),
          child: DropdownButton(
            hint: Text(
              'Select Type',
              style: TextStyle(color: Colors.black26, fontSize: 15),
            ),
            icon: Icon(Icons.arrow_drop_down),
            iconSize: 50,
            iconEnabledColor: Color(0xff008080),
            underline: SizedBox(),
            style: TextStyle(
              color: primaryColor,
              fontSize: 22,
            ),
            value: valueChoose,
            onChanged: (newValue) {
              setState(() {
                valueChoose = newValue;
              });
            },
            items: ListItem.map(
                  (valueItem) {
                return DropdownMenuItem(
                    value: valueItem, child: Text(valueItem));
              },
            ).toList(),
          ),
        ),
      ),
    );
  }

  void setState(Null Function() param0) {}
}

class Category extends StatelessWidget {
  String valueChoose;
  String selectText;
  List ListItem = ["Item 1", "Item 2", "Item 3", "Item 4"];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.only(left: 5.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            border: Border.all(width: 1.0, color: Color(0xff008080))),
        child: DropdownButton(
          hint: Text(
            'Select Category',
            style: TextStyle(color: Colors.black26, fontSize: 15),
          ),
          icon: Icon(Icons.arrow_drop_down),
          iconSize: 50,
          iconEnabledColor: Color(0xff008080),
          underline: SizedBox(),
          style: TextStyle(
            color: primaryColor,
            fontSize: 22,
          ),
          value: valueChoose,
          onChanged: (newValue) {
            setState(() {
              valueChoose = newValue;
            });
          },
          items: ListItem.map(
                (valueItem) {
              return DropdownMenuItem(value: valueItem, child: Text(valueItem));
            },
          ).toList(),
        ),
      ),
    );
  }

  void setState(Null Function() param0) {}
}
