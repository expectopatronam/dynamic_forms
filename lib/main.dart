import 'package:dynamic_forms/branchForm.dart';
import 'package:dynamic_forms/companyForm.dart';
import 'package:dynamic_forms/provider.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

void main() async{
   WidgetsFlutterBinding.ensureInitialized();
 await Hive.initFlutter();
  runApp(ChangeNotifierProvider(
    create: (context) => Data(),
    child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
         inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.deepPurple),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.deepPurple),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.deepPurple),
          ),
          errorBorder:  OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
          ),)
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

  List<dynamic> branchList = [];
  List<GlobalKey<FormState>> keyList = [];
class _MyHomePageState extends State<MyHomePage> {

  

  addKey() {
    keyList.add(GlobalKey<FormState>());
  }

  @override
  void initState() {
    setState(() {
    addKey();
    branchList.add(CompanyForm(formKey: keyList[0]));
      
    });
    super.initState();
  }

  addForm(){
    setState(() {
      
    addKey();
    branchList.add(BranchForm(formKey: keyList.last,index:branchList.length));
    });
  }

  resetForms(){
    for (int i = 1; i <branchList.length;i++){
      branchList.removeAt(i);
    }
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Consumer<Data>(
        builder: (context, _provider, child) => 
        Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ...branchList,
                const SizedBox(height: 10,),
                ElevatedButton(
                    onPressed: () {
                      bool allFormsValid = true;
                      for (var key in keyList) {
                        if (!key.currentState!.validate()) {
                          allFormsValid = false;
                        }
                      }
                    
                      if (allFormsValid) {
                        for (var key in keyList) {
                          key.currentState!.save();
                          key.currentState!.reset();
                          if(branchList.length>1)
                          {resetForms();}
                        }

                      }
                    },
                    child: const Text("Save")),
                   const SizedBox(height: 20,),
                    DataTable(columns: const [
                    DataColumn(label: Text('Name')),
                    DataColumn(label: Text('City')),
                    DataColumn(label: Text('Branches')),
                  ], rows: _provider.companyList.map((company) {
                    return DataRow(cells: [
                      DataCell(Text(company.name)),
                      DataCell(Text(company.city)),
                      DataCell(Text('${company.branches.length}')),
                    ]);
                  }).toList(),)
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addForm,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
