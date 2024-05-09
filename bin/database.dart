import 'package:mysql1/mysql1.dart';

class Database {
  final String _host = 'Localhost';
  final int _port = 3306;
  final String _user = 'root';

  instalacion() async {
    var setting = /*new*/ ConnectionSettings(
      host: this._host,
      port: this._port,
      user: this._user,
    );
    var conn = await MySqlConnection.connect(setting);
    try {
      await _crearDB(conn);
      await _crearTablaUsuarios(conn);
      await _crearTablaPuntuacion(conn);
      await _crearTablaPreguntas(conn);
    } catch (e) {
      print(e);
    } finally {
      await conn.close();
    }
  }
  _crearDB(conn) async {
    await conn.query('CREATE DATABASE IF NOT EXISTS trivialdb');
    await conn.query('USE trivialdb');
    print('Conectado a trivialdb');
  }

  _crearTablaUsuarios(conn) async {
    await conn.query(''' CREATE TABLE IF NOT EXISTS usuarios(
        idusuario INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
        nombre VARCHAR(50) NOT NULL UNIQUE,
        password VARCHAR(10) NOT NULL
      )''');
    print('Tabla de usuario creada');
  }
  _crearTablaPuntuacion(conn) async{
    await conn.query(''' CREATE TABLE IF NOT EXISTS puntuacion(
      idpuntuacion INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
      idusuario INT NOT NULL,
      categoria VARCHAR(20) NOT NULL,
      puntuacion INT NOT NULL,
      FOREIGN KEY(idusuario) REFERENCES usuarios(idusuario)
    )''');
    print('Tabla de puntuación creada');
  }
  _crearTablaPreguntas(conn) async{
    await conn.query(''' CREATE TABLE IF NOT EXISTS preguntas(
      idpregunta INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
      categoria VARCHAR (20) NOT NULL,
      pregunta VARCHAR(200) NOT NULL,
      respuesta VARCHAR(1) NOT NULL
    )''');
    print('Tabla de preguntas creada');
  }
  Future<MySqlConnection> conexion() async {
    var setting = /*new*/ ConnectionSettings(host: this._host, port: this._port, user: this._user, db: 'trivialdb');
    return await MySqlConnection.connect(setting);
  }
}