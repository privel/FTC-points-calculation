import 'package:flutter/material.dart';
import 'package:ftc_calculation_of_points/dat.dart';
import 'Calc.dart';

class Calc3 extends StatefulWidget {
  const Calc3({Key? key, required this.is_blue_alliance});

  final bool is_blue_alliance;
  @override
  State<Calc3> createState() => _Calc3State();
}

class _Calc3State extends State<Calc3> {
  List AUTONOMUS_ALL = [0, 0, 0, 0, 0, 0];
  List DRIVE_ALL = [0,0,0,0,0,0];
  List ENDGAME_ALL = [0,0,0,0,0,0];


  int End_point = 0;
  int Parking = 0;
  int Hang = 0;
  int Drone_Points = 0;

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
    End_point = ENDGAME_ALL[0];
    Hang = ENDGAME_ALL[1];
    Parking = ENDGAME_ALL[2];

    Drone_Points = ENDGAME_ALL[3];
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
  final Text_style_point =
  TextStyle(fontSize: 25, color: Colors.black);




  void add_point_auto_Hang(){
    setState(() {
      if(Hang != 40) {
        Hang += 20;
        End_point += 20;
      }
    });
  }
  void remove_point_auto_Hang(){

    setState(() {
      if (Hang != 0) {
        Hang -= 20 ;
        End_point -= 20;
      }
    });
  }



  void add_point_auto_Parking(){
    setState(() {
      if(Parking != 10) {
        Parking += 5;
        End_point += 5;
      }
    });
  }
  void remove_point_auto_Parking(){

    setState(() {
      if (Parking != 0) {
        Parking -= 5 ;
        End_point -= 5;
      }
    });
  }

  void add_point_auto_Drone_Points(){
    setState(() {
      if(Drone_Points != 60) {
        Drone_Points += 10;
        End_point += 10;
      }
    });
  }
  void remove_point_auto_Drone_Points(){

    setState(() {
      if (Drone_Points != 0) {
        Drone_Points -= 10;
        End_point -= 10;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FTC DRIVER-CONTROL"),
        automaticallyImplyLeading: false,
        backgroundColor: widget.is_blue_alliance ? Colors.blue : Colors.red,
      ),
      body: ListView(
        children: [
          Main_Autonomus(End_point),

          Padding(
            padding: const EdgeInsets.only(top:15,left: 20,),
            child: Column(
              children: [
                Row(
                  children: [

                    Text("Hang", style: Text_style_point,),
                    SizedBox(width: 60,),
                    IconButton(onPressed: (){
                      remove_point_auto_Hang();
                    }, icon: Icon(Icons.remove)),
                    SizedBox(width: 15,),
                    Text("$Hang", style: Text_style_point,),
                    SizedBox(width: 15,),
                    IconButton(onPressed: (){
                      add_point_auto_Hang();
                    }, icon: Icon(Icons.add)),

                  ],
                ),

                SizedBox(height: 20,),

                Row(
                  children: [

                    Text("Parking", style: Text_style_point,),
                    SizedBox(width: 60,),
                    IconButton(onPressed: (){
                      remove_point_auto_Parking();
                    }, icon: Icon(Icons.remove)),
                    SizedBox(width: 15,),
                    Text("$Parking", style: Text_style_point,),
                    SizedBox(width: 15,),
                    IconButton(onPressed: (){
                      add_point_auto_Parking();
                    }, icon: Icon(Icons.add)),

                  ],
                ),

                SizedBox(height: 20,),


                Row(
                  children: [

                    Text("Drone Points", style: Text_style_point,),
                    SizedBox(width: 15,),
                    IconButton(onPressed: (){
                      remove_point_auto_Drone_Points();
                    }, icon: Icon(Icons.remove)),
                    SizedBox(width: 15,),
                    Text("$Drone_Points", style: Text_style_point,),
                    SizedBox(width: 15,),
                    IconButton(onPressed: (){
                      add_point_auto_Drone_Points();
                    }, icon: Icon(Icons.add)),

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


                Data_point().updateDataEND(
                  endGame: End_point,
                  hang: Hang,
                  parking: Parking,
                  dronepoints: Drone_Points,
                  id: 1,
                );

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


  Widget Main_Autonomus(int drive_point) {
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
                        left: 25,
                      ),
                      child: Column(
                        children: [
                          Row_cl("AUTONOMOUS", AUTONOMUS_ALL[0]),
                          SizedBox(
                            height: 15,
                          ),
                          Row_cl("DRIVER-CONTROL", DRIVE_ALL[0]),
                          SizedBox(
                            height: 15,
                          ),
                          Row_cl("END GAME", drive_point),
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
