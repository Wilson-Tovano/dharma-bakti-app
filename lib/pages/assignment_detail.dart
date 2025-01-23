import 'dart:ffi';

import 'package:dharma_bakti_app/pages/dashboard.dart';
import 'package:dharma_bakti_app/services/awesome_notif.dart';
import 'package:dharma_bakti_app/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:dharma_bakti_app/widgets/app_bar_custom.dart';
import 'package:dharma_bakti_app/constants/global_constants.dart';
import 'package:google_fonts/google_fonts.dart';

class AssignmentDetailScreen extends StatelessWidget {
  AssignmentDetailScreen({super.key, required this.mapel});

  final String? mapel;

  @override
  Widget build(BuildContext context) {
    MyNotification _notify = MyNotification(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        toolbarHeight: 0,
      ),
      body: Column(
        children: [
          const AppBarCustomBack(),
          Container(
            width: 330,
            child: Card(
              elevation: 0,
              color: AppColors.thirdColor,
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("TUGAS - Belum Dinilai\n",
                        style: GoogleFonts.overpass(
                            color: Colors.amber,
                            fontSize: 16,
                            fontWeight: FontWeight.bold)),
                    Text(
                      mapel!,
                      style: GoogleFonts.overpass(
                          color: AppColors.labelTextColor,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    Text("Deadline: 31 Desember 2025\n",
                        style: GoogleFonts.overpass(
                            color: Colors.amber,
                            fontSize: 12,
                            fontWeight: FontWeight.bold)),
                    Text(
                        "Penilaian:\nKriteria A (10)\nKriteria B (20)\nKriteria C (30)\nKriteria D (40)",
                        style: GoogleFonts.overpass(
                            color: AppColors.labelTextColor,
                            fontSize: 13,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ),
          ),
          Text(
            "Materi Pembantu",
            style: GoogleFonts.overpass(
                color: AppColors.labelTextColor,
                fontSize: 16,
                fontWeight: FontWeight.bold),
            textAlign: TextAlign.left,
          ),
          Container(
            width: 330,
            child: Card(
              elevation: 0,
              color: AppColors.thirdColor,
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Materi Pembelajaran",
                          style: GoogleFonts.overpass()),
                      Text("Download",
                          style: GoogleFonts.overpass(
                              color: AppColors.labelTextColor,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline)),
                    ]),
              ),
            ),
          ),
          Container(
            width: 330,
            child: Card(
              elevation: 0,
              color: AppColors.thirdColor,
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Attach", style: GoogleFonts.overpass()),
                      Icon(Icons.add),
                    ]),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: SizedBox(
              height: 50,
              width: 1000,
              child: ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text(mapel!),
                        content: Text("Tugas sudah dikumpulkan!"),
                        actions: [
                          TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                                Navigator.pop(context);
                              },
                              child: Text("Tutup")),
                        ],
                      ),
                    );

                    _notify.homeworkNotif(mapel!);
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryColor,
                      foregroundColor: Colors.white,
                      elevation: 0,
                      shadowColor: Colors.transparent),
                  child: Text(
                    "Kumpul",
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                        color: AppColors.labelTextColor),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
