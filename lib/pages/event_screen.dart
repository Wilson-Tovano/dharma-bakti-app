import 'package:flutter/material.dart';
import 'package:dharma_bakti_app/widgets/app_bar_custom.dart';
import 'package:dharma_bakti_app/constants/global_constants.dart';

class EventScreen extends StatelessWidget {
  EventScreen({super.key});

  final List<Map<String, String>> events = [
    {
      'date': '10 November',
      'title': 'Hari Pahlawan',
      'location': 'Dharma Bakti',
    },
    {
      'date': '12 November',
      'title': 'Hari Ayah Sedunia',
      'location': 'Dharma Bakti',
    },
    {
      'date': '25 November',
      'title': 'Hari Guru',
      'location': 'Dharma Bakti',
    },
    {
      'date': '13 Desember',
      'title': 'Hari Nusantara',
      'location': 'Dharma Bakti',
    },
    {
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
                  margin:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: ListTile(
                    leading: Container(
                      width: 50,
                      height: 50,

                      color: Colors.grey[300], // Placeholder untuk gambar
                    ),
                    title: Text(
                      event['date']!,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(event['title']!),
                    trailing: TextButton(
                      onPressed: () {
                        // Tambahkan navigasi atau fungsi "Baca Selengkapnya"
                      },
                      child: const Text(
                        'BACA SELENGKAPNYA',
                        style: TextStyle(color: Colors.brown),
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
