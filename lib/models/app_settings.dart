import 'package:isar/isar.dart';

// use this command on cmd: dart run build_runner build
part 'app_settings.g.dart';

@Collection()
class AppSettings {
  Id id = Isar.autoIncrement;
  DateTime? firstDate;
}
