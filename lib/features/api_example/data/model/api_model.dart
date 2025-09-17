// To parse this JSON data, do
//
//     final getApiModel = apiModelFromJson(jsonString);

import 'dart:convert';

import 'package:deficient_calculator/features/api_example/domain/entities/api_entity.dart';

ApiModel apiModelFromJson(String str) => ApiModel.fromJson(json.decode(str));

String apiModelToJson(ApiModel data) => json.encode(data.toJson());

class ApiModel extends ApiEntity {
  final int? id;
  final String? employeeName;
  final int? employeeSalary;
  final int? employeeAge;
  final String? profileImage;

  ApiModel({this.id, this.employeeName, this.employeeSalary, this.employeeAge, this.profileImage});

  factory ApiModel.fromJson(Map<String, dynamic> json) => ApiModel(
    id: json["id"],
    employeeName: json["employee_name"],
    employeeSalary: json["employee_salary"],
    employeeAge: json["employee_age"],
    profileImage: json["profile_image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "employee_name": employeeName,
    "employee_salary": employeeSalary,
    "employee_age": employeeAge,
    "profile_image": profileImage,
  };

  factory ApiModel.fromEntity(ApiEntity entity) => ApiModel(
    id: entity.id,
    employeeName: entity.employeeName,
    employeeSalary: entity.employeeSalary,
    employeeAge: entity.employeeAge,
    profileImage: entity.profileImage,
  );

  ApiEntity toEntity() => ApiEntity(
    id: id,
    employeeName: employeeName,
    employeeSalary: employeeSalary,
    employeeAge: employeeAge,
    profileImage: profileImage,
  );
}
