import 'Database.dart';
import 'package:mysql1/mysql1.dart';
import 'dart:io';
import 'trivial.dart';

class Usuario {
  int? idusuario;
  String? nombre;
  String? password;
/*
  int? get idusuario {
    return this._idusuario;
  }

  String? get nombre {
    return this._nombre;
  }

  set nombre(String? texto) => this._nombre = texto;

  String? get password {
    return this._password;
  }

  set password(String? texto) => this._password = texto;
*/
  Usuario();
  Usuario.fromMap(ResultRow map) {
    this.idusuario = map['idusuario'];
    this.nombre = map['nombre'];
    this.password = map['password'];
  }

  insertarUsuario() async {
    var conn = await Database().conexion();
    try {
      await conn.query('INSERT INTO usuarios(nombre,password) VALUES (?,?)', [
        nombre,
        password
      ]);
      print('Usuario insertado correctamente');
    } catch (e) {
    } finally {
      await conn.close();
    }
  }

  all() async {
    var conn = await Database().conexion();
    try {
      var listado = await conn.query('SELECT * FROM usuarios');
      List<Usuario> usuarios = listado.map((row) => Usuario.fromMap(row)).toList();
      return usuarios;
    } catch (e) {
      print(e);
    } finally {
      await conn.close();
    }
  }

  loginUsuario() async {
    var conn = await Database().conexion();
    try {
      var resultado = await conn.query('SELECT * FROM usuarios WHERE nombre = ?', [
        this.nombre
      ]);
      Usuario usuario = Usuario.fromMap(resultado.first);
      if (this.password == usuario.password) {
        return usuario;
      } else {
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    } finally {
      await conn.close();
    }
  }

  crearUsuario() {
    Usuario usuario = new Usuario();
    stdout.writeln('Introduce un nombre de usuario');
    usuario.nombre = stdin.readLineSync();
    stdout.writeln('Introduce una contraseña');
    usuario.password = stdin.readLineSync();
    usuario.insertarUsuario();
    stdout.writeln('Usuario creado correctamente');
    trivial().menu1();
  }
  
  login() async {
    Usuario usuario = new Usuario();
    stdout.writeln('Introduce tu nombre de usuario:');
    usuario.nombre = stdin.readLineSync();
    stdout.writeln('Introduce tu contraseña:');
    usuario.password = stdin.readLineSync();
    var resultado = await usuario.loginUsuario();
    if (resultado == false) {
      stdout.writeln('Tu nombre de usuario o contraseña son incorrectos');
      trivial().menu1();
    } else {
      //menu2(resultado);
      trivial().menu2(resultado);
    } 
  }
}
