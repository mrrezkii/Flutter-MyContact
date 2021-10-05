import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_contact/provider/star_provider.dart';
import 'package:my_contact/provider/theme_provider.dart';
import 'package:my_contact/ui/pages/detail_page.dart';
import 'package:my_contact/ui/pages/listview_contact.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'provider/behavior_provider.dart';
import 'provider/user_provider.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.black, // navigation bar color
      statusBarColor: Colors.white, // status bar
      statusBarIconBrightness: Brightness.dark // color
      ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: <SingleChildWidget>[
        ChangeNotifierProvider(
          create: (BuildContext context) => ThemeProvider(),
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) => StarProvider(),
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) => UserProvider(),
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) => BehaviorProvider(),
        ),
      ],
      builder: (context, widget) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            scaffoldBackgroundColor:
                context.watch<ThemeProvider>().mode == ThemeMode.light
                    ? Colors.white
                    : Colors.black,
          ),
          darkTheme: ThemeData.dark(),
          themeMode: context.watch<ThemeProvider>().mode,
          initialRoute: '/',
          routes: {
            '/': (context) => ListViewContact(),
            DetailPage.routeDetailPage: (context) => DetailPage(),
          },
          // home: ListViewContact(),
        );
      },
    );
  }
}
