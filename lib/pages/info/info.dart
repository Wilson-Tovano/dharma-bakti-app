import 'package:dharma_bakti_app/constants/global_constants.dart';
import 'package:dharma_bakti_app/pages/info/about.dart';
import 'package:dharma_bakti_app/pages/info/exam_result.dart';
import 'package:dharma_bakti_app/pages/info/exam_schedule.dart';
import 'package:dharma_bakti_app/pages/info/class_schedule.dart';
import 'package:dharma_bakti_app/pages/info/payment_schedule.dart';
import 'package:dharma_bakti_app/pages/info/personil.dart';
import 'package:dharma_bakti_app/widgets/app_bar_custom.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InfoPage2 extends StatelessWidget {
  const InfoPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        toolbarHeight: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AppBarCustomBack(),
            const SizedBox(height: 20),

            // Info Jadwal Section
            buildInfoCard(
                'Info Jadwal',
                [
                  'SD',
                  'SMP',
                  'SMA',
                ],
                [
                  ClassSchedulePage(schoolClass: 'sd'),
                  ClassSchedulePage(schoolClass: 'smp'),
                  ClassSchedulePage(schoolClass: 'sma'),
                ],
                context),
            // Info Ujian Section
            buildInfoCard(
                'Info Ujian',
                [
                  'Info Jadwal dan Kelas',
                  'Info Hasil Ujian',
                ],
                [
                  ExamSchedulePage(),
                  ExamResultPage(),
                ],
                context),
            // Info Pembayaran Section
            buildInfoCard(
                'Info Pembayaran',
                [
                  'Pembayaran Uang Sekolah',
                ],
                [
                  PaymentSchedulePage(),
                ],
                context),
            // Info Lainnya Section
            buildInfoCard(
                'Info Lainnya',
                [
                  'Info Guru / Staff',
                  'Tentang Sekolah',
                ],
                [
                  PersonilPage(),
                  AboutPage(),
                ],
                context),
          ],
        ),
      ),
    );
  }

  Widget buildInfoCard(String title, List<String> items, List<Widget> pages,
      BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
      child: Container(
        // margin: EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(0, 4),
              blurRadius: 4,
            ),
          ],
        ),
        child: ExpansionTile(
          shape: const RoundedRectangleBorder(
            side: BorderSide.none,
          ),
          title: Text(
            title,
            style: GoogleFonts.overpass(
                color: AppColors.labelTextColor, fontWeight: FontWeight.bold),
          ),
          iconColor: Colors.brown,
          // children: items.map((item) => buildListItem(item, page, context)).toList(),
          children: List.generate(items.length, (index) {
            return buildListItem(items[index], pages[index], context);
          }),
        ),
      ),
    );
  }

  Widget buildListItem(String title, Widget page, BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: AppColors.thirdColor),
      child: ListTile(
        title: Text(
          title,
          style: GoogleFonts.overpass(color: AppColors.labelTextColor),
        ),
        trailing: const Icon(
          Icons.chevron_right,
          color: AppColors.labelTextColor,
        ),
        onTap: () {
          // Handle item tap, for navigation or other actions
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => page,
            ),
          );
        },
      ),
    );
  }
}
