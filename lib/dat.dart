import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

Database? _database;
List WholeDataList = [];
List WholeDataList1 = [];
class Data_point {
  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _init_db('local.db');
    return _database!;
  }

  Future _init_db(String filepath) async {
    final dbpath = await getDatabasesPath();
    final path = join(dbpath, filepath);
    return await openDatabase(path, version: 3, onCreate: _create_db);
  }

  Future<void> _create_db(Database db, int version) async {
    await db.execute('''
    CREATE TABLE point(
      id INTEGER PRIMARY KEY,
      auto INTEGER, 
      backdropAuto INTEGER,
      backstageAuto INTEGER,
      navigationAuto INTEGER,
      randomizationAuto INTEGER,
      driverControlled INTEGER,
      backdropDrive INTEGER,
      backstageDrive INTEGER,
      mosaicDrive INTEGER, 
      setBonusDrive INTEGER, 
      endGame INTEGER,
      hang INTEGER,
      parking INTEGER,
      dronepoints INTEGER
    )''');
    //add_point(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
  }

  Future<String> add_point(
      int auto,
      int backdropAuto,
      int backstageAuto,
      int navigationAuto,
      int randomizationAuto,
      int driverControlled,
      int backdropDrive,
      int backstageDrive,
      int mosaicDrive,
      int setBonusDrive,
      int endGame,
      int hang,
      int parking,
      int dronepoints) async {
    final db = await database;
    await db.insert("point", {
      "auto": auto,
      "backdropAuto": backdropAuto,
      "backstageAuto": backstageAuto,
      "navigationAuto": navigationAuto,
      "randomizationAuto": randomizationAuto,
      "driverControlled": driverControlled,
      "backdropDrive": backdropDrive,
      "backstageDrive": backstageDrive,
      "mosaicDrive": mosaicDrive,
      "setBonusDrive": setBonusDrive,
      "endGame": endGame,
      "hang": hang,
      "parking":parking,
      "dronepoints": dronepoints
    });
    print("${auto} add to you ass ");
    return ('add');
  }

  Future<Map<String, dynamic>> readData(int id) async {
    final db = await database;
    final List<Map<String, dynamic>> results = await db.query(
        'point',
        where: 'id = ?',
        whereArgs: [id]
    );



    if (results.isNotEmpty) {
      //print("Успешно прочитано: ${results[0]}");
      return results[0];
    } else {
      print("Запись с ID $id не найдена.");
      return {}; // Возвращаем пустой словарь, если запись не найдена
    }
  }
  Future readALLData() async {
    final db = await database;
    final alldata = await db!.query('point');
    WholeDataList1 = alldata;
    print("Succesfully read /n ${WholeDataList1}");
    return (WholeDataList1);
  }
  Future<int> updateDataAUTO(
      {required int id,
      int? auto,
      int? backdropAuto,
      int? backstageAuto,
      int? navigationAuto,
      int? randomizationAuto}) async {
    final db = await database;
    int db_id_data = await db.rawUpdate(
        'UPDATE point SET auto=?, backdropAuto=?, backstageAuto=?, navigationAuto=?, randomizationAuto=? WHERE id = ?',
        [
          auto,
          backdropAuto,
          backstageAuto,
          navigationAuto,
          randomizationAuto,
          id
        ]);
    print("${db_id_data} GOOD");
    return db_id_data;
  }

  Future<int> updateDataDRIVE(
      {required int id,
      int? driverControlled,
      int? backdropDrive,
      int? backstageDrive,
      int? mosaicDrive,
      int? setBonusDrive}) async {
    final db = await database;
    int db_id_data = await db.rawUpdate(
        'UPDATE point SET driverControlled=?, backdropDrive=?, backstageDrive=?, mosaicDrive=?, setBonusDrive=? WHERE id = ?',
        [
          driverControlled,
          backdropDrive,
          backstageDrive,
          mosaicDrive,
          setBonusDrive,
          id
        ]);
    print(db_id_data);
    return db_id_data;
  }

  Future<int> updateDataEND(
      {required int id, int? endGame, int? hang, int? parking, int? dronepoints}) async {
    final db = await database;
    int db_id_data = await db.rawUpdate(
        'UPDATE point SET endGame=?, hang=?, parking=?, dronepoints=? WHERE id = ?',
        [endGame, hang, parking, dronepoints, id]);
    print(db_id_data);
    return db_id_data;
  }
}
