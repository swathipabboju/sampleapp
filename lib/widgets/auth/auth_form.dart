import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class AuthForm extends StatefulWidget {
  const AuthForm({super.key, required this.submitfn});

  final void Function(
      String email, String username, String password, bool islogin) submitfn;

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  double num = 9;
  double num1 = 0;
  void _firebasecrash() async {
    /* 2  if (kDebugMode) {
      FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(false);
    } else {
      FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
    } */
  }
  void productview(int productid) {
    // FirebaseCrashlytics.instance.crash();
    FirebaseCrashlytics.instance
        .setCustomKey("productId", productid.toString());
  }

  void crashhandler(e, s) {
    FirebaseCrashlytics.instance.recordError(e, null);
  }

  final formkey = GlobalKey<FormState>();
  String? email;
  String? username;
  String? password;
  var islogin = true;
  void trysubmit() {
    final isValid = formkey.currentState?.validate();
    FocusScope.of(context).unfocus();
    if (isValid == true) {
      formkey.currentState?.save();
      // widget.submitfn();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Card(
      child: SingleChildScrollView(
        child: Form(
          key: formkey,
          child: Column(
            children: [
              TextFormField(
                key: ValueKey("email"),
                onSaved: (newValue) {
                  email = newValue;
                },
                validator: (value) {
                  if (value!.isEmpty || !value.contains('@')) {
                    return "please enter valid email address";
                  } else {
                    null;
                  }
                },
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(labelText: "email address"),
              ),
              TextFormField(
                key: ValueKey("username"),
                onSaved: (newValue) {
                  username = newValue;
                },
                validator: (value) {
                  if (value!.isEmpty || value.length < 4) {
                    return "username must be atleast 4 characters";
                  } else {
                    null;
                  }
                },
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(labelText: "Username"),
              ),
              if (!islogin)
                TextFormField(
                  key: ValueKey("password"),
                  onSaved: (newValue) {
                    password = newValue;
                  },
                  validator: (value) {
                    if (value!.isEmpty || value.length < 7) {
                      return "password must be atleast 7 characters";
                    } else {
                      null;
                    }
                  },
                  decoration: const InputDecoration(labelText: "Password"),
                ),
                
              ElevatedButton(
                child: islogin ? const Text("Login") : const Text("Sign in"),
                onPressed: () {
                  /*  4  try{
                    FirebaseCrashlytics.instance.log("Higgs-Boson detected! Bailing out");
                    productview(123);
                    throw Exception("simulated crash");

                  }catch(error,stackTrace){
                    FirebaseCrashlytics.instance.setCustomKey("screen_name", "ProductDetailsScreen");
                     crashhandler(error, stackTrace);

                  } */

                  /* 2   try {
                    /*   var res = 1 ~/ 0;
                    print("res $res"); */
                    List list=[];
                    print(list[1]);
                  } catch (e) {
                    FirebaseCrashlytics.instance
                        .recordError(e, null, reason: 'a non-fatal error');
                  } */
                  // trysubmit();
                },
              ),
              TextButton(
                child: islogin
                    ? const Text("Create new account")
                    : const Text("I already have an account"),
                onPressed: () {
                  setState(() {
                    islogin = !islogin;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    ));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _firebasecrash();
    // FirebaseCrashlytics.instance.crash();
  }
}
