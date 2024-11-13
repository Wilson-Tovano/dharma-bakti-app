import 'package:dharma_bakti_app/constants/global_constants.dart';
import 'package:dharma_bakti_app/widgets/app_bar_custom.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ExamResultPage extends StatelessWidget {
  ExamResultPage({super.key});

  List<String> terms = [
    'Hasil Ujian Semester Ganjil',
    'Hasil Ujian Semester Genap'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.primaryColor,
          toolbarHeight: 0,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AppBarCustomBack(),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: const BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Jadwal Ujian\nSemester Ganjil 2024/2025",
                      style: GoogleFonts.overpass(
                        color: AppColors.labelTextColor,
                        fontWeight: FontWeight.w900,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Nama: Delvin Dwiantono\nNomor Induk: 12345678\nKelas: VII",
                      style: GoogleFonts.overpass(
                        color: AppColors.labelTextColor,
                        fontWeight: FontWeight.w900,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    Column(
                      children: List.generate(2, (index) {
                        return Padding(
                          padding: EdgeInsets.all(15),
                          child: Container(
                            decoration: BoxDecoration(
                                color: AppColors.thirdColor,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.black12,
                                    offset: Offset(0, 4),
                                    blurRadius: 4,
                                  ),
                                ]),
                            child: ListTile(
                              title: Text(
                                terms[index],
                                style: GoogleFonts.overpass(
                                    color: AppColors.labelTextColor),
                              ),
                              trailing: Text(
                                "Download",
                                style: GoogleFonts.overpass(
                                    color: AppColors.labelTextColor,
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.underline,
                                    fontSize: 16),
                              ),
                              onTap: () {
                                // Handle item tap, for navigation or other actions
                              },
                            ),
                          ),
                        );
                      }),
                    ),
                    const SizedBox(
                      height: 20,
                    )
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
