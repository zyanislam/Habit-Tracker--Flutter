import 'package:isar/isar.dart';

// use this command on cmd: dart run build_runner build
part 'habit.g.dart';

@Collection()
class Habit {
  // Id for the Habit
  Id id = Isar.autoIncrement;

  // Name of the Habit
  late String habitName;

  // Days completed
  List<DateTime> completedDays = [];
}
