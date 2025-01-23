import 'dart:async';
import 'package:camera/camera.dart';
import 'package:dharma_bakti_app/constants/global_constants.dart';
import 'package:dharma_bakti_app/globals/user_info.dart';
import 'package:dharma_bakti_app/widgets/cameras/camera_screen.dart';
import 'package:dharma_bakti_app/widgets/app_bar_custom.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:dharma_bakti_app/services/firestore_service.dart';

class AttendanceMainScreen extends StatefulWidget {
  final List<CameraDescription> cameras;
  const AttendanceMainScreen({super.key, required this.cameras});

  static String _getCurrentTime() {
    return DateFormat('HH:mm:ss').format(DateTime.now());
  }

  @override
  State<AttendanceMainScreen> createState() => _AttendanceMainScreenState();
}

class _AttendanceMainScreenState extends State<AttendanceMainScreen> {
  //Variabel untuk menarik data dari Firestore
  FirestoreDbService fsService = FirestoreDbService();
  List<Map<String, dynamic>>? attendance = [];

  // Variabel untuk memperbarui waktu saaat ini secara real-time
  String _currentTime = AttendanceMainScreen._getCurrentTime();
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    // Untuk memperbarui waktu saat ini secara real-time
    _timer = Timer.periodic(const Duration(seconds: 1), (Timer t) {
      if (mounted) {
        setState(() {
          _currentTime = AttendanceMainScreen._getCurrentTime();
        });
      }
    });
    fsService
        .getAttendance(studentNameFromFirestore, studentEmailFromFirestore)
        .then((data) {
      setState(() {
        attendance = data;
      });
    });
  }

  // Cancel the timer to avoid calling setState after dispose
  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        toolbarHeight: 0,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const AppBarCustomBack(),
              const SizedBox(height: 20),
              Text(
                textAlign: TextAlign.center,
                _currentTime,
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                    fontWeight: FontWeight.w900,
                    color: AppColors.labelTextColor,
                    fontSize: 40,
                  ),
                ),
              ),

              // Tombol untuk ABSEN MASUK
              signedInSchool
                  ? Container()
                  : ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  CameraScreen(cameras: widget.cameras),
                            ));
                      },
                      style: ButtonStyle(
                        elevation: const WidgetStatePropertyAll(0),
                        backgroundColor: WidgetStateProperty.all<Color>(
                            AppColors.labelTextColor),
                      ),
                      child: Text(
                        'ABSEN MASUK',
                        style: GoogleFonts.overpass(
                          textStyle: const TextStyle(
                              color: AppColors.thirdColor,
                              fontSize: 10,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),

              // Tombol untuk ABSENSI PULANG
              !signedInSchool
                  ? Container()
                  : ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  CameraScreen(cameras: widget.cameras),
                            ));
                      },
                      style: ButtonStyle(
                        elevation: const WidgetStatePropertyAll(0),
                        backgroundColor: WidgetStateProperty.all<Color>(
                            AppColors.thirdColor),
                      ),
                      child: Text(
                        'ABSEN PULANG',
                        style: GoogleFonts.overpass(
                          textStyle: const TextStyle(
                              color: AppColors.labelTextColor,
                              fontSize: 10,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Riwayat",
                      style: GoogleFonts.overpass(
                        textStyle: const TextStyle(
                            color: AppColors.labelTextColor,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        ">",
                        style: GoogleFonts.overpass(
                          textStyle: const TextStyle(
                              color: AppColors.labelTextColor,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),

                    //Listview untuk ambil data absensi dari firestore
                  ],
                ),
              ),

              attendance == null || attendance!.isEmpty
                  ? const Center(child: Text("Belum ada data absensi"))
                  : Column(
                      // Generate the list of attendance records
                      children: List.generate(attendance!.length, (index) {
                        var item = attendance![index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: AppColors.thirdColor,
                            ),
                            child: Column(
                              children: [
                                const Row(
                                  children: [
                                    Icon(Icons.check_circle,
                                        size: 30,
                                        color: AppColors.primaryColor),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                        "TANGGAL: ${item['date'] ?? 'Unknown'}"),
                                    Text(
                                      "Berhasil mengambil absen",
                                      style: GoogleFonts.overpass(
                                          fontWeight: FontWeight.w900,
                                          fontSize: 18,
                                          color: AppColors.labelTextColor),
                                    ),
                                    Text(
                                        "Waktu Hadir: ${item['signInTime'] ?? 'N/A'}"),
                                    Text(
                                        "Waktu Pulang: ${item['signOutTime'] ?? 'N/A'}"),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                    ),
              // Column(
              //   // Ini untuk menampilkan daftar absensi
              //   children: List.generate(2, (index) {
              //     return Padding(
              //       padding: const EdgeInsets.symmetric(horizontal: 20),
              //       child: Container(
              //         decoration: BoxDecoration(
              //           borderRadius: BorderRadius.circular(10),
              //           color: AppColors.thirdColor,
              //         ),
              //         child: Column(
              //           children: [
              //             const Row(
              //               children: [
              //                 Icon(Icons.check_circle,
              //                     size: 30, color: AppColors.primaryColor),
              //               ],
              //             ),
              //             const Column(
              //               children: [
              //                 Text("TANGGAL"),
              //                 Text("Berhasil mengambil absen")
              //               ],
              //             ),
              //             Text(
              //                 "Waktu Hadir: ${attendance.docs[index].signInTime}"),
              //             Text(
              //                 "Waktu Pulang: ${attendance.docs[index].signOutTime}"),
              //           ],
              //         ),
              //       ),
              //     );
              //   }),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
