import 'package:mysql1/mysql1.dart';
import 'Usuario.dart';
import 'database.dart';

class preguntas{

  int? idpregunta;
  String? categoria;
  String? pregunta;
  String? respuesta;

  //constructores

  preguntas();
  preguntas.fromMap(ResultRow map) {
    this.idpregunta = map['idpregunta'];
    this.categoria = map['categoria'];
    this.pregunta = map['pregunta'];
    this.respuesta = map['respuesta'];
  }

  //Metodos
 
  preguntasD(usuario, categoria) async{
    var conn = await Database().conexion();
    try {
     var preguntaD = await conn.query('SELECT * FROM preguntas WHERE categoria = ?', [
      categoria
     ]);
     List<preguntas> pregunta = preguntaD.map((row) => preguntas.fromMap(row)).toList();
     return pregunta;
    } catch (e) {
      print(e);
    } finally {
      await conn.close();
    }
  }

  preguntasH(usuario, categoria) async{
    var conn = await Database().conexion();
    try {
     var preguntaH = await conn.query('SELECT * FROM preguntas WHERE categoria = ?', [
      categoria
     ]);
     List<preguntas> pregunta = preguntaH.map((row) => preguntas.fromMap(row)).toList();
     return pregunta;
    } catch (e) {
      print(e);
    } finally {
      await conn.close();
    }

  }

  preguntasC(usuario, categoria) async{
    var conn = await Database().conexion();
    try {
     var preguntaC = await conn.query('SELECT * FROM preguntas WHERE categoria = ?', [
      categoria
     ]);
     List<preguntas> pregunta = preguntaC.map((row) => preguntas.fromMap(row)).toList();
     return pregunta;
    } catch (e) {
      print(e);
    } finally {
      await conn.close();
    }
  }

  preguntasM(usuario, categoria) async{
    var conn = await Database().conexion();
    try {
     var preguntaM = await conn.query('SELECT * FROM preguntas WHERE categoria = ?', [
      categoria
     ]);
     List<preguntas> pregunta = preguntaM.map((row) => preguntas.fromMap(row)).toList();
     return pregunta;
    } catch (e) {
      print(e);
    } finally {
      await conn.close();
    }
  }
  
}