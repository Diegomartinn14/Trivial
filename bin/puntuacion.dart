import 'package:mysql1/mysql1.dart';
import 'database.dart';

class puntuacion{

  //Propiedades

  int? idpuntuacion;
  int? idusuario;
  int? puntos;
  
  //Constructores

  puntuacion();
  puntuacion.fromMap(ResultRow map) {
    this.idpuntuacion = map['idpuntuacion'];
    this.idusuario = map['idusuario'];
    this.puntos = map['puntuacion'];
  }


  //Metodos

   rankp(idusuario) async {
    var conn = await Database().conexion();
    try {
      var rankinp = await conn.query('SELECT * FROM puntuacion WHERE idusuario = ? ORDER BY puntuacion DESC ', [
        idusuario
      ]);
      List<puntuacion> puntos = rankinp.map((row) => puntuacion.fromMap(row)).toList();
      return puntos;
    } catch (e) {
      print(e);
    } finally {
      await conn.close();
    }
  }

  rankg() async{
    var conn = await Database().conexion();
    try {
      var rankg = await conn.query('SELECT * FROM puntuacion ORDER BY puntuacion DESC ');
      List<puntuacion> puntos = rankg.map((row) => puntuacion.fromMap(row)).toList();
      return(puntos);
    } catch(e){
      print(e);
    } finally {
      await conn.close();
    }
  }
}