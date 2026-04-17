import 'package:flutter/material.dart';
import 'package:pertemuan4/main.dart';
import 'package:pertemuan4/page/beranda_page.dart';

class ProfilePage extends StatelessWidget {
  final Map<String, String> data;

  const ProfilePage({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // HEADER
              Container(
                height: 180,
                color: Colors.blue.shade200,
                child: Center(
                  child: CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.person, size: 50),
                  ),
                ),
              ),

              const SizedBox(height: 10),

              Text(
                "Willy Abdul",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text("Jakarta, Indonesia"),
              Text("Flutter Software Engineer"),

              const SizedBox(height: 20),

              // CARD PROJECT
              Card(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      Column(children: [Text("Project"), Text("42")]),
                      Column(children: [Text("Followers"), Text("2308")]),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // SUMMARY
              ListTile(
                title: Text("Summary"),
                subtitle: Text(data["summary"] ?? "-"),
              ),

              // EXPERIENCE
              ListTile(
                title: Text("Experience"),
                subtitle: Text(
                  "${data["experience"] ?? "-"}\n${data["tahun"] ?? ""}",
                ),
              ),

              // PENDIDIKAN
              ListTile(
                title: Text("Pendidikan"),
                subtitle: Text(
                  "${data["sekolah"] ?? "-"}\n${data["tahunSekolah"] ?? ""}",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
