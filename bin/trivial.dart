import 'dart:io';
import 'Usuario.dart';
import 'puntuacion.dart';
import 'preguntas.dart';
class trivial {

  //Menu 1

    menu1() {
    String? respuesta;
    do {
      stdout.writeln('''elige una de estas opciones para poder jugar al trivial:
    1 -> Crear Usuario
    2 -> Login
    3 -> Crerrar trivial''');
      respuesta = stdin.readLineSync();
    } while (menu1ComprobarRespuesta(respuesta));

    switch (respuesta) {
      case '1':
        Usuario().crearUsuario();
        break;
      case '2':
        Usuario().login();
        break;
      case '3':
        stdout.writeln('Hasta Luego');
        break;
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
    5 -> Cerrar sesión''');
      respuesta = stdin.readLineSync();
    } while (menu2ComprobarRespuesta(respuesta));
    switch (respuesta){
      case '1':
        menu3(usuario);
        break;
      case '2':
        stdout.writeln("Esta es tu Clasificación Personal");
        List <Puntuacion> puntos = await Puntuacion().rankp(usuario.idusuario);
        for(Puntuacion elemento in puntos){
          stdout.writeln('Nombre= $nombre, IDusuario= ${elemento.idusuario}, Categoria= ${elemento.categoria}, Puntuación= ${elemento.puntuacion}' );
        }
        menu2(usuario);
        break;
      case '3': 
        stdout.writeln("Esta es la Clasificación Global");
        List <Puntuacion> puntos = await Puntuacion().rankg();
        for(Puntuacion elemento in puntos){
          stdout.writeln('IDusuario= ${elemento.idusuario}, Categoria= ${elemento.categoria}, Puntuación= ${elemento.puntuacion}' );
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
          menu1();
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
    5 -> Volver''');
      respuesta = stdin.readLineSync();
    } while (menu3ComprobarRespuesta(respuesta));
    int contador = 0;
    
    switch(respuesta){
      case '1':
        Puntuacion().contadorp = contador;
        String categoria = 'Deportes';
        List <preguntas> preguntaD = await preguntas().preguntasD(usuario, categoria);
        print(preguntas().categoria);
        for(preguntas elemento in preguntaD){
            stdout.writeln('${elemento.pregunta}');
            String? respuesta = stdin.readLineSync() ?? 'e';
            if(respuesta == elemento.respuesta){
              contador += 10;
              if(contador == 100){
                stdout.writeln('Enhorabuena $nombre has completado todas las preguntas de $categoria');
                await Puntuacion().crearPuntuacion(usuario.idusuario, contador, categoria);
                menu3(usuario);
              }else{
                stdout.writeln('Respuesta correcta');
              }
            }else{
              stdout.writeln('Respuesta incorrecta');
              stdout.writeln('Esta ha sido tu puntuacion $contador');
              await Puntuacion().crearPuntuacion(usuario.idusuario, contador, categoria);
              menu3(usuario);
              break;
            }
        }
        break;
      case '2':
       Puntuacion().contadorp = contador;
        String categoria = 'Historia';
        List <preguntas> preguntaH = await preguntas().preguntasH(usuario, categoria);
        print(preguntas().categoria);
        for(preguntas elemento in preguntaH){
            stdout.writeln('${elemento.pregunta}');
            String? respuesta = stdin.readLineSync() ?? 'e';
            if(respuesta == elemento.respuesta){
              contador += 10;
              if(contador == 100){
                stdout.writeln('Enhorabuena $nombre has completado todas las preguntas de $categoria');
                await Puntuacion().crearPuntuacion(usuario.idusuario, contador, categoria);
                menu3(usuario);
              }else{
                stdout.writeln('Respuesta correcta');
              }
            }else{
              stdout.writeln('Respuesta incorrecta');
              stdout.writeln('Esta ha sido tu puntuacion $contador');
              await Puntuacion().crearPuntuacion(usuario.idusuario, contador, categoria);
              menu3(usuario);
              break;
            }
        }
      case '3':
         Puntuacion().contadorp = contador;
        String categoria = 'Cine';
        List <preguntas> preguntaC = await preguntas().preguntasC(usuario, categoria);
        print(preguntas().categoria);
        for(preguntas elemento in preguntaC){
            stdout.writeln('${elemento.pregunta}');
            String? respuesta = stdin.readLineSync() ?? 'e';
            if(respuesta == elemento.respuesta){
              contador += 10;
              if(contador == 100){
                stdout.writeln('Enhorabuena $nombre has completado todas las preguntas de $categoria');
                await Puntuacion().crearPuntuacion(usuario.idusuario, contador, categoria);
                menu3(usuario);
              }else{
                stdout.writeln('Respuesta correcta');
              }
            }else{
              stdout.writeln('Respuesta incorrecta');
              stdout.writeln('Esta ha sido tu puntuacion $contador');
              await Puntuacion().crearPuntuacion(usuario.idusuario, contador, categoria);
              menu3(usuario);
              break;
            }
        }
        break;
      case '4':
        Puntuacion().contadorp = contador;
        String categoria = 'Musica';
        List <preguntas> preguntaM = await preguntas().preguntasM(usuario, categoria);
        print(preguntas().categoria);
        for(preguntas elemento in preguntaM){
            stdout.writeln('${elemento.pregunta}');
            String? respuesta = stdin.readLineSync() ?? 'e';
            if(respuesta == elemento.respuesta){
              contador += 10;
              if(contador == 100){
                stdout.writeln('Enhorabuena $nombre has completado todas las preguntas de $categoria');
                await Puntuacion().crearPuntuacion(usuario.idusuario, contador, categoria);
                menu3(usuario);
              }else{
                stdout.writeln('Respuesta correcta');
              }
            }else{
              stdout.writeln('Respuesta incorrecta');
              stdout.writeln('Esta ha sido tu puntuacion $contador');
              await Puntuacion().crearPuntuacion(usuario.idusuario, contador, categoria);
              menu3(usuario);
              break;
            }
        }
      case '5':
        menu2(usuario);
        break;
    }
  }
  bool menu3ComprobarRespuesta(var respuesta) => respuesta == null || respuesta != '1' && respuesta != '2' && respuesta != '3' && respuesta != '4' && respuesta != '5';
}
