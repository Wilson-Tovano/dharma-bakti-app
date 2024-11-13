import 'package:dharma_bakti_app/constants/global_constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppBarCustom extends StatelessWidget {
  const AppBarCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25))),
      child: Column(children: [
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Dharma Bakti",
              style: GoogleFonts.poppins(
                  color: AppColors.labelTextColor,
                  fontWeight: FontWeight.w900,
                  fontSize: 25),
            ),
            const SizedBox(
              width: 10,
            ),
            Image.asset(
              'assets/images/db_logo.png',
              width: 40,
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Halo,',
                    style: GoogleFonts.poppins(
                        color: AppColors.labelTextColor,
                        fontSize: 10,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'DELVIN DWIANTONO',
                    style: GoogleFonts.poppins(
                        color: AppColors.labelTextColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.notifications,
                  color: Colors.white,
                ))
          ],
        ),
      ]),
    );
  }
}

class AppBarCustomBack extends StatelessWidget {
  const AppBarCustomBack({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25))),
      child: Column(children: [
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Dharma Bakti",
              style: GoogleFonts.poppins(
                  color: AppColors.labelTextColor,
                  fontWeight: FontWeight.w900,
                  fontSize: 25),
            ),
            const SizedBox(
              width: 10,
            ),
            Image.asset(
              'assets/images/db_logo.png',
              width: 40,
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '< BACK',
                    style: GoogleFonts.poppins(
                        color: AppColors.labelTextColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.notifications,
                  color: Colors.white,
                ))
          ],
        ),
      ]),
    );
  }
}
