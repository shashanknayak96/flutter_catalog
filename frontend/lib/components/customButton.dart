import "package:flutter/material.dart";
import 'package:flutter_catalog/utils/routes.dart';

class CustomButton extends StatefulWidget {
  const CustomButton({Key? key, this.buttonName, this.color, this.action})
      : super(key: key);
  final String? buttonName;
  final Color? color;
  final dynamic action;

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  bool changeButton = false;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).backgroundColor,
      child: InkWell(
        onTap: () => widget.action(context),
        child: AnimatedContainer(
          duration: Duration(seconds: 1),
          height: 50,
          curve: Curves.easeIn,
          alignment: Alignment.center,
          child: changeButton
              ? Icon(
                  Icons.done,
                  color: Colors.white,
                )
              : Text(
                  widget.buttonName.toString(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 22,
                  ),
                ),
          decoration: BoxDecoration(
            color: changeButton ? Colors.grey : widget.color,
            borderRadius: BorderRadius.circular(changeButton ? 50 : 6),
          ),
        ),
      ),
    );
  }

  moveToHomePage(BuildContext context) async {
    setState(() {
      changeButton = true;
    });
    await Future.delayed(Duration(seconds: 3));
    await Navigator.pushNamed(context, MyRoutes.homeRoute);
    setState(() {
      changeButton = false;
    });
  }
}
