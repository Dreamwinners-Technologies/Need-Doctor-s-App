import 'package:flutter/material.dart';
import 'package:need_doctors/Constant/color/color.dart';

class SearchWidget extends StatefulWidget {
  TextEditingController searchController = TextEditingController();

  bool isWiritten;
  VoidCallback callback;
  SearchWidget({Key key, this.searchController, this.isWiritten, this.callback})
      : super(key: key);

  @override
  _SearchWidgetState createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.0),
          border: Border.all(width: 1.2, color: primarycolor)),
      height: 50.0,
      padding: EdgeInsets.only(left: 10.0, right: 10.0),
      margin: EdgeInsets.only(top: 14.0, left: 14.0, right: 14.0),
      child: Stack(
        children: [
          widget.isWiritten == false
              ? Positioned(
                  top: 12.0,
                  left: 10.0,
                  child: Icon(
                    Icons.search,
                    color: Colors.grey,
                  ))
              : Container(),
          Padding(
            padding:
                EdgeInsets.only(left: widget.isWiritten == false ? 25.0 : 0.0),
            child: TextField(
              controller: widget.searchController,

              // ignore: deprecated_member_use
              maxLengthEnforced: false,
              onChanged: (val) {
                setState(() {
                  widget.isWiritten = true;
                  widget.callback.call();
                  if (val.isEmpty || val == null) {
                    widget.isWiritten = false;
                    widget.callback.call();
                  }
                });
              },
              decoration: InputDecoration(
                  hintStyle: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Color(0xffB2B2B2)),
                  hintText: 'Search...',
                  border: InputBorder.none,
                  labelStyle:
                      TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  contentPadding: EdgeInsets.only(left: 10.0, right: 10.0)),
            ),
          ),
          Positioned(
              right: 5.0,
              top: 10.0,
              child: widget.isWiritten
                  ? Container(
                      alignment: Alignment.center,
                      height: 27.0,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.blueGrey),
                      width: 27.0,
                      child: GestureDetector(
                        onTap: () {
                          if (widget.searchController.text != null) {
                            setState(() {
                              widget.searchController.clear();
                              widget.isWiritten = false;
                              widget.callback.call();
                            });
                          }
                        },
                        child: Icon(Icons.close, color: whitecolor),
                      ),
                    )
                  : Container())
        ],
      ),
    );
  }
}
