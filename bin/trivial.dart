import 'dart:io';
import 'Usuario.dart';
import 'puntuacion.dart';

class trivial {

  //Menu 1

    menu1() {
    String? respuesta;
    do {
      stdout.writeln('''elige una de estas opciones para poder jugar al trivial:
    1 -> Crear Usuario
    2 -> Login
    3 -> Salir''');
      respuesta = stdin.readLineSync();
    } while (menu1ComprobarRespuesta(respuesta));

    switch (respuesta) {
      case '1':
        crearUsuario();
        break;
      case '2':
        login();
        break;
      case '3':
        stdout.writeln('Hasta Luego');
        break;
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
    menu1();
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
      menu1();
    } else {
      //menu2(resultado);
      menu2(usuario);
    } 
  }
  bool menu1ComprobarRespuesta(var respuesta) => respuesta != '1' && respuesta != '2' && respuesta != '3';

  //Menu 2

  menu2(Usuario usuario) async {
    String? respuesta;
    do {
      stdout.writeln('''Hola elige una de estas opciones:
    1 -> Comenzar una partida
    2 -> Ver Clasificación propia
    3 -> Ver Clasificación General
    4 -> Salir''');
      respuesta = stdin.readLineSync();
    } while (menu2ComprobarRespuesta(respuesta));

    switch (respuesta){
     /* case '1':
        menu3();
        break;
        */
      case '2':
        puntuacion().rankp(Usuario().idusuario);
        menu2(usuario);
        break;
      case '3': 
        puntuacion().rankg();
        menu2(usuario);
        break;
      case '4': 
        print('Hasta la proxima!!');
        break;
    }
  }
  bool menu2ComprobarRespuesta(var respuesta) => respuesta == null || respuesta != '1' && respuesta != '2' && respuesta != '3' && respuesta != '4';

}
