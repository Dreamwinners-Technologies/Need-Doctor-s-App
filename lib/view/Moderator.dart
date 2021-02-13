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
    return new Scaffold(
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

      body: ListView.builder(

        padding: const EdgeInsets.all(16),
        itemBuilder: (context, i) {
          return Container(
            height: 130,
            child: Card(
              elevation: 10,
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: GestureDetector(
                      onTap: () {

                      },
                      child: Container(
                        width: 100.0,
                        height: 100.0,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            image: DecorationImage(
                                image: AssetImage(''),
                                fit: BoxFit.cover),
                            borderRadius:
                            BorderRadius.all(Radius.circular(75.0)),
                            boxShadow: [
                              BoxShadow(blurRadius: 7.0, color: Colors.black)
                            ]),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      print('tap');
                    },
                    child: Container(
                        padding: EdgeInsets.all(20.0),
                        child: Container(
                          child: Text('Moderator Name',
                          style: TextStyle(color: Color(0xff008080), fontSize: 20),),
                        ),
                        ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

buildTextField1(
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