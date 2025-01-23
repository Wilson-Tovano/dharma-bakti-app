import 'package:dharma_bakti_app/constants/global_constants.dart';
import 'package:dharma_bakti_app/pages/attendance_screens/X-absence.dart';
import 'package:dharma_bakti_app/pages/attendance_screens/attendance_main.dart';
import 'package:dharma_bakti_app/pages/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AbsenceSucceedPage extends StatelessWidget {
  const AbsenceSucceedPage({super.key, required this.flag});

  final String flag;

  @override
  Widget build(BuildContext context) {
    String displayText = flag == 'absen masuk'
        ? 'Absen Masuk Berhasil!'
        : 'Absen Keluar Berhasil!';
    String buttonText = 'Kembali ke Dashboard';
    Widget nextPage = Dashboard();

    return Scaffold(
        // appBar: AppBar(
        //   leading: Container(
        //     decoration: BoxDecoration(
        //       border: Border.all(color: Colors.grey.withOpacity(0.4)),
        //       borderRadius: BorderRadius.circular(20),
        //     ),
        //     child: IconButton(
        //       onPressed: (){
        //         Navigator.of(context).pop();
        //       },
        //       icon: const Icon(
        //           Icons.arrow_back_ios_new,
        //           size: 15,
        //         ),
        //       ),
        //   ),
        // ),
        body: Center(
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/splash.png'), fit: BoxFit.cover),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.check_circle,
                size: 350, color: AppColors.primaryColor),
            Text(
              displayText,
              style: GoogleFonts.poppins(
                fontSize: 23,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: SizedBox(
                height: 50,
                width: 1000,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => nextPage));
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryColor,
                        foregroundColor: Colors.white,
                        elevation: 0,
                        shadowColor: Colors.transparent),
                    child: Text(
                      buttonText,
                      style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
                    )),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
