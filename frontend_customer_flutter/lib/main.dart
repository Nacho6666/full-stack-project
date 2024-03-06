import 'package:adaptive_navbar/adaptive_navbar.dart';
import 'package:flutter/material.dart';
import 'package:frontend_customer_flutter/pages/HomeBodyView.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Customer Page',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    final sw = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AdaptiveNavBar(
        screenWidth: sw,
        title: TextButton(
          onPressed: (){
            print("t");
            Navigator.pushNamed(context, "homePage");
          },
          child: Text("抽獎"),
        ),
        navBarItems: [
          NavBarItem(
            text: "首頁",
            onTap: () {
              Navigator.pushNamed(context, "homePage");
            },
          ),
          NavBarItem(
            text: "About Us",
            onTap: () {
              Navigator.pushNamed(context, "routeName");
            },
          ),
          NavBarItem(
            text: "關於我們",
            onTap: () {
              Navigator.pushNamed(context, "routeName");
            },
          ),
          NavBarItem(
            text: "登入",
            onTap: () {
              Navigator.pushNamed(context, "routeName");
            },
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery
                .of(context)
                .size
                .width / 8),
        children: const [
          BodyView(),
        ],
      ),
    );
  }
}