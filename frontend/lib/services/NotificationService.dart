import 'dart:ui';

import 'package:awesome_notifications/awesome_notifications.dart';

import '../utils/utilities.dart';

Future<void> createNotificationChannel() async {
  await AwesomeNotifications().initialize(
      null,
      [
        NotificationChannel(
            channelGroupKey: 'basic_channel_group',
            channelKey: 'basic_channel',
            channelName: 'Basic Notifications For Catalog App',
            channelDescription: 'Notification channel for Catalog App',
            defaultColor: Color(0xFF9D50DD),
            importance: NotificationImportance.High)
      ],
      debug: true);
}

Future<void> createNotification(String title, String body) async {
  await AwesomeNotifications().createNotification(
    content: NotificationContent(
      id: createUniqueId(),
      channelKey: 'basic_channel',
      title: title,
      body: body,
    ),
  );
}
