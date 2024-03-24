import 'package:hive/hive.dart';

part 'hive_models.g.dart';

@HiveType(typeId: 0)
class CompanyHive extends HiveObject {
  @HiveField(0)
  String name;

  @HiveField(1)
  String city;

  @HiveField(2)
  List<BranchHive> branches;

  CompanyHive({
    required this.name,
    required this.city,
    required this.branches,
  });
}

@HiveType(typeId: 1)
class BranchHive extends HiveObject {
  @HiveField(0)
  String branchName;

  @HiveField(1)
  String branchCity;

  @HiveField(2)
  String branchCode;

  BranchHive({
    required this.branchName,
    required this.branchCity,
    required this.branchCode,
  });
}
