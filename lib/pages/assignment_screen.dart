import 'package:dharma_bakti_app/pages/assignment_detail.dart';
import 'package:flutter/material.dart';
import 'package:dharma_bakti_app/widgets/app_bar_custom.dart';
import 'package:dharma_bakti_app/constants/global_constants.dart';
import 'package:google_fonts/google_fonts.dart';

class AssignmentScreen extends StatelessWidget {
  AssignmentScreen({super.key});

  final List<Map<String, String>> events = [
    {
      'image': 'assets/images/',
      'mapel': 'Bahasa Indonesia',
      'tugas': 'Latihan Praktik 2',
      'location': 'Dharma Bakti',
    },
    {
      'image': 'assets/images/',
      'mapel': 'Biologi',
      'tugas': 'Tugas Menanam',
      'location': 'Dharma Bakti',
    },
    {
      'image': 'assets/images/',
      'mapel': 'Matematika',
      'tugas': 'Tugas Aljabar',
      'location': 'Dharma Bakti',
    },
    {
      'image': 'assets/images/',
      'mapel': 'Fisika',
      'tugas': 'Latihan 5',
      'location': 'Dharma Bakti',
    },
    {
      'image': 'assets/images/',
      'mapel': 'Bahasa Inggris',
      'tugas': 'Conversation',
      'location': 'Dharma Bakti',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        toolbarHeight: 0,
      ),
      body: Column(
        children: [
          const AppBarCustomBack(),
          Expanded(
            child: ListView.builder(
              itemCount: events.length,
              itemBuilder: (context, index) {
                final event = events[index];
                return Card(
                  elevation: 0,
                  color: AppColors.thirdColor,
                  margin:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: ListTile(
                    // leading: Image.asset('assets/images/1.png'),
                    leading: Image.asset('${event['image']}${index + 1}.png'),
                    title: Text(
                      event['mapel']!,
                      style: GoogleFonts.overpass(
                          color: AppColors.labelTextColor,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      event['tugas']!,
                      style: GoogleFonts.overpass(),
                    ),
                    trailing: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: AppColors.labelTextColor),
                      width: 110,
                      child: TextButton(
                        onPressed: () {
                          // Tambahkan navigasi atau fungsi "Baca Selengkapnya"
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) =>
                                  AssignmentDetailScreen(mapel: event['mapel']),
                            ),
                          );
                        },
                        child: Text(
                          'BACA SELENGKAPNYA',
                          style: GoogleFonts.overpass(
                              color: Colors.white,
                              fontSize: 9,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
