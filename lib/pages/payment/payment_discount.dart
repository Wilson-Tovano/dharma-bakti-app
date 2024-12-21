import 'package:flutter/material.dart';
import 'package:dharma_bakti_app/widgets/app_bar_custom.dart';
import 'package:dharma_bakti_app/constants/global_constants.dart';

class PaymentDiscountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        toolbarHeight: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const AppBarCustomBack(),
            TextField(
              decoration: InputDecoration(
                  labelText: "Kode Promosi",
                  hintText: "Masukkan kode promo",
                  border: OutlineInputBorder()),
            ),
            SizedBox(height: 16),
            ListTile(
              title: Text("Diskon Pembayaran"),
              subtitle: Text(
                  "Pembayaran 6 bulan (Diskon 5%)\nPembayaran 1 tahun (Diskon 10%)"),
            ),
            ListTile(
              title: Text("Jalur Prestasi"),
              subtitle: Text("Upload dokumen prestasi"),
              trailing: Icon(Icons.upload_file),
            ),
          ],
        ),
      ),
    );
  }
}
