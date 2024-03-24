import 'package:dynamic_forms/main.dart';
import 'package:dynamic_forms/models.dart';
import 'package:dynamic_forms/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BranchForm extends StatefulWidget {
  final GlobalKey<FormState> formKey;

  final int index;

  const BranchForm({Key? key, required this.formKey, required this.index}) : super(key: key);

  @override
  State<BranchForm> createState() => _BranchFormState();
}

class _BranchFormState extends State<BranchForm> {
  late TextEditingController _branchNameController;
  late TextEditingController _branchCityController;
  late TextEditingController _branchCodeController;

  @override
  void initState() {
    super.initState();
    _branchNameController = TextEditingController(text: "Kolathur");
    _branchCityController = TextEditingController(text: "Chennai");
    _branchCodeController = TextEditingController(text: "001");
  }

  @override
  void dispose() {
    _branchNameController.dispose();
    _branchCityController.dispose();
    _branchCodeController.dispose();
    super.dispose();
  }

  clearForm(){
    setState(() {
    keyList[widget.index].currentState!.reset();
      
    });
  }

  removeForm() {
    setState(() {
    branchList.removeAt(widget.index);
    keyList.removeAt(widget.index);
    debugPrint("${widget.index}");
      
    });
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<Data>(context);
    return Container(
      padding:const EdgeInsets.all(8),
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.blue.shade100
      ),
      width: 600,
      // height: 200,
      child: Form(
        key: widget.formKey,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children:[
              ElevatedButton(onPressed: (){
clearForm();
              },child: const Text("Clear"),
              ),
              const SizedBox(width: 10,),
              ElevatedButton(onPressed: (){
                removeForm();
              },child: const Text("Remove"),
              )
              ]
            ),
            const SizedBox(height: 10,),
            TextFormField(
              controller: _branchNameController,
              decoration: const InputDecoration(labelText: 'Branch Name'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter branch name';
                }
                return null;
              },
            ),
            const SizedBox(height: 10,),
            TextFormField(
              controller: _branchCityController,
              decoration: const InputDecoration(labelText: 'City'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter city';
                }
                return null;
              },
            ),
            const SizedBox(height: 10,),
            TextFormField(
              controller: _branchCodeController,
              decoration: const InputDecoration(labelText: 'Branch Code'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter branch code';
                }
                return null;
              },
              onSaved: (value){
                Branch branch = Branch(branchName: _branchNameController.text, branchCity: _branchCityController.text, branchCode: _branchCodeController.text);
      provider.saveBranch(branch);
              },
            ),
            
          ],
        ),
      ),
    );
  }
}
