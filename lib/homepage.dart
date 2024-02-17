import 'package:dio/dio.dart';
import 'package:first/pages/aduan.dart';
import 'package:first/pages/user.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

final dio = Dio();

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  int currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GFAppBar(
        backgroundColor: Colors.deepPurple,
      ),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: Colors.purple,
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(
              Icons.home,
              color: Colors.white,
            ),
            icon: Icon(Icons.home_outlined),
            label: "",
          ),
          NavigationDestination(
            selectedIcon: Icon(
              Icons.mail,
              color: Colors.white,
            ),
            icon: Badge(child: Icon(Icons.mail_outline)),
            label: '',
          ),
        ],
      ),
      body: <Widget>[
        UserPage(),

        AduanPage(),
      ][currentPageIndex],
    );
  }
}
