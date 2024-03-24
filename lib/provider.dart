


import 'package:dynamic_forms/models.dart';
import 'package:flutter/material.dart';

class Data extends ChangeNotifier{

 final List<Company> _companyList = [
   Company(
    name: 'Main Company',
    city: 'New York',
    branches:[
    Branch(
      branchName: 'Branch 1',
      branchCity: 'New York',
      branchCode: 'NY001',
    ),
    Branch(
      branchName: 'Branch 2',
      branchCity: 'Los Angeles',
      branchCode: 'LA002',
    ),
    Branch(
      branchName: 'Branch 3',
      branchCity: 'Chicago',
      branchCode: 'CH003',
    ),
  ])];

  List<Company> get companyList => _companyList;

  saveCompany(Company company){
    _companyList.add(company);
    notifyListeners();
  }

  saveBranch(Branch branch){
    _companyList.last.branches.add(branch);
    notifyListeners();
  }
}