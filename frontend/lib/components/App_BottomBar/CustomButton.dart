import "package:flutter/material.dart";
import 'package:flutter_catalog/models/cart.dart';
import 'package:flutter_catalog/models/product.dart';
import 'package:flutter_catalog/utils/routes.dart';

class CustomButton extends StatefulWidget {
  final String? buttonName;
  final Color? color;
  final dynamic action;
  final Product product;
  const CustomButton(
      {Key? key,
      this.buttonName,
      this.color,
      this.action,
      required this.product})
      : super(key: key);

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).backgroundColor,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: InkWell(
          onTap: () => {
            AddProductMutation(widget.product),
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text('Item added to cart!'),
              duration: Duration(seconds: 1),
            )),
          },
          child: AnimatedContainer(
            duration: Duration(seconds: 1),
            height: 50,
            curve: Curves.easeIn,
            alignment: Alignment.center,
            child: Text(
              widget.buttonName.toString(),
              style: Theme.of(context).textTheme.headline1,
            ),
            decoration: BoxDecoration(
              color: widget.color,
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ),
      ),
    );
  }

  // moveToHomePage(BuildContext context) async {
  //   setState(() {
  //     changeButton = true;
  //   });
  //   await Future.delayed(Duration(seconds: 3));
  //   await Navigator.pushNamed(context, MyRoutes.homeRoute);
  //   setState(() {
  //     changeButton = false;
  //   });
  // }
}
