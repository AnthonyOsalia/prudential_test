import 'package:flutter/material.dart';
import 'package:prudential_test/utils/colors.dart';

class MyButton extends StatelessWidget {
  String label;

  IconData icon;

  dynamic onPressed;

  MyButton({this.label, this.icon, this.onPressed});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Center(
        child: FlatButton(
          onPressed: onPressed,
          padding: EdgeInsets.all(16),
          color: Cc.red_prudential,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                icon,
                size: 25,
                color: Cc.white,
              ),
              SizedBox(
                width: 15,
              ),
              Text(
                label,
                style: TextStyle(
                  color: Cc.white,
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
