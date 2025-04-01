import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'screens/home_screen.dart';
import 'utils/theme.dart';
import 'utils/localization.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const StudyMotivationApp());
}

class StudyMotivationApp extends StatelessWidget {
  const StudyMotivationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Study Motivation App',
      theme: AppTheme.lightTheme,  // ✅ Fixed
      darkTheme: AppTheme.darkTheme,  // ✅ Added dark theme support
      home: HomeScreen(),
      localizationsDelegates: localizationDelegates, 
      supportedLocales: supportedLocales, 
    );
  }
}


