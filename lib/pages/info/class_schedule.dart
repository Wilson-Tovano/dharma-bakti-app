import 'package:dharma_bakti_app/constants/global_constants.dart';
import 'package:dharma_bakti_app/widgets/app_bar_custom.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ClassSchedulePage extends StatelessWidget {
  ClassSchedulePage({super.key, required this.schoolClass});

  final String? schoolClass;
  List<String> sdClasses = ['SD 1', 'SD 2', 'SD 3', 'SD 4', 'SD 5', 'SD 6'];
  List<String> smpClasses = ['SMP 1', 'SMP 2', 'SMP 3'];
  List<String> smaClasses = ['SMA 1', 'SMA 2', 'SMA 3'];
  List<String>? currentClasses;
  String? classAbbr;

  @override
  Widget build(BuildContext context) {
    if (schoolClass == 'sd') {
      currentClasses = sdClasses;
      classAbbr = 'Sekolah Dasar';
    } else if (schoolClass == 'smp') {
      currentClasses = smpClasses;
      classAbbr = 'Sekolah Menengah Pertama';
    } else {
      currentClasses = smaClasses;
      classAbbr = 'Sekolah Menengah Akhir';
    }
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
                      "Jadwal $classAbbr\nSemester Ganjil 2024/2025",
                      style: GoogleFonts.overpass(
                        color: AppColors.labelTextColor,
                        fontWeight: FontWeight.w900,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Column(
                      children: List.generate(currentClasses!.length, (index) {
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
                                currentClasses![index],
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
