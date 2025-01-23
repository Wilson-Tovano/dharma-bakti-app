import 'package:dharma_bakti_app/constants/global_constants.dart';
import 'package:dharma_bakti_app/globals/user_info.dart';
import 'package:dharma_bakti_app/pages/attendance_screens/absence_initial_succeed.dart';
import 'package:dharma_bakti_app/services/firestore_service.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:io';

class ConfirmPhotoScreen extends StatelessWidget {
  FirestoreDbService dbService = FirestoreDbService();
  final String imagePath;
  final String currentTime;

  ConfirmPhotoScreen({required this.imagePath, required this.currentTime});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:
            const EdgeInsets.only(top: 50, left: 30, right: 30, bottom: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              textAlign: TextAlign.center,
              currentTime,
              style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                fontWeight: FontWeight.w900,
                color: AppColors.labelTextColor,
                fontSize: 40,
              )),
            ),
            // Instruction Text
            Text(
              "Konfirmasi Foto",
              style: GoogleFonts.poppins(),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.file(File(imagePath)),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      if (signedInSchool) {
                        signOutTimeToday = currentTime;

                        dbService.postAttendance(
                          studentNameFromFirestore,
                          studentEmailFromFirestore,
                          signInTimeToday,
                          signOutTimeToday,
                        );

                        //delete signedInTime and signOutTime dan reset status Signed
                        signOutTimeToday = "";
                        signInTimeToday = "";

                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) =>
                                const AbsenceSucceedPage(flag: "absen keluar"),
                          ),
                        );
                      } else {
                        signInTimeToday = currentTime;

                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) =>
                                const AbsenceSucceedPage(flag: "absen masuk"),
                          ),
                        );
                      }

                      signedInSchool = !signedInSchool;
                    },
                    style: ButtonStyle(
                        elevation: const WidgetStatePropertyAll(0),
                        backgroundColor: WidgetStateProperty.all<Color>(
                            AppColors.labelTextColor)),
                    child: Text(
                      'ABSEN SEKARANG',
                      style: GoogleFonts.overpass(
                          textStyle: const TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.bold)),
                    )),
                const SizedBox(
                  width: 30,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ButtonStyle(
                      elevation: const WidgetStatePropertyAll(0),
                      backgroundColor:
                          WidgetStateProperty.all<Color>(AppColors.thirdColor)),
                  child: Text(
                    'ULANGI FOTO',
                    style: GoogleFonts.overpass(
                      textStyle: TextStyle(
                          color: AppColors.labelTextColor,
                          fontSize: 10,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
