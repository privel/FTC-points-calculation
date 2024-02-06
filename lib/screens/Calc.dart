import 'package:flutter/material.dart';
import 'package:ftc_calculation_of_points/Score.dart';
import 'package:ftc_calculation_of_points/dat.dart';

class Calc extends StatefulWidget {
  const Calc({super.key, required this.is_blue_alliance});

  final bool is_blue_alliance;

  @override
  State<Calc> createState() => CalcState();
}

class CalcState extends State<Calc> {
  List AUTONOMUS_ALL = [0, 0, 0, 0, 0, 0];
  List DRIVE_ALL = [0,0,0,0,0,0];
  List ENDGAME_ALL = [0,0,0,0,0,0];

  int auto_point = 0;
  int back_drop = 0;
  int back_stage = 0;
  int navigation = 0;
  int randomization = 0;

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


    auto_point = AUTONOMUS_ALL[0];
    back_drop = AUTONOMUS_ALL[1];
    back_stage = AUTONOMUS_ALL[2];
    navigation = AUTONOMUS_ALL[3];
    randomization = AUTONOMUS_ALL[4];
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

  final Text_style =
      TextStyle(fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold);
  final Text_style_point = TextStyle(fontSize: 25, color: Colors.black);



  void add_point_auto_BackDrop() {
    setState(() {
      back_drop += 5;

      auto_point += 5;

    });
  }

  void remove_point_auto_BackDrop() {
    setState(() {
      if (back_drop != 0) {
        back_drop -= 5;
        auto_point -= 5;
      }
    });
  }

  void add_point_auto_BackStage() {
    setState(() {
      back_stage += 3;
      auto_point += 3;
    });
  }

  void remove_point_auto_BackStage() {
    setState(() {
      if (back_stage != 0) {
        back_stage -= 3;
        auto_point -= 3;
      }
    });
  }

  void add_point_auto_nav() {
    setState(() {
      navigation += 5;
      auto_point += 5;
    });
  }

  void remove_point_auto_nav() {
    setState(() {
      if (navigation != 0) {
        navigation -= 5;
        auto_point -= 5;
      }
    });
  }

  void add_point_auto_randomization() {
    setState(() {
      if( randomization != 80) {
        randomization += 20;
        auto_point += 20;
      }
    });
  }

  void remove_point_auto_randomization() {
    setState(() {
      if (randomization != 0) {
        randomization -= 20;
        auto_point -= 20;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FTC AUTONOMOUS"),
        automaticallyImplyLeading: false,
        backgroundColor: widget.is_blue_alliance ? Colors.blue : Colors.red,
      ),
      body: ListView(
        children: [
          Main_Autonomus(auto_point),
          Padding(
            padding: const EdgeInsets.only(
              top: 10,
              left: 20,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      "Backdrop Points",
                      style: Text_style_point,
                    ),
                    SizedBox(
                      width: 25,
                    ),
                    IconButton(
                        onPressed: () {
                          remove_point_auto_BackDrop();
                        },
                        icon: Icon(Icons.remove)),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      "$back_drop",
                      style: Text_style_point,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    IconButton(
                        onPressed: () {
                          add_point_auto_BackDrop();
                        },
                        icon: Icon(Icons.add)),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Text(
                      "Backstage Points",
                      style: Text_style_point,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    IconButton(
                        onPressed: () {
                          remove_point_auto_BackStage();
                        },
                        icon: Icon(Icons.remove)),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      "$back_stage",
                      style: Text_style_point,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    IconButton(
                        onPressed: () {
                          add_point_auto_BackStage();
                        },
                        icon: Icon(Icons.add)),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Text(
                      "Navigation Points",
                      style: Text_style_point,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    IconButton(
                        onPressed: () {
                          remove_point_auto_nav();
                        },
                        icon: Icon(Icons.remove)),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      "$navigation",
                      style: Text_style_point,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    IconButton(
                        onPressed: () {
                          add_point_auto_nav();
                        },
                        icon: Icon(Icons.add)),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Text(
                      "Randomization",
                      style: Text_style_point,
                    ),
                    SizedBox(
                      width: 45,
                    ),
                    IconButton(
                        onPressed: () {
                          remove_point_auto_randomization();
                        },
                        icon: Icon(Icons.remove)),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      "$randomization",
                      style: Text_style_point,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    IconButton(
                        onPressed: () {
                          add_point_auto_randomization();
                        },
                        icon: Icon(Icons.add)),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Color(0xFF7A7A7A))),
              onPressed: () async{


                Data_point().updateDataAUTO(
                    auto: auto_point,
                    backdropAuto: back_drop,
                    backstageAuto: back_stage,
                    navigationAuto: navigation,
                    randomizationAuto: randomization,
                    id: 1);

                Navigator.pop(context, true);
              },
              child: Text(
                "Save",
                style: Text_style,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget Main_Autonomus(int auto_point) {
    return Column(
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
                "#TEAM CODE",
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
                        border: Border.all(color: Colors.black, width: 3)),
                    width: 400,
                    height: 200,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 20,
                        left: 20,
                      ),
                      child: Column(
                        children: [
                          Row_cl("AUTONOMOUS", auto_point),
                          SizedBox(
                            height: 15,
                          ),
                          Row_cl("DRIVER-CONTROL", DRIVE_ALL[0]),
                          SizedBox(
                            height: 15,
                          ),
                          Row_cl("END GAME", ENDGAME_ALL[0]),
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
}
