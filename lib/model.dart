import 'package:json_annotation/json_annotation.dart';



@JsonSerializable()
class Model {
  String email='';
  String password='';
  String value='';
  // String xyz;
  Model({required this.email, required this.password,required this.value});
  factory Model.fromJson(Map<String, dynamic> json) => _$ModelFromJson(json);
  Map<String, dynamic> toJson() => _$ModelToJson(this);
}



Model _$ModelFromJson(Map<String, dynamic> json) {
  return Model(
    email: json['email'] as String,
    password: json['password'] as String,
    value: json['value'] as String,
  );
}

Map<String, dynamic> _$ModelToJson(Model instance) => <String, dynamic>{
  'email': instance.email,
  'password': instance.password,
  'value': instance.password,
};