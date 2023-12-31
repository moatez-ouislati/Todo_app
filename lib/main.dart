import 'package:flutter/material.dart';
import './Screens/homepage.dart';

void main() async{  // Removed the async keyword from main()
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Homepage(),
       debugShowCheckedModeBanner: false,
    );
  }
}

//2023 © Moataz Ouesleti. Tous droits réservés.