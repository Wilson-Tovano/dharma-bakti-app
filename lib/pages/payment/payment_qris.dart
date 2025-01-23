import 'package:flutter/material.dart';
import 'package:dharma_bakti_app/widgets/app_bar_custom.dart';
import 'package:dharma_bakti_app/constants/global_constants.dart';
import 'package:google_fonts/google_fonts.dart';

class QRISPaymentScreen extends StatelessWidget {
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
            padding: const EdgeInsets.all(10.0),
            child: Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 242, 217, 194),
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      "Scan Qris",
                      style: GoogleFonts.poppins(
                        color: AppColors.labelTextColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "Shopee Pay, OVO, DANA, Gopay, LinkAja, dan transfer bank via Qris",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        color: AppColors.labelTextColor,
                      ),
                    ),
                    SizedBox(height: 16),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 1),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Image.network(
                        "https://www.dpc-datenschutz.de/wp-content/uploads/2022/01/QR-Codes-als-datenschutzkonformere-Variante-scaled-e1643188139217-300x256.jpg", // Ganti dengan gambar QR Code Anda
                        height: 200,
                        width: 200,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(height: 30),
                    ElevatedButton(
                      onPressed: () {
                        // Tambahkan logika untuk mengunduh QR Code
                      },
                      child: Text(
                        "Unduh QR Code",
                        style: GoogleFonts.poppins(
                          color: AppColors.labelTextColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: AppColors.thirdColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                    SizedBox(height: 40),

                    // Spacer(),
                    Text(
                      "Pembayaran Sebelum",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 4),
                    Text(
                      "17:53",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Agar Pembayaran Kamu Tidak Expired",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
