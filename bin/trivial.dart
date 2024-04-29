
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
      menu2(resultado);
    } 
  }
  bool menu1ComprobarRespuesta(var respuesta) => respuesta != '1' && respuesta != '2' && respuesta != '3';

  //Menu 2

  menu2(usuario) async {
    String? respuesta;
    String? nombre = usuario.nombre;
    do {
      stdout.writeln('''Hola $nombre elige una de estas opciones:
    1 -> Comenzar una partida
    2 -> Ver Clasificación propia
    3 -> Ver Clasificación General
    4 -> Listar usuarios
    5 -> Salir''');
      respuesta = stdin.readLineSync();
    } while (menu2ComprobarRespuesta(respuesta));
    switch (respuesta){
      case '1':
        menu3(usuario);
        break;
      case '2':
        stdout.writeln("Esta es tu Clasificación Personal");
        List <puntuacion> puntos = await puntuacion().rankp(usuario.idusuario);
        for(puntuacion elemento in puntos){
          stdout.writeln('Nombre= ${usuario.nombre}, IDusuario= ${elemento.idusuario}, Puntuación= ${elemento.puntos}' );
        }
        menu2(usuario);
        break;
      case '3': 
        stdout.writeln("Esta es la Clasificación Global");
        List <puntuacion> puntos = await puntuacion().rankg();
        for(puntuacion elemento in puntos){
          stdout.writeln('IDusuario= ${elemento.idusuario}, Puntuación= ${elemento.puntos}' );
        }
        menu2(usuario);
        break;
      case '4': 
        stdout.writeln('Este es el listado de usuarios');
        List <Usuario> usuarios = await Usuario().all();
        for(Usuario elemento in usuarios){
        stdout.writeln('IDusuario: ${elemento.idusuario}, Nombre: ${elemento.nombre}');
        }
        menu2(usuario);
        break;
     case '5':
          print('Hasta la proxima $nombre!!');
        break;
    }
  }
  bool menu2ComprobarRespuesta(var respuesta) => respuesta == null || respuesta != '1' && respuesta != '2' && respuesta != '3' && respuesta != '4' && respuesta != '5';



  menu3(usuario)async{
      String? respuesta;
    String? nombre = usuario.nombre;
    do {
      stdout.writeln('''$nombre seleccione la categoria en la que quieres jugar:
    1 -> Deportes
    2 -> Historia
    3 -> Cine
    4 -> Musica
    5 -> Salir''');
      respuesta = stdin.readLineSync();
    } while (menu3ComprobarRespuesta(respuesta));

    switch(respuesta){
      case '1':
      
    }
  }
  bool menu3ComprobarRespuesta(var respuesta) => respuesta == null || respuesta != '1' && respuesta != '2' && respuesta != '3' && respuesta != '4' && respuesta != '5';
}
