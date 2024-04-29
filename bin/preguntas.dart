import 'package:mysql1/mysql1.dart';

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

  
  
}