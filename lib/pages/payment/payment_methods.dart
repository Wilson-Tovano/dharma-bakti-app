import 'package:dharma_bakti_app/pages/payment/payment_qris.dart';
import 'package:flutter/material.dart';
import 'package:dharma_bakti_app/widgets/app_bar_custom.dart';
import 'package:dharma_bakti_app/constants/global_constants.dart';
import 'package:google_fonts/google_fonts.dart';

class PaymentMethodsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        toolbarHeight: 0,
      ),
      body: ListView(
        children: [
          const AppBarCustomBack(),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Container(
              width: 330,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.thirdColor,
              ),
              child: Column(
                children: [
                  ListTile(
                      title: Text(
                        "BCA",
                        style: GoogleFonts.poppins(
                            color: AppColors.labelTextColor,
                            fontWeight: FontWeight.bold),
                      ),
                      trailing: Text("Dipakai")),
                  ListTile(
                    title: Text(
                      "QRIS",
                      style: GoogleFonts.poppins(
                          color: AppColors.labelTextColor,
                          fontWeight: FontWeight.bold),
                    ),
                    trailing: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => QRISPaymentScreen()),
                        );
                      },
                      child: Text("Pilih"),
                    ),
                  ),
                  ListTile(
                    title: Text(
                      "Kredit",
                      style: GoogleFonts.poppins(
                          color: AppColors.labelTextColor,
                          fontWeight: FontWeight.bold),
                    ),
                    trailing: TextButton(
                      onPressed: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //       builder: (context) => QRISPaymentScreen()),
                        // );
                      },
                      child: Text("Pilih"),
                    ),
                  ),
                  ListTile(
                    title: Text(
                      "Mandiri",
                      style: GoogleFonts.poppins(
                          color: AppColors.labelTextColor,
                          fontWeight: FontWeight.bold),
                    ),
                    trailing: TextButton(
                      onPressed: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //       builder: (context) => QRISPaymentScreen()),
                        // );
                      },
                      child: Text("Pilih"),
                    ),
                  ),
                  ListTile(
                    title: Text(
                      "BRI",
                      style: GoogleFonts.poppins(
                          color: AppColors.labelTextColor,
                          fontWeight: FontWeight.bold),
                    ),
                    trailing: TextButton(
                      onPressed: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //       builder: (context) => QRISPaymentScreen()),
                        // );
                      },
                      child: Text("Pilih"),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
