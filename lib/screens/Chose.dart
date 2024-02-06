import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ftc_calculation_of_points/dat.dart';
import 'package:ftc_calculation_of_points/screens/Calc2.dart';
import 'package:ftc_calculation_of_points/screens/Calc3.dart';
import 'package:ftc_calculation_of_points/dat.dart';
import 'Calc.dart';
import 'package:ftc_calculation_of_points/Score.dart';

class Chs extends StatefulWidget {
  const Chs({Key? key, required this.is_blue_alliance, required this.id_q});

  final bool is_blue_alliance;
  final int id_q;


  @override
  State<Chs> createState() => _ChsState();
}

class _ChsState extends State<Chs> {
  List AUTONOMUS_ALL = [0,0,0,0,0,0];
  List DRIVE_ALL = [0,0,0,0,0,0];
  List ENDGAME_ALL = [0,0,0,0,0,0];


  Future show_auto() async {
    var data = await Data_point().readData(1);
    setState(() {
      AUTONOMUS_ALL = data.isNotEmpty
          ? [
              data['auto'],
              data['backdropAuto'],
              data['backstageAuto'],
              data['navigationAuto'],
              data['randomizationAuto']
            ]
          : [];
    });

  }

  Future show_drive() async {
    var data = await Data_point().readData(1);
    setState(() {
      DRIVE_ALL = data.isNotEmpty
          ? [
              data['driverControlled'],
              data['backdropDrive'],
              data['backstageDrive'],
              data['mosaicDrive'],
              data['setBonusDrive']
            ]
          : [];
    });

  }

  Future show_end() async {
    var data = await Data_point().readData(1);
    setState(() {
      ENDGAME_ALL = data.isNotEmpty
          ? [
        data['endGame'],
        data['hang'],
        data['parking'],
        data['dronepoints']
      ]
          : [];
    });

  }

  bool isLoading = true;
  bool isLoading1 = true;
  bool isLoading2 = true;

  @override
  void initState() {
    super.initState();

    show_end().then((_) {
      setState(() {
        isLoading2 = false;
      });
    });

    show_drive().then((_) {
      setState(() {
        isLoading1 = false;
      });
    });

    show_auto().then((_) {
      setState(() {
        isLoading = false;
      });
    });

  }

  CalcState auto = CalcState();

  final Text_style =
      TextStyle(fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold);
  final Text_style_point = TextStyle(fontSize: 18, color: Colors.black);
  final Text_style_point2 =
      TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FTC "),
        //automaticallyImplyLeading: false,
        backgroundColor: widget.is_blue_alliance ? Colors.blue : Colors.red,
      ),
      body: ListView(
        children: [
          Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                    color: widget.is_blue_alliance
                        ? Color(0xFF0066b3)
                        : Color(0xFFed1c24),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.black, width: 3)),
                height: 300,
                width: 400,
                child: Column(
                  children: [
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "#TEAM CODE ",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 32),
                    ),
                    Align(
                      alignment: Alignment.center,
                      // This aligns the child Container in the center.
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 15.0,
                          right: 15.0,
                          top: 10,
                        ),
                        // This adds space around the inner Container.
                        child: Container(
                          decoration: BoxDecoration(
                              color: Color(0xFF7A7A7A),
                              borderRadius: BorderRadius.circular(10),
                              // Optional: to round corners of inner container.
                              border:
                                  Border.all(color: Colors.black, width: 3)),
                          width: 400,
                          height: 200,
                          child: Padding(
                            padding: const EdgeInsets.only(
                              top: 15,
                              left: 10,
                            ),
                            child: Column(
                              children: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Calc(is_blue_alliance: widget.is_blue_alliance),
                                      ),
                                    ).then((value) {
                                      if (value == true) {
                                        // Обновите состояние в Chs с помощью setState и обработанных данных
                                        setState(() {
                                          show_auto();
                                          show_drive();
                                          show_end();

                                          print('EXIT1');


                                        });
                                      }
                                    });

                                  },
                                  child: Row_cl("AUTONOMOUS", AUTONOMUS_ALL[0]),
                                ),
                                SizedBox(
                                  height: 0,
                                ),
                                TextButton(
                                  onPressed: () {

                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Calc2(is_blue_alliance: widget.is_blue_alliance),
                                      ),
                                    ).then((value) {
                                      if (value == true) {
                                        // Обновите состояние в Chs с помощью setState и обработанных данных
                                        setState(() {
                                          show_auto();
                                          show_drive();
                                          show_end();

                                          print('EXIT2');


                                        });
                                      }
                                    });


                                    //
                                    // Navigator.push(
                                    //   context,
                                    //   MaterialPageRoute(
                                    //     builder: (context) => Calc2(
                                    //       is_blue_alliance:
                                    //           widget.is_blue_alliance,
                                    //     ),
                                    //   ),
                                    // );
                                  },
                                  child: Row_cl("DRIVER-CONTROL", DRIVE_ALL[0]),
                                ),
                                SizedBox(
                                  height: 0,
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Calc3(is_blue_alliance: widget.is_blue_alliance),
                                      ),
                                    ).then((value) {
                                      if (value == true) {
                                        // Обновите состояние в Chs с помощью setState и обработанных данных
                                        setState(() {
                                          show_auto();
                                          show_drive();
                                          show_end();

                                          print('EXIT3');


                                        });
                                      }
                                    });


                                    // Navigator.push(
                                    //   context,
                                    //   MaterialPageRoute(
                                    //     builder: (context) => Calc3(
                                    //       is_blue_alliance:
                                    //           widget.is_blue_alliance,
                                    //     ),
                                    //   ),
                                    // );
                                  },
                                  child: Row_cl("END GAME", ENDGAME_ALL[0]),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 10,
            ),
            child: Text("Score Breakdown",
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.black,
                    fontWeight: FontWeight.bold)),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.black, width: 3)),
              height: 600,
              width: 400,
              child: Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Column(
                  children: [
                    Row_AMG2("AUTONOMOUS", AUTONOMUS_ALL[0]),
                    Divider(color: Colors.black, thickness: 1),
                    Row_AMG("Backdrop Points", AUTONOMUS_ALL[1]),
                    Divider(),
                    Row_AMG("Backstage Points	", AUTONOMUS_ALL[2]),
                    Divider(),
                    Row_AMG("Navigation Points", AUTONOMUS_ALL[3]),
                    Divider(),
                    Row_AMG("Randomization", AUTONOMUS_ALL[4]),
                    Divider(color: Colors.black, thickness: 1),
                    Row_AMG2("DRIVER-CONTROL", DRIVE_ALL[0]),
                    Divider(color: Colors.black, thickness: 1),
                    Row_AMG("Backdrop Points", DRIVE_ALL[1]),
                    Divider(),
                    Row_AMG("Backstage Points", DRIVE_ALL[2]),
                    Divider(),
                    Row_AMG("Mosaic Points", DRIVE_ALL[3]),
                    Divider(),
                    Row_AMG("Set Bonus Points", DRIVE_ALL[4]),
                    Divider(color: Colors.black, thickness: 1),
                    Row_AMG2("END GAME", ENDGAME_ALL[0]),
                    Divider(color: Colors.black, thickness: 1),
                    Row_AMG("Location", ENDGAME_ALL[1] + ENDGAME_ALL[2]),
                    Divider(),
                    Row_AMG("Drone Points", ENDGAME_ALL[3]),
                    Divider(color: Colors.black, thickness: 1),
                    Row_AMG2("Total", AUTONOMUS_ALL[0] + DRIVE_ALL[0] + ENDGAME_ALL[0]),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget Row_cl(String name, int point) {
    return Row(
      children: [
        Column(
          children: [
            Text(
              '$point',
              style: Text_style,
            ),
          ],
        ),
        SizedBox(
          width: 20,
        ),
        Column(
          children: [
            Text(
              '$name',
              style: Text_style,
            ),
          ],
        ),
      ],
    );
  }

  Widget Row_AMG(String name, int point) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            Text(
              '$name',
              style: Text_style_point,
            ),
          ],
        ),
        SizedBox(
          width: 20,
        ),
        Column(
          children: [
            Text(
              '$point',
              style: Text_style_point,
            ),
          ],
        ),
      ],
    );
  }

  Widget Row_AMG2(String name, int point) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            Text(
              '$name',
              style: Text_style_point2,
            ),
          ],
        ),
        SizedBox(
          width: 20,
        ),
        Column(
          children: [
            Text(
              '$point',
              style: Text_style_point2,
            ),
          ],
        ),
      ],
    );
  }
}
