// ignore_for_file: prefer_const_constructors, unused_element

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:money_share_app/views/show_moneyshare_ui.dart';

class InputUI extends StatefulWidget {
  const InputUI({super.key});

  @override
  State<InputUI> createState() => _InputUIState();
}

class _InputUIState extends State<InputUI> {
  TextEditingController moneyCtrl = TextEditingController(text: '');
  TextEditingController personCtrl = TextEditingController(text: '');
  TextEditingController tipCtrl = TextEditingController(text: '');
  bool tipCheck = false;

  _showWarningDialog(context, msg) async {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Container(
            color: Color.fromARGB(255, 224, 79, 95),
            padding: EdgeInsets.only(
              top: 10.0,
              bottom: 10.0,
            ),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                'คำเตือน',
                style: GoogleFonts.anuphan(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          content: Text(
            msg,
            textAlign: TextAlign.center,
            style: GoogleFonts.anuphan(
              color: Color.fromARGB(255, 224, 79, 95),
              fontSize: MediaQuery.of(context).size.width * 0.05,
            ),
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 224, 79, 95),
                  ),
                  child: Text(
                    'ตกลง',
                    style: GoogleFonts.anuphan(),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
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
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Image.asset(
                  'assets/images/money.png',
                  width: MediaQuery.of(context).size.width * 0.65,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.1,
                    right: MediaQuery.of(context).size.width * 0.1,
                  ),
                  child: TextField(
                    controller: moneyCtrl,
                    style: GoogleFonts.anuphan(color: Colors.black),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color.fromARGB(106, 0, 0, 0))),
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color.fromARGB(106, 0, 0, 0))),
                      hintText: 'ป้อนจำนวนเงิน (บาท)',
                      hintStyle: GoogleFonts.anuphan(color: Colors.grey),
                      prefixIcon: Icon(
                        //icons.(flutter)
                        FontAwesomeIcons.moneyBill,
                        color: Colors.green,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.1,
                    right: MediaQuery.of(context).size.width * 0.1,
                  ),
                  child: TextField(
                    controller: personCtrl,
                    style: GoogleFonts.anuphan(color: Colors.black),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color.fromARGB(106, 0, 0, 0))),
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color.fromARGB(106, 0, 0, 0))),
                      hintText: 'จำนวนคน',
                      hintStyle: GoogleFonts.anuphan(color: Colors.grey),
                      prefixIcon: Icon(
                        //Icons.person,
                        FontAwesomeIcons.user,
                        color: Colors.green,
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Checkbox(
                      onChanged: (value) {
                        setState(() {
                          tipCheck = value!;
                          if (value == false) {
                            tipCtrl.text = '';
                          }
                        });
                      },
                      value: tipCheck,
                      side: BorderSide(color: Colors.green),
                      checkColor: Colors.green,
                      activeColor: Color.fromARGB(106, 0, 190, 102),
                    ),
                    Text(
                      'เงินทิป (บาท)',
                      style: GoogleFonts.anuphan(
                          fontSize: MediaQuery.of(context).size.width * 0.045),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.1,
                    right: MediaQuery.of(context).size.width * 0.1,
                  ),
                  child: TextField(
                    enabled: tipCheck,
                    controller: tipCtrl,
                    style: GoogleFonts.anuphan(color: Colors.black),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color.fromARGB(106, 0, 0, 0))),
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color.fromARGB(106, 0, 0, 0))),
                      hintText: 'จำนวนเงินทิป (บาท)',
                      hintStyle: GoogleFonts.anuphan(color: Colors.grey),
                      prefixIcon: Icon(
                        //Icons.person,
                        FontAwesomeIcons.bangladeshiTakaSign,
                        color: Colors.green,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {
                        if (moneyCtrl.text.isEmpty == true) {
                          _showWarningDialog(context, 'ป้อนจำนวนเงินด้วย');
                        } else if (personCtrl.text.isEmpty == true) {
                          _showWarningDialog(context, 'ป้อนจำนวนคนด้วย');
                        } else if (tipCheck == true) {
                          if (tipCtrl.text.isEmpty == true) {
                            _showWarningDialog(context, 'ป้อนจำนวนเงินทิปด้วย');
                          } else {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ShowUI(
                                  money: moneyCtrl.text,
                                  person: personCtrl.text,
                                  tip: tipCtrl.text,
                                ),
                              ),
                            );
                          }
                        } else {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ShowUI(
                                money: moneyCtrl.text,
                                  person: personCtrl.text,
                                  tip: "0",
                              ),
                            ),
                          );
                        }
                      },
                      icon: Icon(Icons.calculate),
                      label: Text(
                        "คำนวณ",
                        style: GoogleFonts.anuphan(),
                      ),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          fixedSize: Size(MediaQuery.of(context).size.width * 0.3,
                              MediaQuery.of(context).size.height * 0.04)),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.05,
                    ),
                    ElevatedButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.cancel),
                      label: Text(
                        "ยกเลิก",
                        style: GoogleFonts.anuphan(),
                      ),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          fixedSize: Size(MediaQuery.of(context).size.width * 0.3,
                              MediaQuery.of(context).size.height * 0.04)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
