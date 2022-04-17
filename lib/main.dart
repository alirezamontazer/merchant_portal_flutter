import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:merchant_app/locator.dart';
import 'package:merchant_app/views/layout_holder/layout_holder.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  /// Gather information on how many times the app is accessed
  await FirebaseAnalytics.instance.logEvent(
    name: "website accessed",
    parameters: {
      "test": "test passed",
    },
  );

  /// Setup Locator creates a singleton navigation service
  /// in order to navigate between pages
  setupLocator();

  /// Responsive Layout Breakpoints for different screen sizes
  ResponsiveSizingConfig.instance.setCustomBreakpoints(
    const ScreenBreakpoints(desktop: 1150, tablet: 1150, watch: 200),
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Merchant App',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: const LayoutHolder());
  }
}
