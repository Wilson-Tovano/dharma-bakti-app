import 'package:flutter/material.dart';
import 'package:dharma_bakti_app/pages/payment/payment_methods.dart';
import 'package:dharma_bakti_app/pages/payment/payment_discount.dart';
import 'package:dharma_bakti_app/widgets/app_bar_custom.dart';
import 'package:dharma_bakti_app/constants/global_constants.dart';

class PaymentConfirmationScreen extends StatelessWidget {
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
          Expanded(
            child: ListTile(
              title: Text("Metode Pembayaran"),
              subtitle: Text("BCA"),
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
          ListTile(
            title: Text("Detail Pembayaran"),
            subtitle: Text(
                "Total Harga: Rp 1.200.000\nPromo/Voucher: Tidak ada\nBiaya Layanan: Tidak ada"),
          ),
          ListTile(
            title: Text("Promosi"),
            subtitle: Text("Kamu tidak memakai promo"),
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
          Spacer(),
          ElevatedButton(
            onPressed: () {
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
            child: Text("Konfirmasi"),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.brown[300]),
          ),
        ],
      ),
    );
  }
}
