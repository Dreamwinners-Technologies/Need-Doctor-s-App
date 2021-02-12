import 'package:flutter/material.dart';



class ModeratorPage extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Container(
          child:
          Padding(
            padding: EdgeInsets.fromLTRB(5, 35, 30, 30),
            child: Row(
              children: <Widget>[
                Container(height: 50, width: 50 ,child: Icon(Icons.arrow_back_ios, size: 24,color: Color(0xff008080)), decoration: BoxDecoration(border: Border.all(color: Colors.black26), borderRadius: BorderRadius.all(Radius.circular(50))),),
              ],
            ),
          ),
        ),
      ),

      body: CustomPaint(

    ),);
  }
}

_buildTextField1(
    TextEditingController controller, String labelText) {
  return Container(
    decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10)),border: Border.all(width: 1.5, color: Color(0xff008080))),
    child: TextField(
      style: TextStyle(color:  Color(0xff008080), fontSize: 22, fontWeight: FontWeight.bold),
      decoration: InputDecoration(
          contentPadding: EdgeInsets.only(left: 130),
          hintText: labelText,
          hintStyle: TextStyle(color: Colors.black26, fontSize: 22, fontWeight: FontWeight.normal),
          border: InputBorder.none),
    ),
  );
}

_buildCard(
    TextEditingController controller, String labelText) {
  return Container(
    width: 200,
    child: Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      color: Colors.white,
      elevation: 2.0,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const ListTile(
            leading: Icon(Icons.photo_rounded,size: 70,),
            title: Text('Moderator Name'),
            subtitle: Text('1234567890'),
          ),
          ButtonBar(
            children: <Widget>[
              Text('Ocupation'),
            ],
          )
        ],
      ),
    ),
  );
}
