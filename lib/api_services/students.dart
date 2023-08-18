class student {
  String id;
  String username;
  String firstName;
  String lastName;

  student({
    required this.id,
    required this.username,
    required this.firstName,
    required this.lastName,
  });

  factory student.fromJson(Map<String, dynamic> json) {
    return student(
      id: json['id'] ?? '',
      username: json['indexNumber'] ?? '',
      firstName: json['firstName'] ?? '',
      lastName: json['lastName'] ?? '',
    );
  }
}


class ProgramData {
  String id;
  String programName;
  String deptName;

  

  ProgramData({
    required this.id,
    required this.programName,
    required this.deptName,
 
  });

  factory ProgramData.fromJson(Map<String, dynamic> json) {
    return ProgramData(
      id: json['id'] ?? '',
      programName: json['programName'] ?? '',
      deptName: json['deptName'] ?? '',
    );
  }
}