// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:hive_flutter/hive_flutter.dart';

class UserModel {
  String name;
  String password;
  String phoneNumber;
  String? email;
  int? dayBirth;
  int? monthBirth;
  int? yearBirth;
  UserModel({
    required this.name,
    required this.password,
    required this.phoneNumber,
    this.email,
    this.dayBirth,
    this.monthBirth,
    this.yearBirth,
  });

  UserModel copyWith({
    String? name,
    String? password,
    String? phoneNumber,
    String? email,
    int? dayBirth,
    int? monthBirth,
    int? yearBirth,
  }) {
    return UserModel(
      name: name ?? this.name,
      password: password ?? this.password,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      email: email ?? this.email,
      dayBirth: dayBirth ?? this.dayBirth,
      monthBirth: monthBirth ?? this.monthBirth,
      yearBirth: yearBirth ?? this.yearBirth,
    );
  }

  @override
  String toString() {
    return 'UserModel(name: $name, password: $password, '
        'phoneNumber: $phoneNumber, email: $email, '
        'dayBirth: $dayBirth, monthBirth: $monthBirth, '
        'yearBirth: $yearBirth)';
  }
}

class UserModelAdapter extends TypeAdapter<UserModel> {
  @override
  final typeId = 0;

  @override
  UserModel read(BinaryReader reader) {
    // final id = reader.readInt();
    final firstname = reader.readString();
    final phoneNumber = reader.readString();
    final email = reader.readString();
    final dayBirth = reader.readInt();
    final monthBirth = reader.readInt();
    final yearBirth = reader.readInt();
    return UserModel(
      name: firstname,
      password: 'password',
      phoneNumber: phoneNumber,
      email: email,
      dayBirth: dayBirth,
      monthBirth: monthBirth,
      yearBirth: yearBirth,
    );
  }

  @override
  void write(BinaryWriter writer, UserModel obj) {
    // writer.writeInt(obj.id);
    writer.writeString(obj.name);
    writer.writeString('password');
    writer.writeString(obj.phoneNumber);
    writer.writeString(obj.email ?? '');
    writer.writeInt(obj.dayBirth ?? 0);
    writer.writeInt(obj.monthBirth ?? 0);
    writer.writeInt(obj.yearBirth ?? 0);
  }
}
