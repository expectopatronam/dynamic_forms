import 'package:dynamic_forms/models.dart';
import 'package:dynamic_forms/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CompanyForm extends StatefulWidget {
  final GlobalKey<FormState> formKey;

  const CompanyForm({Key? key, required this.formKey}) : super(key: key);

  @override
  State<CompanyForm> createState() => _CompanyFormState();
}

class _CompanyFormState extends State<CompanyForm> {
  late TextEditingController _nameController;
  late TextEditingController _cityController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: "SS Biriyani");
    _cityController = TextEditingController(text: "Trichy");
  }

  @override
  void dispose() {
    _nameController.dispose();
    _cityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
   var provider = Provider.of<Data>(context);
    return Container(
      padding:const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.blue.shade100
      ),
      width: 600,
      height: 150,
      child: Form(
        key: widget.formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Company Name'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter company name';
                }
                return null;
              },
            ),
            const SizedBox(height: 10,),
            TextFormField(
              controller: _cityController,
              decoration: const InputDecoration(labelText: 'City'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter city';
                }
                return null;
              },
              onSaved: (value){
                Company _company = Company(name: _nameController.text, city: _cityController.text, branches: []);
                provider.saveCompany(_company);
              },
            ),
            
          ],
        ),
      ),
    );
  }
}



