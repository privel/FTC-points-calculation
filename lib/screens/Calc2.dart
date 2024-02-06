import 'package:flutter/material.dart';
import 'package:ftc_calculation_of_points/dat.dart';
import 'Calc.dart';

class Calc2 extends StatefulWidget {
  const Calc2({Key? key, required this.is_blue_alliance});

  final bool is_blue_alliance;
  @override
  State<Calc2> createState() => _Calc2State();
}

class _Calc2State extends State<Calc2> {
  List AUTONOMUS_ALL = [0, 0, 0, 0, 0, 0];
  List DRIVE_ALL = [0,0,0,0,0,0];
  List ENDGAME_ALL = [0,0,0,0,0,0];


  int drive_point = 0;
  int back_drop_drive = 0;
  int back_stage_drive = 0;
  int mosaic_point = 0;
  int set_bonus_point = 0;

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
    drive_point = DRIVE_ALL[0];
    back_drop_drive = DRIVE_ALL[1];
    back_stage_drive = DRIVE_ALL[2];
    mosaic_point = DRIVE_ALL[3];
    set_bonus_point = DRIVE_ALL[4];
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
  final Text_style_point =
  TextStyle(fontSize: 25, color: Colors.black);



  void add_point_auto_BackDrop(){
    setState(() {
      back_drop_drive +=3;
      drive_point += 3;
    });
  }
  void remove_point_auto_BackDrop(){

    setState(() {
      if (back_drop_drive != 0) {
        back_drop_drive -= 3;
        drive_point -= 3;
      }
    });
  }


  void add_point_auto_BackStage(){
    setState(() {
      back_stage_drive += 1;
      drive_point += 1;
    });
  }
  void remove_point_auto_BackStage(){

    setState(() {
      if (back_stage_drive != 0) {
        back_stage_drive -= 1;
        drive_point -= 1;
      }
    });
  }

  void add_point_auto_mos(){
    setState(() {
      mosaic_point += 10;
      drive_point += 10;
    });
  }
  void remove_point_auto_mos(){

    setState(() {
      if (mosaic_point != 0) {
        mosaic_point -= 10;
        drive_point -= 10;
      }
    });
  }


  void add_point_auto_bonus(){
    setState(() {
      set_bonus_point += 10;
      drive_point += 10;
    });
  }
  void remove_point_auto_bonus(){

    setState(() {
      if (set_bonus_point != 0) {
        set_bonus_point -= 10;
        drive_point -= 10;
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
          Main_Autonomus(drive_point),

          Padding(
            padding: const EdgeInsets.only(top:15,left: 20,),
            child: Column(
              children: [
                Row(
                  children: [

                    Text("Backdrop Points", style: Text_style_point,),
                    SizedBox(width: 25,),
                    IconButton(onPressed: (){
                      remove_point_auto_BackDrop();
                    }, icon: Icon(Icons.remove)),
                    SizedBox(width: 15,),
                    Text("$back_drop_drive", style: Text_style_point,),
                    SizedBox(width: 15,),
                    IconButton(onPressed: (){
                      add_point_auto_BackDrop();
                    }, icon: Icon(Icons.add)),

                  ],
                ),

                SizedBox(height: 20,),

                Row(
                  children: [

                    Text("Backstage Points", style: Text_style_point,),
                    SizedBox(width: 15,),
                    IconButton(onPressed: (){
                      remove_point_auto_BackStage();
                    }, icon: Icon(Icons.remove)),
                    SizedBox(width: 15,),
                    Text("$back_stage_drive", style: Text_style_point,),
                    SizedBox(width: 15,),
                    IconButton(onPressed: (){
                      add_point_auto_BackStage();
                    }, icon: Icon(Icons.add)),

                  ],
                ),


                SizedBox(height: 20,),

                Row(
                  children: [

                    Text("Mosaic Points", style: Text_style_point,),
                    SizedBox(width: 50,),
                    IconButton(onPressed: (){
                      remove_point_auto_mos();
                    }, icon: Icon(Icons.remove)),
                    SizedBox(width: 15,),
                    Text("$mosaic_point", style: Text_style_point,),
                    SizedBox(width: 15,),
                    IconButton(onPressed: (){
                      add_point_auto_mos();
                    }, icon: Icon(Icons.add)),

                  ],
                ),


                SizedBox(height: 20,),

                Row(
                  children: [

                    Text("Set Bonus Points", style: Text_style_point,),
                    SizedBox(width: 20,),
                    IconButton(onPressed: (){
                      remove_point_auto_bonus();
                    }, icon: Icon(Icons.remove)),
                    SizedBox(width: 15,),
                    Text("$set_bonus_point", style: Text_style_point,),
                    SizedBox(width: 15,),
                    IconButton(onPressed: (){
                      add_point_auto_bonus();
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


                Data_point().updateDataDRIVE(
                    driverControlled: drive_point,
                    backdropDrive: back_drop_drive,
                    backstageDrive: back_stage_drive,
                    mosaicDrive: mosaic_point,
                    setBonusDrive: set_bonus_point,
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
                          Row_cl("DRIVER-CONTROL", drive_point),
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
