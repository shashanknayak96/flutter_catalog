import 'package:flutter/material.dart';

import '../Theme/customTheme.dart';

class ActionButton extends StatefulWidget {
  final String buttonText;
  final Color color;
  final Function()? onTap;

  const ActionButton({
    Key? key,
    required this.buttonText,
    required this.color,
    required this.onTap,
  }) : super(key: key);

  @override
  State<ActionButton> createState() => _ActionButtonState();
}

class _ActionButtonState extends State<ActionButton> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).backgroundColor,
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: InkWell(
          onTap: widget.onTap,
          child: AnimatedContainer(
            duration: Duration(seconds: 1),
            height: 50,
            curve: Curves.easeIn,
            alignment: Alignment.center,
            child: Text(
              widget.buttonText.toString(),
              style: Theme.of(context).textTheme.headline1,
            ),
            decoration: BoxDecoration(
              color: widget.color,
              border: Border.all(color: darkBlue),
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ),
      ),
    );
  }
}
