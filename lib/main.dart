import 'package:flutter/material.dart';
import 'package:pertemuan4/page/beranda_page.dart';
import 'package:pertemuan4/page/profile_page.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:simple_alert_dialog/simple_alert_dialog.dart';
import 'package:cherry_toast/cherry_toast.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int currentPage = 0;

  Map<String, String> dataCV = {};

  void handleSubmit(Map<String, String> data) {
    setState(() {
      dataCV = data;
      currentPage = 1; // pindah ke profile
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [
      BerandaPage(onSubmit: handleSubmit),
      ProfilePage(data: dataCV),
    ];

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: pages[currentPage],
        bottomNavigationBar: SalomonBottomBar(
          currentIndex: currentPage,
          onTap: (i) => setState(() => currentPage = i),
          items: [
            SalomonBottomBarItem(
              icon: Icon(Icons.home),
              title: Text("Beranda"),
              selectedColor: Colors.blue,
            ),
            SalomonBottomBarItem(
              icon: Icon(Icons.person),
              title: Text("Profile"),
              selectedColor: Colors.blue,
            ),
          ],
        ),
      ),
    );
  }
}
