import "package:flutter/material.dart";

class CustomDeliveryAddress extends StatelessWidget {
  const CustomDeliveryAddress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.zero,
      color: Theme.of(context).dividerColor,
      child: SizedBox(
        height: 35.0,
        child: ListTile(
          minLeadingWidth: 10,
          leading: Icon(
            Icons.location_on,
            color: Theme.of(context).iconTheme.color,
            size: 18,
          ),
          title: Align(
            alignment: Alignment(-1.2, -0.2),
            child: Text(
              "Deliver to Shashank Nayak",
              style: TextStyle(color: Theme.of(context).secondaryHeaderColor),
            ),
          ),
        ),
      ),
    );
  }
}
