import 'package:dharma_bakti_app/services/awesome_notif.dart';
import 'package:flutter/material.dart';
import 'package:dharma_bakti_app/pages/payment/payment_methods.dart';
import 'package:dharma_bakti_app/pages/payment/payment_discount.dart';
import 'package:dharma_bakti_app/widgets/app_bar_custom.dart';
import 'package:dharma_bakti_app/constants/global_constants.dart';
import 'package:google_fonts/google_fonts.dart';

class PaymentConfirmationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MyNotification _notify = MyNotification(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        toolbarHeight: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const AppBarCustomBack(),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center,

              children: [
                Container(
                  width: 330,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.thirdColor,
                  ),
                  child: ListTile(
                    title: Text(
                      "Metode Pembayaran",
                      style: GoogleFonts.poppins(
                          color: AppColors.labelTextColor,
                          fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text("BCA",
                        style: GoogleFonts.poppins(
                            color: AppColors.labelTextColor,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic)),
                    trailing: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PaymentMethodsScreen()),
                        );
                      },
                      child: Text("Ganti"),
                    ),
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
                      "Detail Pembayaran",
                      style: GoogleFonts.poppins(
                          color: AppColors.labelTextColor,
                          fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      "Total Harga: Rp 1.200.000\nPromo/Voucher: Tidak ada\nBiaya Layanan: Tidak ada",
                      style: GoogleFonts.poppins(
                        color: AppColors.labelTextColor,
                      ),
                    ),
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
                      "Promosi",
                      style: GoogleFonts.poppins(
                          color: AppColors.labelTextColor,
                          fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      "Kamu tidak memakai promo",
                      style: GoogleFonts.poppins(
                        color: AppColors.labelTextColor,
                      ),
                    ),
                    trailing: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PaymentDiscountScreen()),
                        );
                      },
                      child: Text("Pilih"),
                    ),
                  ),
                ),
                // Spacer(),
                const SizedBox(
                  height: 200,
                ),
                Container(
                  width: 290,
                  child: ElevatedButton(
                    onPressed: () {
                      _notify.createBasicNotification();
                      // Simulasi pembayaran berhasil
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text("Pembayaran Berhasil"),
                          content: Text("Terima kasih atas pembayaran Anda."),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                  Navigator.pop(context);
                                },
                                child: Text("Tutup")),
                          ],
                        ),
                      );
                    },
                    child: Text("Konfirmasi",
                        style: GoogleFonts.poppins(color: Colors.white)),
                    style: ButtonStyle(
                        elevation: const WidgetStatePropertyAll(0),
                        backgroundColor: WidgetStateProperty.all<Color>(
                            AppColors.labelTextColor)),
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
