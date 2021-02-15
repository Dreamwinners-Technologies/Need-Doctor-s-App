import 'package:flutter/material.dart';
import 'package:need_doctors/Animation/FadeAnimation.dart';
import 'package:need_doctors/Widgets/Widgets.dart';
import 'package:need_doctors/view/AddCard.dart';

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

  final TextEditingController nameController = TextEditingController();

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Container(
            height: 50,
            width: 50,
            child: Icon(Icons.arrow_back_ios,
                size: 24, color: Color(0xff008080)),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black26),
                borderRadius: BorderRadius.all(Radius.circular(50))),
          ),
        ),
       body: Container(
         child: Column(
           children: <Widget>[
             Padding(
               padding: const EdgeInsets.fromLTRB(20, 5, 100, 1),
               child:   _buildTextField1(
                 nameController,  'Add by phone',),
             ),

             CustomPaint(
               child: Expanded(
                 child: Container(
                   height: MediaQuery.of(context).size.height / 1.6,
                   margin: EdgeInsets.only(left: 12, top: 3.0, bottom: 10.0),
                   child: ListView.builder(
                       physics: BouncingScrollPhysics(),
                       itemCount: 10,
                       scrollDirection: Axis.vertical,
                       itemBuilder: (context, int index) {
                         return moderator('asset/logog.png', 'Modaretor Name', '0177777777',
                             'Ocupation', index, context);
                       }),
                 ),
               ),

              ),
           ],
         ),
       ));
  }
}

_buildTextField1(
    TextEditingController controller, String labelText) {
  return Container(

    decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20)),border: Border.all(width: 1.0,)),
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

