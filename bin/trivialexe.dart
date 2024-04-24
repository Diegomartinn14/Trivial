import 'database.dart';
import 'trivial.dart';

main() async{
  await Database().instalacion();
  trivial().menu1();
}
