import 'package:json_annotation/json_annotation.dart';



@JsonSerializable()
class Model {
  String email='';
  String date='';
  String time='';
  String value='';
  // String xyz;
  Model({required this.email, required this.date, required this.time,required this.value});
  factory Model.fromJson(Map<String, dynamic> json) => _$ModelFromJson(json);
  Map<String, dynamic> toJson() => _$ModelToJson(this);
}



Model _$ModelFromJson(Map<String, dynamic> json) {
  return Model(
    email: json['email'] as String,
    date: json['date'] as String,
    time: json['time'] as String,
    value: json['value'] as String,
  );
}

Map<String, dynamic> _$ModelToJson(Model instance) => <String, dynamic>{
  'email': instance.email,
  'date': instance.date,
  'time': instance.time,
  'value': instance.value,
};