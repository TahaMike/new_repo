class ApiEntity {
  final int? id;
  final String? employeeName;
  final int? employeeSalary;
  final int? employeeAge;
  final String? profileImage;

  ApiEntity({this.id, this.employeeName, this.employeeSalary, this.employeeAge, this.profileImage});

  ApiEntity copyWith({int? id, String? employeeName, int? employeeSalary, int? employeeAge, String? profileImage}) => ApiEntity(
    id: id ?? this.id,
    employeeName: employeeName ?? this.employeeName,
    employeeSalary: employeeSalary ?? this.employeeSalary,
    employeeAge: employeeAge ?? this.employeeAge,
    profileImage: profileImage ?? this.profileImage,
  );
}
