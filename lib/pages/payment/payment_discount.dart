import 'package:flutter/material.dart';
import 'package:dharma_bakti_app/widgets/app_bar_custom.dart';
import 'package:dharma_bakti_app/constants/global_constants.dart';
import 'package:google_fonts/google_fonts.dart';

class PaymentDiscountScreen extends StatelessWidget {
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
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Container(
                  width: 330,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.thirdColor,
                  ),
                  child: Column(
                    children: [
                      Text(
                        "Kode Referal",
                        style: GoogleFonts.poppins(
                            color: AppColors.labelTextColor,
                            fontWeight: FontWeight.bold),
                      ),
                      TextField(
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(10),
                            labelText: "Kode Promosi",
                            hintText: "Masukkan kode promo",
                            border: OutlineInputBorder()),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  width: 330,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.thirdColor,
                  ),
                  child: ListTile(
                    title: Text(
                      "Diskon Pembayaran",
                      style: GoogleFonts.poppins(
                        color: AppColors.labelTextColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                        "Pembayaran 6 bulan (Diskon 5%)\nPembayaran 1 tahun (Diskon 10%)"),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: 330,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.thirdColor,
                  ),
                  child: ListTile(
                    title: Text(
                      "Jalur Prestasi",
                      style: GoogleFonts.poppins(
                          color: AppColors.labelTextColor,
                          fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text("Unggah dokumen prestasi"),
                    trailing: Icon(Icons.upload_file),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
