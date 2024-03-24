


import 'package:dynamic_forms/hive_models.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class Data extends ChangeNotifier{

 List<CompanyHive> _companyList = [
   CompanyHive(
    name: 'Main Company',
    city: 'New York',
    branches:[
    BranchHive(
      branchName: 'Branch 1',
      branchCity: 'New York',
      branchCode: 'NY001',
    ),
    BranchHive(
      branchName: 'Branch 2',
      branchCity: 'Los Angeles',
      branchCode: 'LA002',
    ),
    BranchHive(
      branchName: 'Branch 3',
      branchCity: 'Chicago',
      branchCode: 'CH003',
    ),
  ])];

  List<CompanyHive> get companyList => _companyList;

  saveCompany(CompanyHive company){
    _companyList.add(company);
    notifyListeners();
  }

  saveBranch(BranchHive branch){
    _companyList.last.branches.add(branch);
    notifyListeners();
  }

initHive()async{
  _companyList.clear();
  Box<CompanyHive> _box = await Hive.openBox<CompanyHive>("companyBox");
  _companyList = _box.values.toList();
}

}