import "package:flutter/material.dart";

class CartCountIndicator extends StatelessWidget {
  final String count;
  const CartCountIndicator({Key? key, required this.count}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 10,
      right: 10,
      child: Container(
        height: 20,
        width: 20,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Colors.black,
          ),
          borderRadius: BorderRadius.circular(25),
        ),
        child: Text(
          count,
          style: Theme.of(context).textTheme.headline5,
        ),
      ),
    );
  }
}
