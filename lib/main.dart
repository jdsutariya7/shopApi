import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_admin_pannel_app/sp1.dart';

import 'mainpage.dart';

enum Environment {
  staging,
  production,
}

class BuildConfiguration {
  static final shared = BuildConfiguration();

  late Environment environment;

  String get baseUrl {
    switch (environment) {
      case Environment.staging:
        return "";
      case Environment.production:
        return "";
    }
  }

  String get socketUrl {
    switch (environment) {
      case Environment.staging:
        return "";
      case Environment.production:
        return "";
    }
  }

  String get mode {
    switch (environment) {
      case Environment.staging:
        return "TEST";
      case Environment.production:
        return "PROD";
    }
  }

  String get googleMapKey {
    switch (environment) {
      case Environment.staging:
        return "TEST";
      case Environment.production:
        return "PROD";
    }
  }
}

void main() {
  BuildConfiguration.shared.environment =
      Environment.production; // Change to production

  // Access configuration values

  String baseUrl = BuildConfiguration.shared.baseUrl;

  String socketUrl = BuildConfiguration.shared.socketUrl;

  String mode = BuildConfiguration.shared.mode;

  // Use the configuration values in your application

  print("Base URL: $baseUrl");

  print("Socket URL: $socketUrl");

  print("Mode: $mode");

  // runApp(MaterialApp(debugShowCheckedModeBanner: false,home:AdminPannelDemo(),),);
  // runApp(MaterialApp(debugShowCheckedModeBanner: false,home:trydemo(),),);
  // runApp(MaterialApp(debugShowCheckedModeBanner: false,home:ytButton(),),);

  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.blueAccent,
    ),
  );
//  runApp(MaterialApp(debugShowCheckedModeBanner: false,home:SplashScreen(),),);
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
    ),
  );
}
