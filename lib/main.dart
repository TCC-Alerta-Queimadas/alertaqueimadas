import 'package:alertaqueimada/pages/main/main_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Alerta Queimadas',
        theme: ThemeData(
           colorScheme: ColorScheme.dark(
              primary: Color.fromARGB(255, 245, 100, 4)
              
           )
        ),
          
        
        home: MainPage());
  }
}

