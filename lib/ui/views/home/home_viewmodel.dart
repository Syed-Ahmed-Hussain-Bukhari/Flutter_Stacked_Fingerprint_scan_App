import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:stacked/stacked.dart';

class homeViewModel extends BaseViewModel{
   final LocalAuthentication _auth=LocalAuthentication();
   bool myAuthentication=false;

   authentication()async {
    if(!myAuthentication){
      final bool canAuthWithBio=await _auth.canCheckBiometrics;
      if(canAuthWithBio){
        try{
           bool didAuthenticate=await _auth.authenticate(localizedReason: "please authenticate using your fingerprint or pattern",options: AuthenticationOptions(
            biometricOnly: false
           ));

           myAuthentication=true;
          //  rebuildUi();
          notifyListeners();
        }catch(e){
          print(e);
        }

      }else{
        myAuthentication=false;
        // rebuildUi();
        notifyListeners();
      }
    }
    // rebuildUi();
    
   }
  
   authenticateCode(){
    return Column(
          mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              margin: EdgeInsets.only(left: 40,right: 40),
              child: Center(
                child: Text("To view the Ludo board,",style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black
                ),),
              ),
            ),
          ),
           Center(
            child: Container(
              margin: EdgeInsets.only(left: 40,right: 40),
              child: Center(
                child: Text("please authenticate using your ",style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black
                ),),
              ),
            ),
            ),
            Center(
            child: Container(
              margin: EdgeInsets.only(left: 40,right: 40),
              child: Center(
                child: Text("fingerprint or pattern ",style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black
                ),),
              ),
            ),
            ),
            InkWell(
              onTap: (){
                authentication();
              },
              child: Image.network("https://th.bing.com/th/id/OIP.prMpfLdaF9mAGYM1WkbkQwAAAA?pid=ImgDet&w=192&h=193&c=7&dpr=1.7",width: 150,))
        ],
        );


   }

    myLudoPic(){
      return Center(child: Image.network("https://images-na.ssl-images-amazon.com/images/I/71i4bTQsoPL.png"));
    }

}