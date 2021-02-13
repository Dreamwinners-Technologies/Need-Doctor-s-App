import 'package:flutter/material.dart';
import 'package:need_doctors/Animation/FadeAnimation.dart';
import 'package:need_doctors/Colors/Colors.dart';
import 'package:need_doctors/Widgets/Widgets.dart';
import 'package:need_doctors/objectdata/objectdata.dart';
import 'package:need_doctors/view/Pagesetup.dart';
import 'package:need_doctors/view/SplashScreen.dart';

class RegiPage extends StatefulWidget {
  @override
  _RegiPageState createState() => _RegiPageState();
}

class _RegiPageState extends State<RegiPage> {
  final TextEditingController nameController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController phoneController = TextEditingController();

  final TextEditingController orgController = TextEditingController();

  final TextEditingController bdmcregController = TextEditingController();

  // Select Area
  var selecteditem, selectDis, selectThan, selectSpecality;

  //agree checking:
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomPaint(
          painter: BluePainter(),
          child: SafeArea(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      FadeAnimation(
                        1,
                        Image.asset('asset/logog.png'),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          FadeAnimation(
                            1,
                            Text(
                              'Needs',
                              style: TextStyle(
                                fontSize: 29,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff00BAA0),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          FadeAnimation(
                            1,
                            Text(
                              'Doctor',
                              style: TextStyle(
                                  fontSize: 29,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                      FadeAnimation(
                        1,
                        Text(
                          'Register your won account',
                          style: TextStyle(fontSize: 19, color: Colors.black),
                        ),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      //Textfeild setup:
                      Container(
                        padding: EdgeInsets.only(left: 12.0, right: 12.0),
                        height: MediaQuery.of(context).size.height / 2,
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              FadeAnimation(
                                1,
                                buildTextField(
                                    nameController, 'Name*', 'Enter Your Name'),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              FadeAnimation(
                                1,
                                buildTextField(emailController, 'Email*',
                                    'Enter Your Email'),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              FadeAnimation(
                                1,
                                buildTextField(phoneController, 'Phone*',
                                    'Enter Your Phone'),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              FadeAnimation(
                                  1,
                                  Container(
                                    height: 65.0,
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 15.0, vertical: 5.0),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10.0)),
                                        color: Color(0xff00BAA0),
                                        border: Border.all(
                                            color: Color(0xff00BAA0))),
                                    child: DropdownButton(
                                      hint: Text("Select Your Occuption",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20)),
                                      iconSize: 40,
                                      dropdownColor: primaryLight,
                                      isExpanded: true,
                                      onChanged: (val) {
                                        setState(() {
                                          this.selecteditem = val;
                                        });
                                      },
                                      value: this.selecteditem,
                                      items: occuptoinlist.map((val) {
                                        return DropdownMenuItem(
                                          value: val,
                                          child: Text(
                                            val,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20),
                                          ),
                                        );
                                      }).toList(),
                                    ),
                                  )),
                              SizedBox(
                                height: 10,
                              ),
                              FadeAnimation(
                                1,
                                buildTextField(orgController, 'Organization',
                                    'Enter Your Organization'),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              //Visible/Invisible
                              Visibility(
                                visible: this.selecteditem == 'Doctor'
                                    ? true
                                    : false,
                                child: Container(
                                  child: Column(
                                    children: [
                                      FadeAnimation(
                                        1,
                                        buildTextField(bdmcregController,
                                            'BMDC Reg*', 'Enter Your BMDC Reg'),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      FadeAnimation(
                                          1,
                                          Container(
                                            height: 65.0,
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 15, vertical: 5),
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10.0)),
                                                color: Color(0xff00BAA0),
                                                border: Border.all(
                                                    color: Color(0xff00BAA0))),
                                            child: DropdownButton(
                                              hint: Text(
                                                  "Select Your Specality",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 20)),
                                              iconSize: 40,
                                              dropdownColor: primaryLight,
                                              isExpanded: true,
                                              onChanged: (val) {
                                                setState(() {
                                                  this.selectSpecality = val;
                                                });
                                              },
                                              value: this.selectSpecality,
                                              items:
                                                  specalizationlist.map((val) {
                                                return DropdownMenuItem(
                                                  value: val,
                                                  child: Text(
                                                    val,
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 20),
                                                  ),
                                                );
                                              }).toList(),
                                            ),
                                          )),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      FadeAnimation(
                                          1,
                                          Container(
                                            height: 65.0,
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 15, vertical: 5),
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10.0)),
                                                color: Color(0xff00BAA0),
                                                border: Border.all(
                                                    color: Color(0xff00BAA0))),
                                            child: DropdownButton(
                                              hint: Text("Select Your District",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 20)),
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
                                                        color: Colors.white,
                                                        fontSize: 20),
                                                  ),
                                                );
                                              }).toList(),
                                            ),
                                          )),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      FadeAnimation(
                                          1,
                                          Container(
                                            height: 65.0,
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 15, vertical: 5),
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10.0)),
                                                color: Color(0xff00BAA0),
                                                border: Border.all(
                                                    color: Color(0xff00BAA0))),
                                            child: DropdownButton(
                                              hint: Text("Select Your Thana",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 20)),
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
                                                        color: Colors.white,
                                                        fontSize: 20),
                                                  ),
                                                );
                                              }).toList(),
                                            ),
                                          )),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),

                      //Set Agree
                      FadeAnimation(
                        1,
                        Container(
                          margin: EdgeInsets.only(top: 10.0),
                          height: 57.0,
                          width: MediaQuery.of(context).size.width,
                          child: Stack(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Checkbox(
                                    value: this.isChecked,
                                    onChanged: (value) {
                                      setState(() {
                                        this.isChecked = value;
                                        print(this.isChecked);
                                      });
                                    },
                                  ),
                                  SizedBox(
                                    width: 6.0,
                                  ),
                                  Text(
                                    "Are you agree with Need Doctor’s terms\n and condition?",
                                    style: TextStyle(fontSize: 15.0),
                                  ),
                                ],
                              ),
                              Positioned(
                                bottom: 0,
                                left: 145,
                                child: FlatButton(
                                    onPressed: () {
                                      print("Clicked");
                                    },
                                    child: Text(
                                      'Click here',
                                      style: TextStyle(
                                          color: primaryLight, fontSize: 15),
                                    )),
                              )
                            ],
                          ),
                        ),
                      ),
                      //Set Rigister Button:
                      FadeAnimation(
                        1,
                        MaterialButton(
                          minWidth: 100,
                          height: 35,
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(24.0))),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PageSetup()));
                          },
                          color: white,
                          child: Text('Save',
                              style: TextStyle(
                                  color: Color(0xff008080),
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),
                      SizedBox(
                        height: 12.0,
                      ),

                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            FadeAnimation(
                              1,
                              Padding(
                                padding: EdgeInsets.only(left: 10),
                                child: Text(
                                  'Already Have Account?',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                              ),
                            ),
                            FadeAnimation(
                              1,
                              FlatButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text(
                                    'Login',
                                    style: TextStyle(
                                        color: Color(0xff00BAA0), fontSize: 20),
                                  )),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )),
    );
  }
}
