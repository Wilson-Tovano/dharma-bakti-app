import 'package:dharma_bakti_app/constants/global_constants.dart';
import 'package:dharma_bakti_app/widgets/app_bar_custom.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutPage extends StatelessWidget {
  AboutPage({super.key});

  List<String> paymentLabels = ['Semester Ganjil', 'Semester Genap'];

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
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Tentang Sekolah Dharma Bakti",
                        style: GoogleFonts.overpass(
                          color: AppColors.labelTextColor,
                          fontWeight: FontWeight.w900,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Text(
                        "Sekolah Menengah Atas Swasta (SMAS) Dharma Bakti terletak di Jalan Bidan No. 8, Bakaran Batu, Lubuk Pakam, Kabupaten Deli Serdang, Sumatera Utara. Sekolah ini memiliki akreditasi A berdasarkan penilaian tahun 2022",
                        style: GoogleFonts.overpass(
                          color: AppColors.labelTextColor,
                          fontWeight: FontWeight.w900,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      const SizedBox(
                        height: 20,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
