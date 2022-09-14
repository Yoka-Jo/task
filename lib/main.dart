import 'dart:developer';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:platform_device_id/platform_device_id.dart';
import 'package:task/app/dependency_injection.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:task/app/globals.dart';
import 'package:task/firebase_options.dart';
import 'app/my_app.dart';
import 'presentation/shared/components/show_toast.dart';

void notificationToast(RemoteMessage message) =>
    showToast(message.notification?.body ?? "", ToastState.success);

Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async =>
    notificationToast(message);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initAppModule();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  firebaseToken = await FirebaseMessaging.instance.getToken();
  log(firebaseToken ?? "");
  deviceId = await PlatformDeviceId.getDeviceId;
  log(deviceId ?? "");

  //! Notification while app is running
  FirebaseMessaging.onMessage.listen((message) => notificationToast(message));
  //! Notification when app opens after pressing notification
  FirebaseMessaging.onMessageOpenedApp
      .listen((message) => notificationToast(message));
  //! Notification appears when the app is in background
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => const MyApp(), // Wrap your app
    ),
  );
}
