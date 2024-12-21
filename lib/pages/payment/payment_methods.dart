import 'package:dharma_bakti_app/pages/payment/payment_qris.dart';
import 'package:flutter/material.dart';
import 'package:dharma_bakti_app/widgets/app_bar_custom.dart';
import 'package:dharma_bakti_app/constants/global_constants.dart';

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
          ListTile(title: Text("BCA"), trailing: Text("Dipakai")),
          ListTile(
            title: Text("QRIS"),
            trailing: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => QRISPaymentScreen()),
                );
              },
              child: Text("Pilih"),
            ),
          ),
          ListTile(title: Text("Kredit"), trailing: Text("Pilih")),
          ListTile(title: Text("Mandiri"), trailing: Text("Pilih")),
          ListTile(title: Text("BRI"), trailing: Text("Pilih")),
        ],
      ),
    );
  }
}
