import 'package:dharma_bakti_app/globals/user_info.dart';
import 'package:flutter/material.dart';
import 'package:dharma_bakti_app/pages/payment/payment_confirmation.dart';
import 'package:dharma_bakti_app/widgets/app_bar_custom.dart';
import 'package:dharma_bakti_app/constants/global_constants.dart';
import 'package:google_fonts/google_fonts.dart';

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
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const AppBarCustomBack(),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: Column(
              children: [
                Container(
                  width: 330,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.thirdColor,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Pilihan Pembayaran",
                      style: GoogleFonts.poppins(
                          color: AppColors.labelTextColor,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: 350,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color.fromRGBO(255, 233, 207, 1),
                  ),
                  child: RadioListTile(
                    title: Text(
                      "Tunggakan",
                      style: GoogleFonts.poppins(
                          color: AppColors.labelTextColor,
                          fontWeight: FontWeight.bold),
                    ),
                    subtitle: Row(
                      children: [
                        Text(
                          "Periode Tunggakan: 3 Bulan\nBiaya: $tunggakanDisplay",
                          style: GoogleFonts.poppins(
                              color: AppColors.labelTextColor),
                        ),
                      ],
                    ),
                    value: true,
                    groupValue: hasDebt,
                    // tileColor: AppColors.thirdColor,
                    activeColor: AppColors.labelTextColor,
                    onChanged: (value) {
                      setState(() {
                        hasDebt = value!;
                        paySchoolFee = false;
                      });
                    },
                  ),
                ),

                const SizedBox(
                  height: 20,
                ),

                Container(
                  width: 350,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColors.thirdColor,
                  ),
                  child: RadioListTile(
                    title: Text(
                      "Uang Sekolah",
                      style: GoogleFonts.poppins(
                          color: AppColors.labelTextColor,
                          fontWeight: FontWeight.bold),
                    ),
                    subtitle: Row(
                      children: [
                        Text(
                          "Bulan: ",
                          style: GoogleFonts.poppins(
                            color: AppColors.labelTextColor,
                          ),
                        ),
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
                ),
                // Spacer(),
                const SizedBox(
                  height: 200,
                ),

                Container(
                  width: 330,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.thirdColor,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Total Pembayaran: Rp $totalPayment",
                      style: GoogleFonts.poppins(
                          color: AppColors.labelTextColor,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  width: 290,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PaymentConfirmationScreen()),
                      );
                    },
                    child: Text(
                      "Lanjut",
                      style: GoogleFonts.poppins(color: Colors.white),
                    ),
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
