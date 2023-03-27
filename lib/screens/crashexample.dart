import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

const testingcrashlytics = true;

class CrashExample extends StatefulWidget {
  const CrashExample({super.key});

  @override
  State<CrashExample> createState() => _CrashExampleState();
}

class _CrashExampleState extends State<CrashExample> {
  Future<void> futuremethod() async {
    await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);

  /*   if (testingcrashlytics) {
      
    } else {
      await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(false);
      print("object");
    } */
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Directionality(
          textDirection: TextDirection.ltr,
          child: FutureBuilder(
            future: futuremethod(),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.done:
                  if (snapshot.hasError) {
                    Center(child: Text("${snapshot.error}"));
                  }
                  return Container(
                    child: Center(
                      child: ElevatedButton(onPressed: () {
                        // setting custom key 
                        // check the key in firebase console
                        FirebaseCrashlytics.instance.setCustomKey("customkey", "crashing");
                        // bottom sheet
                        
                       ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text(
                                  'Custom Key "example: flutterfire" has been set \n'
                                  'Key will appear in Firebase Console once an error has been reported.'),
                              duration: Duration(seconds: 5),
                            ));  
                      }, child: Text("key")),
                    ),
                  );
    
                default:
                  return Text("data");
              }
            },
          )),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
}

 /*  Future<List> futurebuilder() async {
    await Future.delayed(Duration(seconds: 3));
    return ["swathi", 2251];


    UI
     Container(
          child: FutureBuilder(
            future: futurebuilder(),
            builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              }
              if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              return Container(
                child: Text("hiii"),
              );
            },
          ),
        )
   
  } */