import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:need_doctors/Colors/Colors.dart';
import 'package:need_doctors/Widgets/ToastNotification.dart';
import 'package:need_doctors/models/Admin/ModeratorListResponse.dart';
import 'package:need_doctors/models/MessageResponseModel.dart';
import 'package:need_doctors/networking/AdminNetwork.dart';

// class ModeratorPage extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: MyHomePage(),
//     );
//   }
// }

// ignore: must_be_immutable
class ModeratorPage extends StatefulWidget {
  ModeratorPage(List<ModeratorListResponse> moderatorList) {
    this.moderatorList = moderatorList;
  }

  List<ModeratorListResponse> moderatorList;

  @override
  _ModeratorPageState createState() => _ModeratorPageState(moderatorList);
}

class _ModeratorPageState extends State<ModeratorPage> {
  _ModeratorPageState(List<ModeratorListResponse> moderatorList) {
    this.moderatorList = moderatorList;
  }

  final TextEditingController searchController = TextEditingController();
  final List<String> entries = <String>['A', 'B', 'C'];
  final List<int> colorCodes = <int>[600, 500, 100];

  List<ModeratorListResponse> moderatorList;

  void searchOption() async {
    print("search");
    String phone = searchController.text;
    print(phone);
    if (phone.isEmpty) {
      sendToast("Phone No can't be empty");
      throw new Exception("Phone can't be empty");
    }

    AwesomeDialog(
      context: context,
      dialogType: DialogType.INFO,
      animType: AnimType.BOTTOMSLIDE,
      title: 'Are You Sure?',
      desc: 'You wants to add $phone as moderator?',
      btnCancelOnPress: () {},
      btnOkOnPress: () async {
        MessageResponseModel messageResponseModel =
            await addModerator(phone: phone);

        if (messageResponseModel == null) {
          return;
        }

        reloadData();
      },
    )..show();

    // MessageResponseModel messageResponseModel = await addModerator(phone: phone);
    //
    // if(messageResponseModel==null){
    //   return;
    // }
    //
    // reloadData();
  }

  void reloadData() async {
    List<ModeratorListResponse> moderatorList = await getModeratorList();

    if (moderatorList != null) {
      setState(() {
        this.moderatorList = moderatorList;
      });
    }
  }

  int id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Moderators"),
        backgroundColor: Colors.teal,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin:
                EdgeInsets.only(left: 12, top: 5.0, bottom: 5.0, right: 12.0),
            child: Text(
              "Enter Phone No. to add as moderator",
              style: TextStyle(fontSize: 17),
            ),
          ),
          customSearchWidget1(
              title: "Phone No",
              controller: searchController,
              context: context,
              callback: searchOption),
          Expanded(
            child: Container(
              // height: MediaQuery.of(context).size.height ,
              margin: EdgeInsets.only(
                  left: 12, top: 3.0, bottom: 10.0, right: 12.0),
              child: ListView.builder(
                // physics: BouncingScrollPhysics(),
                itemCount: moderatorList.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return createModeratorList(
                      name: moderatorList[index].name,
                      phone: moderatorList[index].phoneNo,
                      index: index,
                      context: context);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  customSearchWidget1(
      {String title,
      TextEditingController controller,
      BuildContext context,
      VoidCallback callback}) {
    return Center(
      child: Container(
        height: 50.0,
        padding: EdgeInsets.only(left: 5.0, right: 5.0),
        margin: EdgeInsets.only(left: 12.0, top: 14.0),
        decoration: BoxDecoration(
            color: Color(0xffF5F3F3),
            borderRadius: BorderRadius.circular(20.0)),
        child: Stack(
          children: [
            TextField(
              controller: controller,
              // ignore: deprecated_member_use
              maxLengthEnforced: false,
              decoration: InputDecoration(
                  hintStyle: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Color(0xffB2B2B2)),
                  hintText: title,
                  border: InputBorder.none,
                  labelStyle:
                      TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  contentPadding: EdgeInsets.only(left: 10.0, right: 10.0)),
            ),
            Positioned(
              right: 0,
              child: Container(
                padding: EdgeInsets.all(14.0),
                height: MediaQuery.of(context).size.width * .12,
                width: MediaQuery.of(context).size.width * .12,
                decoration: BoxDecoration(
                    color: Color(0xffF5F3F3),
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(20.0),
                        topRight: Radius.circular(20.0))),
                child: GestureDetector(
                    // onTap: () async {
                    //   print("search");
                    //   var name = controller.text;
                    //
                    //   CardListResponse cards =
                    //       await getCardList(name: name, pageNo: 0, pageSize: 100);
                    // },
                    onTap: callback,
                    child: Icon(Icons.add)),
              ),
            )
          ],
        ),
      ),
    );
  }

  createModeratorList(
      {String name,
      String phone,
      int index,
      BuildContext context,
      VoidCallback function,
      Widget widget,
      int id}) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Container(
        padding: EdgeInsets.all(12),
        height: MediaQuery.of(context).size.height / 7,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  phone,
                  style: TextStyle(fontSize: 18, color: Color(0xff464646)),
                ),
                Text(
                  "Moderator",
                  style: TextStyle(fontSize: 18, color: Color(0xff464646)),
                ),
                Text(
                  name,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: primaryColor),
                ),
              ],
            ),
            Container(
              child: GestureDetector(
                onTap: () async {
                  AwesomeDialog(
                    context: context,
                    dialogType: DialogType.ERROR,
                    animType: AnimType.BOTTOMSLIDE,
                    title: 'Are You Sure?',
                    desc: 'You wants to delete this moderator?',
                    btnCancelOnPress: () {},
                    btnOkOnPress: () async {
                      MessageResponseModel messageResponse =
                          await deleteModerator(phone: phone);

                      if (messageResponse != null) {
                        sendToast(messageResponse.message);
                        reloadData();
                      }
                    },
                  )..show();

                  // MessageResponseModel messageResponse = await deleteModerator(phone: phone);
                  //
                  // if(messageResponse!=null){
                  //   sendToast(messageResponse.message);
                  //   reloadData();
                  // }
                },
                child: Container(
                  height: 50.0, width: 50.0,
                  // padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                      color: primaryColor, shape: BoxShape.circle),
                  child: Center(
                    child: Icon(
                      Icons.delete,
                      color: white,
                      size: 25,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

// ignore: unused_element
_buildTextField1(TextEditingController controller, String labelText) {
  return Container(
    decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        border: Border.all(
          width: 1.0,
        )),
    child: TextField(
      controller: controller,
      style: TextStyle(color: Color(0xff008080)),
      decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
          hintText: labelText,
          hintStyle: TextStyle(color: Colors.black26, fontSize: 15),
          border: InputBorder.none),
    ),
  );
}
