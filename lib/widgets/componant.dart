import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showSnackBar({
  @required String text,
  Function press,
  @required GlobalKey<ScaffoldState> scaffoldKey,
}) {
  scaffoldKey.currentState.showSnackBar(
    SnackBar(
      content: Text(
        text,
      ),
      backgroundColor: Colors.grey,
      duration: Duration(
        seconds: 2,
      ),
      behavior: SnackBarBehavior.fixed,
      elevation: 0.0,
      action: press != null ? SnackBarAction(
        label: 'UNDO',
        onPressed: press,
      ) : null,
    ),
  );
}

void navigateTo(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );

void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(
      builder: (context) => widget,
    ),
    (Route<dynamic> route) => false);

void buildProgress({
  context,
  text,
  bool error = false,
}) =>
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                if (!error) CircularProgressIndicator(),
                if (!error)
                  SizedBox(
                    width: 20.0,
                  ),
                Expanded(
                  child: Text(
                    text,
                  ),
                ),
              ],
            ),
            if (error)
              SizedBox(
                height: 20.0,
              ),
            if (error)
              defaultButton(
                function: () {
                  Navigator.pop(context);
                },
                text: 'cancel',
              )
          ],
        ),
      ),
    );

Widget defaultButton({
  Color background = Colors.deepOrange,
  double radius = 5.0,
  @required Function function,
  @required String text,
  bool toUpper = true,
}) =>
    Container(
      width: double.infinity,
      height: 40.0,
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(
          radius,
        ),
      ),
      child: FlatButton(
        onPressed: function,
        child: Text(
          toUpper ? text.toUpperCase() : text,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );

void showToast({
  @required text,
  @required error,
}) =>
    Fluttertoast.showToast(
      msg: text.toString(),
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: error ? Colors.red : Colors.green,
      textColor: Colors.white,
      fontSize: 16.0,
    );
