// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class ShowUI extends StatefulWidget {
  String? money;
  String? person;
  String? tip;

  ShowUI({super.key, this.money, this.person, this.tip});

  @override
  State<ShowUI> createState() => _ShowUIState();
}

class _ShowUIState extends State<ShowUI> {
  var nf = NumberFormat('###,##0.00', "en_US");
  double? moneyshare = 0;
  @override
  void initState() {
    double money = double.parse(widget.money!);
    int person = int.parse(widget.person!);
    double tip = double.parse(widget.money!);
    moneyshare = (money + tip) / person;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 90, 245, 155),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(106, 0, 190, 102),
        title: Text(
          "แชร์เงินกันเถอะ",
          style: GoogleFonts.anuphan(
              fontSize: MediaQuery.of(context).size.width * 0.06),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(children: [
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.03,
            ),
            Image.asset(
              'assets/images/money.png',
              width: MediaQuery.of(context).size.width * 0.50,
            ),
            Text(
              "จำนวนเงินที่จะเเชร์กัน",
              style: GoogleFonts.anuphan(
                  fontSize: MediaQuery.of(context).size.width * 0.045,
                  color: Colors.green),
            ),
            Text(
              nf.format(double.parse(widget.money!)),
              style: GoogleFonts.anuphan(
                  fontSize: MediaQuery.of(context).size.width * 0.06,
                  color: Colors.white),
            ),
            Text(
              "บาท",
              style: GoogleFonts.anuphan(
                  fontSize: MediaQuery.of(context).size.width * 0.045,
                  color: Colors.green),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.03,
            ),
            Text(
              "จำนวนคนที่จะแชร์กัน",
              style: GoogleFonts.anuphan(
                  fontSize: MediaQuery.of(context).size.width * 0.045,
                  color: Colors.green),
            ),
            Text(
              widget.person!,
              style: GoogleFonts.anuphan(
                  fontSize: MediaQuery.of(context).size.width * 0.06,
                  color: Colors.white),
            ),
            Text(
              "คน",
              style: GoogleFonts.anuphan(
                  fontSize: MediaQuery.of(context).size.width * 0.045,
                  color: Colors.green),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.03,
            ),
            Text(
              "เงินทิป",
              style: GoogleFonts.anuphan(
                  fontSize: MediaQuery.of(context).size.width * 0.045,
                  color: Colors.green),
            ),
            Text(
              nf.format(double.parse(widget.tip!)),
              style: GoogleFonts.anuphan(
                  fontSize: MediaQuery.of(context).size.width * 0.06,
                  color: Colors.white),
            ),
            Text(
              "บาท",
              style: GoogleFonts.anuphan(
                  fontSize: MediaQuery.of(context).size.width * 0.045,
                  color: Colors.green),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.07,
            ), 
            Text(
              "แชร์เงินกันคนละ",
              style: GoogleFonts.anuphan(
                  fontSize: MediaQuery.of(context).size.width * 0.045,
                  color: Colors.green),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.7,
              height: MediaQuery.of(context).size.width * 0.15,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.green
              ),
              child: Center(
                child: Text(
                  nf.format(moneyshare),
                style: GoogleFonts.anuphan(
                    fontSize: MediaQuery.of(context).size.width * 0.06,
                    color: Colors.white),),
              ),
            ),
            Text(
              "บาท",
              style: GoogleFonts.anuphan(
                  fontSize: MediaQuery.of(context).size.width * 0.045,
                  color: Colors.green),
            )
          ]),
        ),
      ),
    );
  }
}
