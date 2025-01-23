import 'package:dharma_bakti_app/constants/global_constants.dart';
import 'package:dharma_bakti_app/widgets/app_bar_custom.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'dart:async';

class AbsencePage extends StatefulWidget {
  AbsencePage({super.key});

  static String _getCurrentTime() {
    return DateFormat('HH:mm:ss').format(DateTime.now());
  }

  @override
  State<AbsencePage> createState() => _AbsencePageState();
}

class _AbsencePageState extends State<AbsencePage> {
  late Timer _timer;
  String _currentTime = _getCurrentTime();

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 1), (Timer t) {
      setState(() {
        _currentTime = AbsencePage._getCurrentTime();
      });
    });
  }

  static String _getCurrentTime() {
    return DateFormat('HH:mm:ss').format(DateTime.now());
  }

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
            Text(
              textAlign: TextAlign.center,
              _currentTime,
              style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                fontWeight: FontWeight.w900,
                color: AppColors.labelTextColor,
                fontSize: 40,
              )),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ButtonStyle(
                    elevation: const WidgetStatePropertyAll(0),
                    backgroundColor: WidgetStateProperty.all<Color>(
                        AppColors.labelTextColor)),
                child: Text(
                  'ABSEN MASUK',
                  style: GoogleFonts.overpass(
                      textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.bold)),
                )),
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ButtonStyle(
                    elevation: const WidgetStatePropertyAll(0),
                    backgroundColor:
                        WidgetStateProperty.all<Color>(AppColors.thirdColor)),
                child: Text(
                  'ABSEN PULANG',
                  style: GoogleFonts.overpass(
                      textStyle: TextStyle(
                          color: AppColors.labelTextColor,
                          fontSize: 10,
                          fontWeight: FontWeight.bold)),
                )),
          ],
        ));
  }
}
