import 'dart:developer';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/core/routes/routes.dart';
import 'package:todo_app/main.dart';

class AwesomeNotificationService {
  static AwesomeNotificationService instance = AwesomeNotificationService._();

  AwesomeNotificationService._();

  bool _isInitialized = false;

  Future<void> initialize() async {
    if (_isInitialized) return;

    await AwesomeNotifications().initialize(
      'resource://mipmap/launcher_icon',
      [
        NotificationChannel(
          channelGroupKey: 'basic_channel_group',
          channelKey: 'basic_channel_version_one',
          channelName: 'Basic notifications',
          channelDescription: 'Notification channel for basic tests',
          defaultColor: Color(0xFF9D50DD),
          ledColor: Colors.white,
          importance: NotificationImportance.High,
          playSound: true,
          enableVibration: true,
        ),
      ],
      channelGroups: [
        NotificationChannelGroup(
          channelGroupKey: 'basic_channel_group',
          channelGroupName: 'Basic group',
        ),
      ],
      debug: true,
    );

    await AwesomeNotifications().isNotificationAllowed().then((
      isAllowed,
    ) async {
      if (!isAllowed) {
        await AwesomeNotifications().requestPermissionToSendNotifications();
      }
    });

    await _setupListeners();
    _isInitialized = true;
    log('✅ AwesomeNotificationService initialized');
  }

  Future<void> _setupListeners() async {
    await AwesomeNotifications().setListeners(
      onActionReceivedMethod: onActionReceivedMethod,
      onNotificationCreatedMethod: onNotificationCreatedMethod,
      onNotificationDisplayedMethod: onNotificationDisplayedMethod,
      onDismissActionReceivedMethod: onDismissActionReceivedMethod,
    );
  }

  static Future<void> onNotificationCreatedMethod(
    ReceivedNotification receivedNotification,
  ) async {
    log('✅ Created: ${receivedNotification.title}');
  }

  static Future<void> onNotificationDisplayedMethod(
    ReceivedNotification receivedNotification,
  ) async {
    log(' Displayed: ${receivedNotification.title}');
  }

  static Future<void> onActionReceivedMethod(
    ReceivedAction receivedAction,
  ) async {
    if (receivedAction.payload!['route'] == Routes.newTasks) {
      MyApp.navigatorKey.currentState?.pushNamedAndRemoveUntil(
        Routes.newTasks,
        (route) => false,
      );
    }
  }

  static Future<void> onDismissActionReceivedMethod(
    ReceivedAction receivedAction,
  ) async {
    log(' Dismissed: ${receivedAction.id}');
  }

  Future<void> scheduleTaskReminder({
    required int taskId,
    required String taskTitle,
    required String time,
    required String date,
  }) async {
    try {
      final DateTime taskDateTime = _parseDateTime(date, time);

      final DateTime reminderTime =
          taskDateTime.subtract(const Duration(minutes: 5));
      if (reminderTime.isAfter(DateTime.now())) {
        await AwesomeNotifications().createNotification(
          content: NotificationContent(
            id: taskId,
            channelKey: 'basic_channel_version_one',
            title: '⏰ Task Reminder',
            body: 'Your task "$taskTitle" is starting in 5 minutes!',
            payload: {'route': Routes.newTasks},
            category: NotificationCategory.Reminder,
            notificationLayout: NotificationLayout.Default,
            wakeUpScreen: true,
          ),
          schedule: NotificationCalendar.fromDate(
            date: reminderTime,
            allowWhileIdle: true,
            preciseAlarm: true,
          ),
        );
      }
    } catch (e) {
      log('Error scheduling task reminder: ${e.toString()}');
    }
  }

  DateTime _parseDateTime(String dateStr, String timeStr) {
    final DateTime parsedDate = DateFormat.yMMMd().parse(dateStr);
    final RegExp timeRegex =
        RegExp(r'(\d{1,2}):(\d{2})\s*(AM|PM)', caseSensitive: false);
    final match = timeRegex.firstMatch(timeStr);

    if (match == null) {
      throw FormatException('Invalid time format: $timeStr');
    }

    int hour = int.parse(match.group(1)!);
    final int minute = int.parse(match.group(2)!);
    final String period = match.group(3)!.toUpperCase();

    if (period == 'PM' && hour != 12) {
      hour += 12;
    } else if (period == 'AM' && hour == 12) {
      hour = 0;
    }

    return DateTime(
      parsedDate.year,
      parsedDate.month,
      parsedDate.day,
      hour,
      minute,
    );
  }

  Future<void> cancelTaskReminder(int taskId) async {
    await AwesomeNotifications().cancel(taskId);
    log(' Cancelled reminder for task ID: $taskId');
  }
}
