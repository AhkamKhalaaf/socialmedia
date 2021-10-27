import 'package:flutter/material.dart';

import 'config/palette_config.dart';
import 'screens/nav_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
            primarySwatch: Colors.blue,
            scaffoldBackgroundColor: Palette.scaffold,
            visualDensity: VisualDensity.adaptivePlatformDensity),
        home:
            // const TestUi()
            const NavScreen()
        // LayoutBuilder(builder: (BuildContext context,BoxConstraints  boxConstraints ){
        //   print('${boxConstraints.minWidth},,,maxwidth');
        //   if(boxConstraints.minWidth<=500)
        //     {
        //       return const MobileUi();
        //      // return const DeskTopUi();
        //     }
        //   return const DeskTopUi();
        // },),
        );
  }
}
