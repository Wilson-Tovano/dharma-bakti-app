import 'package:flutter/material.dart';
import 'package:dharma_bakti_app/pages/payment/payment_confirmation.dart';
import 'package:dharma_bakti_app/widgets/app_bar_custom.dart';
import 'package:dharma_bakti_app/constants/global_constants.dart';

class PaymentAmountScreen extends StatefulWidget {
  @override
  _PaymentAmountScreenState createState() => _PaymentAmountScreenState();
}

class _PaymentAmountScreenState extends State<PaymentAmountScreen> {
  bool hasDebt = true; // Dummy data: Ada tunggakan
  bool paySchoolFee = false;
  int debtAmount = 1200000;
  int schoolFeeMonths = 1;
  int monthlyFee = 200000;

  @override
  Widget build(BuildContext context) {
    int totalPayment = hasDebt
        ? debtAmount
        : (paySchoolFee ? schoolFeeMonths * monthlyFee : 0);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        toolbarHeight: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AppBarCustomBack(),
          Text(
            "Pilihan Pembayaran",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          RadioListTile(
            title: Text("Tunggakan"),
            subtitle: Text("Periode Tunggakan: 3 Bulan\nBiaya: Rp $debtAmount"),
            value: true,
            groupValue: hasDebt,
            onChanged: (value) {
              setState(() {
                hasDebt = value!;
                paySchoolFee = false;
              });
            },
          ),
          RadioListTile(
            title: Text("Uang Sekolah"),
            subtitle: Row(
              children: [
                Text("Bulan: "),
                DropdownButton<int>(
                  value: schoolFeeMonths,
                  items: List.generate(
                      12,
                      (index) => DropdownMenuItem(
                            value: index + 1,
                            child: Text("${index + 1} Bulan"),
                          )),
                  onChanged: hasDebt
                      ? null
                      : (value) {
                          setState(() {
                            schoolFeeMonths = value!;
                          });
                        },
                ),
              ],
            ),
            value: false,
            groupValue: hasDebt,
            onChanged: (value) {
              setState(() {
                hasDebt = false;
                paySchoolFee = value!;
              });
            },
          ),
          Spacer(),
          Text("Total Pembayaran: Rp $totalPayment"),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => PaymentConfirmationScreen()),
              );
            },
            child: Text("Lanjut"),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.brown[300]),
          ),
        ],
      ),
    );
  }
}
