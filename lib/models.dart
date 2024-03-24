class Company {
  String name;
  String city;
  List<Branch?> branches = [];

  Company({
    required this.name,
    required this.city,
     required this.branches,
  });


}


class Branch {
  String branchName;
  String branchCity;
  String branchCode;

  Branch({
    required this.branchName,
    required this.branchCity,
    required this.branchCode
  });
}
