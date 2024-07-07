import 'package:flutter/material.dart';
import 'package:my_biometric_authentication/ui/views/home/home_viewmodel.dart';
import 'package:stacked/stacked.dart';

class MyHomeApp extends StatefulWidget {
  const MyHomeApp({super.key});

  @override
  State<MyHomeApp> createState() => _MyHomeAppState();
}

class _MyHomeAppState extends State<MyHomeApp> {
  
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.nonReactive(
      
      viewModelBuilder:()=>homeViewModel() , builder: (context,viewModel,child){
      return Scaffold(
        appBar: AppBar(
        title: Text("Ludo Board by Syed Ahmed"),
        centerTitle:true,
        backgroundColor: Color.fromARGB(255, 0, 243, 223),
        ),
        body: viewModel.myAuthentication==true? viewModel.myLudoPic():viewModel.authenticateCode()
        ,
      );
    });
  }
}