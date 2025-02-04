import 'package:flutter/material.dart';
import 'package:dharma_bakti_app/widgets/app_bar_custom.dart';
import 'package:dharma_bakti_app/constants/global_constants.dart';

class EventScreen extends StatelessWidget {
  EventScreen({super.key});

  final List<Map<String, String>> events = [
    {
      'image': 'assets/images/',
      'date': '10 November',
      'title': 'Hari Pahlawan',
      'location': 'Dharma Bakti',
    },
    {
      'image': 'assets/images/',
      'date': '12 November',
      'title': 'Hari Ayah Sedunia',
      'location': 'Dharma Bakti',
    },
    {
      'image': 'assets/images/',
      'date': '25 November',
      'title': 'Hari Guru',
      'location': 'Dharma Bakti',
    },
    {
      'image': 'assets/images/',
      'date': '13 Desember',
      'title': 'Hari Nusantara',
      'location': 'Dharma Bakti',
    },
    {
      'image': 'assets/images/',
      'date': '25 Desember',
      'title': 'Hari Natal',
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
                      event['date']!,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(event['title']!),
                    trailing: Container(
                      width: 110,
                      child: TextButton(
                        onPressed: () {
                          // Tambahkan navigasi atau fungsi "Baca Selengkapnya"
                        },
                        child: const Text(
                          'BACA SELENGKAPNYA',
                          style: TextStyle(color: Colors.brown, fontSize: 10),
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
