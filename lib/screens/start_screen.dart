import 'package:flutter/material.dart';
import 'package:ftc_calculation_of_points/Score.dart';
import 'package:ftc_calculation_of_points/dat.dart';
import 'package:ftc_calculation_of_points/screens/Chose.dart';
import 'Calc.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  void chos() async {
    var data = await Data_point().readData(1);
    if (data.isEmpty) {
      Data_point().add_point(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
      print("TRUE");
    }

    Data_point().updateDataAUTO(
        auto: 0,
        backdropAuto: 0,
        backstageAuto: 0,
        navigationAuto: 0,
        randomizationAuto: 0,
        id: 1);
    Data_point().updateDataDRIVE(
        driverControlled: 0,
        backdropDrive: 0,
        backstageDrive: 0,
        mosaicDrive: 0,
        setBonusDrive: 0,
        id: 1);
    Data_point().updateDataEND(
      endGame: 0,
      hang: 0,
      parking: 0,
      dronepoints: 0,
      id: 1,
    );
    //Data_point().readData(1);

    Navigator.pushAndRemoveUntil<void>(
      context,
      MaterialPageRoute<void>(
          builder: (BuildContext context) => Chs(
                is_blue_alliance: true,
                id_q: 1,
              )),
      ModalRoute.withName('/'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height / 20,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/center.png'),
              ],
            ),
          ),
          Padding(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.height / 4),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    chos();
                  },
                  child: Text(
                    "Blue Alliance",
                    style: TextStyle(color: Colors.blue),
                  ),
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                  onPressed: () async {
                    var data = await Data_point().readData(1);
                    if (data.isEmpty) {
                      Data_point()
                          .add_point(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
                      print("TRUE");
                    }

                    Data_point().updateDataAUTO(
                        auto: 0,
                        backdropAuto: 0,
                        backstageAuto: 0,
                        navigationAuto: 0,
                        randomizationAuto: 0,
                        id: 1);
                    Data_point().updateDataDRIVE(
                        driverControlled: 0,
                        backdropDrive: 0,
                        backstageDrive: 0,
                        mosaicDrive: 0,
                        setBonusDrive: 0,
                        id: 1);
                    Data_point().updateDataEND(
                      endGame: 0,
                      hang: 0,
                      parking: 0,
                      dronepoints: 0,
                      id: 1,
                    );

                    Navigator.pushAndRemoveUntil<void>(
                      context,
                      MaterialPageRoute<void>(
                          builder: (BuildContext context) => Chs(
                                is_blue_alliance: false,
                                id_q: 1,
                              )),
                      ModalRoute.withName('/'),
                    );
                  },
                  child:
                      Text("Red Alliance", style: TextStyle(color: Colors.red)),
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  "Create by Kcell Tech #24804",
                  style: TextStyle(color: Colors.grey.shade600),
                ),
              ),

          ),
        ],
      ),
    );
  }
}
