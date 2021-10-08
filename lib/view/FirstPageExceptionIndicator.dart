import 'package:flutter/material.dart';

/// Basic layout for indicating that an exception occurred.
class FirstPageExceptionIndicator extends StatelessWidget {
  const FirstPageExceptionIndicator({
    @required this.title,
    this.message,
    this.onTryAgain,
    Key key,
  })
      : assert(title != null),
        super(key: key);
  final String title;
  final String message;
  final VoidCallback onTryAgain;

  Container showMsg() {
    if (message != null) {
      return Container(
        child: const SizedBox(
          height: 16,
        ),
      );
    }
    else if (message != null) {
      return Container(
        child: Text(
          message,
          textAlign: TextAlign.center,
        ),
      );
    }


    else if (onTryAgain != null) {
      return Container(
        child: SizedBox(
            height:
            48
        ),
      );
    }


    else if (onTryAgain != null) {
      return Container(
        child: SizedBox(
          height: 50,
          width: double.infinity,
          // ignore: deprecated_member_use
          child: RaisedButton.icon(
            onPressed: onTryAgain,
            icon: const Icon(
              Icons.refresh,
              color: Colors.white,
            ),
            label: const Text(
              'Try Again',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ),
        ),
      );
    }

    else {
      return Container(
        child: const SizedBox(
          height: 16,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) =>
      Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
          child: Column(
            children: [
              Text(
                title,
                textAlign: TextAlign.center,
                style: Theme
                    .of(context)
                    .textTheme
                    .headline6,
              ),
              showMsg(),
            ],
          ),
        ),
      );
}
