import 'package:intl/intl.dart';

String studentNameFromFirestore = "";
String studentEmailFromFirestore = "";

bool signedInSchool = false;
String signInTimeToday = "";
String signOutTimeToday = "";

int tunggakan = 1200000;
String tunggakanDisplay =
    NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ', decimalDigits: 0)
        .format(tunggakan);

int totalPayment = 0;
