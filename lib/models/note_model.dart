import 'package:hive/hive.dart';

part 'note_model.g.dart';

@HiveType(typeId: 0)
class NoteModel extends HiveObject {
  @HiveField(0)
  String? title;
  @HiveField(1)
  String? subTitle;
  @HiveField(2)
  String? date;
  @HiveField(3)
  String? time;
  @HiveField(4)
  int? color;

  NoteModel({
    this.title,
    this.subTitle,
    this.date,
    this.time,
    this.color,
  });
}