import 'package:hive/hive.dart';

part 'data_values.g.dart';

@HiveType(typeId: 2)
class Datavalues  extends HiveObject{
  Datavalues();

  Datavalues.fromJson(Map<String, dynamic> json); 

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    return data;
  }
}