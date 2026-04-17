import 'package:cherry_toast/cherry_toast.dart';
import 'package:flutter/material.dart';
import 'package:pertemuan4/main.dart';
import 'package:pertemuan4/page/profile_page.dart';
import 'package:simple_alert_dialog/simple_alert_dialog.dart';

class BerandaPage extends StatefulWidget {
  final Function(Map<String, String>) onSubmit;

  const BerandaPage({super.key, required this.onSubmit});

  @override
  State<BerandaPage> createState() => _BerandaPageState();
}

class _BerandaPageState extends State<BerandaPage> {
  final TextEditingController summary = TextEditingController();
  final TextEditingController experience = TextEditingController();
  final TextEditingController tahun = TextEditingController();
  final TextEditingController sekolah = TextEditingController();
  final TextEditingController tahunSekolah = TextEditingController();

  Widget buildInput(String hint, TextEditingController controller) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hint,
          filled: true,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("FORMULIR INPUT CV"),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            buildInput("Summary", summary),
            buildInput("Experience", experience),
            buildInput("Tahun (2024-2026)", tahun),
            buildInput("Sekolah", sekolah),
            buildInput("Tahun Sekolah", tahunSekolah),

            const SizedBox(height: 15),

            // SUBMIT
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: const EdgeInsets.all(15),
                ),
                onPressed: () {
                  widget.onSubmit({
                    "summary": summary.text,
                    "experience": experience.text,
                    "tahun": tahun.text,
                    "sekolah": sekolah.text,
                    "tahunSekolah": tahunSekolah.text,
                  });

                  CherryToast.success(
                    title: const Text("Berhasil menambahkan data!"),
                  ).show(context);
                },
                child: const Text("Submit"),
              ),
            ),

            const SizedBox(height: 10),

            // DELETE
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding: const EdgeInsets.all(15),
                ),
                onPressed: () {
                  summary.clear();
                  experience.clear();
                  tahun.clear();
                  sekolah.clear();
                  tahunSekolah.clear();

                  CherryToast.warning(
                    title: const Text("Data dihapus!"),
                  ).show(context);
                },
                child: const Text("Delete"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
