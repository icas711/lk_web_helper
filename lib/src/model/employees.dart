class Employees {
  final List<Employee> employees;

  const Employees({required this.employees});

  factory Employees.fromList(List list) {
    return Employees(
      employees:
          list
              .map((e) => Employee.fromJson(e as Map<String, dynamic>))
              .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {'employees': this.employees};
  }

  factory Employees.fromJson(Map<String, dynamic> json) {
    return Employees(employees: json['employees'] as List<Employee>);
  }
}

class Employee {
  final String id;
  final String title;
  final String organizationId;
  final String userId;
  final String? parentId;
  final String number;

  const Employee({
    required this.id,
    required this.title,
    required this.organizationId,
    required this.userId,
    required this.number,
    this.parentId,
  });

  factory Employee.init() {
    return const Employee(
      id: '',
      title: '',
      organizationId: '',
      userId: '',
      number: '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': this.id,
      'title': this.title,
      'organizationId': this.organizationId,
      'userId': this.userId,
      'parentId': this.parentId,
      'number': this.number,
    };
  }

  factory Employee.fromJson(Map<String, dynamic> map) {
    return Employee(
      id: map['id'] as String,
      title: map['title'] as String,
      organizationId: map['organizationId'] as String,
      userId: map['userId'] as String,
      parentId: map['parentId'] as String?,
      number: map['number'] as String,
    );
  }

  Employee copyWith({
    String? id,
    String? title,
    String? organizationId,
    String? userId,
    String? parentId,
    String? number,
  }) {
    return Employee(
      id: id ?? this.id,
      title: title ?? this.title,
      organizationId: organizationId ?? this.organizationId,
      userId: userId ?? this.userId,
      parentId: parentId ?? this.parentId,
      number: number ?? this.number,
    );
  }
}
