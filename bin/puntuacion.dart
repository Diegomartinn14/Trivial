import 'package:mysql1/mysql1.dart';
import 'Usuario.dart';
import 'database.dart';
import 'preguntas.dart';

class Puntuacion{

  //Propiedades

  int? idpuntuacion;
  int? idusuario;
  int? puntuacion;
  int? contadorp;
  String? categoria;
  
  //Constructores

  Puntuacion();
  Puntuacion.fromMap(ResultRow map) {
    this.idpuntuacion = map['idpuntuacion'];
    this.idusuario = map['idusuario'];
    this.categoria = map['categoria'];
    this.puntuacion = map['puntuacion'];
  }


  //Metodos

   rankp(idusuario) async {
    var conn = await Database().conexion();
    try {
      var rankinp = await conn.query('SELECT * FROM puntuacion WHERE idusuario = ? ORDER BY puntuacion DESC ', [
        idusuario
      ]);
      List<Puntuacion> puntos = rankinp.map((row) => Puntuacion.fromMap(row)).toList();
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
      List<Puntuacion> puntos = rankg.map((row) => Puntuacion.fromMap(row)).toList();
      return(puntos);
    } catch(e){
      print(e);
    } finally {
      await conn.close();
    }
  }

  crearPuntuacion(idusuario, contador, categoria){
    Puntuacion puntuacion =  new Puntuacion();
    puntuacion.idusuario = idusuario;
    puntuacion.categoria = categoria;
    puntuacion.puntuacion = contador;
    puntuacion.insertarPuntuacion();
    print('Puntuacion creada correctamente');
  }

  insertarPuntuacion() async {
    var conn = await Database().conexion();
    try {
      await conn.query('INSERT INTO puntuacion(idusuario,categoria,puntuacion) VALUES (?,?,?)', [
        idusuario,
        categoria,
        puntuacion
      ]);
      print('Puntuación registrada correctamente');
    } catch (e) {
   } finally {
      await conn.close();
    }
  }

}