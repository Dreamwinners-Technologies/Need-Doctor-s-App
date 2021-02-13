import 'package:flutter/material.dart';

class DropDown extends StatefulWidget {

  DropDown({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _DropDownState createState() => _DropDownState();
} String valueChoose;
String selectText;
List ListItem = [
  "Item 1","Item 2","Item 3","Item 4"
];

class _DropDownState extends State<DropDown> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: DropdownButton(
          hint: Text('Thana'),
          icon: Icon(Icons.arrow_drop_down),
          value: valueChoose,
          onChanged: (newValue){
            setState(() {
              valueChoose = newValue;
            });
          },
          items: ListItem.map((valueItem){
            return DropdownMenuItem(
            value: valueItem,
            child: Text(valueItem));
    },
        ).toList(),
      ),
    )
    );
  }
}
