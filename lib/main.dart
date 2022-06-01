import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import '../providers/app_state.dart';
import '../providers/auth_state.dart';
import '../screens/Welcome.dart';
import '../screens/SignIn.dart';
import '../screens/SignUp.dart';
import '../screens/ForgotPassword.dart';
import '../screens/Home.dart';
import '../screens/FriendsList.dart';
import '../screens/Passport.dart';
import '../screens/Leaderboards.dart';
import '../screens/Settings.dart';
import '../screens/ParkDetails.dart';
import '../screens/Profile.dart';
import '../screens/Notifications.dart';

Future<void> main() async {
  // When load for the first time, asynchronously initialize Firebase and then run app
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AppState>(create: (_) => AppState()),
        ChangeNotifierProvider<AuthState>(create: (_) => AuthState()),
      ],
      child: MaterialApp(
        theme: ThemeData(
          primaryColor: Color(0xFF2661FA),
          scaffoldBackgroundColor: Colors.white,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          textTheme: GoogleFonts.poppinsTextTheme(),
        ),
        title: 'ParkPort',
        debugShowCheckedModeBanner: false,
        home: Welcome(),
        routes: {
          '/Welcome': (context) => Welcome(),
          '/SignIn': (context) => SignIn(),
          '/SignUp': (context) => SignUp(),
          '/ForgotPassword': (context) => ForgotPassword(),
          '/Home': (context) => Home(),
          '/FriendsList': (context) => FriendsList(),
          '/Passport': (context) => Passports(),
          '/Leaderboards': (context) => Leaderboards(),
          '/Settings': (context) => Settings(),
          '/ParkDetails': (context) => ParkDetails(),
          '/Profile': (context) => Profile(),
          '/Notifications': (context) => Notifications(),
        },
      ),
    );
  }
}
