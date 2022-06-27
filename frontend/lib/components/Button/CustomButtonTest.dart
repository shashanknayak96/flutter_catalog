import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';

class CustomButtonTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: InkWell(
        onTap: () {
          AwesomeNotifications().createNotification(
              content: NotificationContent(
                  id: 10,
                  channelKey: 'basic_channel',
                  title: 'Simple Notification',
                  body: 'Simple body'));
        },
        child: AnimatedContainer(
          duration: Duration(seconds: 1),
          height: 35,
          width: 100,
          curve: Curves.easeIn,
          alignment: Alignment.center,
          child: Text(
            "GET PERMISSION",
            style: Theme.of(context).textTheme.headline2,
          ),
          decoration: BoxDecoration(
            color: Theme.of(context).dialogBackgroundColor, // added
            border: Border.all(), // added
            borderRadius: BorderRadius.circular(25.0),
          ),
        ),
      ),
    );
  }
}
