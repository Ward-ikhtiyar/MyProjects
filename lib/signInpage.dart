import 'package:flutter/material.dart';
import 'package:SpeedOrder/main.dart';
import 'package:provider/provider.dart';

class Sign_in_Page extends StatefulWidget {
  const Sign_in_Page({super.key});

  @override
  State<Sign_in_Page> createState() => _sp();
}

class _sp extends State<Sign_in_Page> {
  final formkey = GlobalKey<FormState>();
  List userList = [
    {"number": "0931754165", "pass": "ward"}
  ];
  String? enteredNumber;
  String? enteredPass;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Welcome !",
          style: TextStyle(fontWeight: FontWeight.w800),
        ),
        elevation: 0,
        shadowColor: Colors.black,
      ),
      body: Padding(
        padding: EdgeInsets.only(
          top: context.read<Model>().screenHeight(context) * 0.13,
          left: context.read<Model>().screenWidth(context) * 0.1,
          right: context.read<Model>().screenWidth(context) * 0.1,
        ),
        child: Center(
          child: Column(
            children: [
              const Text(
                "SpeedOrder",
                style: TextStyle(fontWeight: FontWeight.w800, fontSize: 50),
              ),
              SizedBox(
                height: context.read<Model>().screenHeight(context) * 0.005,
              ),
              const Text(
                "Where Quality and Efficiency Meet.",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: context.read<Model>().screenHeight(context) * 0.03,
              ),
              Form(
                  key: formkey,
                  child: TextFormField(
                    validator: (val) {
                      if (val!.length >= 2) {
                        if (val[0] != '0' && val[1] != '9') {
                          return "Number Should Start with \"09\"";
                        }
                      }
                      if (val.length != 10 && val.isNotEmpty) {
                        return "Input should be 10 numbers";
                      }
                      return null;
                    },
                    onChanged: (val) {
                      enteredNumber = val;
                      formkey.currentState!.validate();
                    },
                    maxLength: 10,
                    keyboardType: const TextInputType.numberWithOptions(),
                    decoration: const InputDecoration(
                        labelText: "Enter Number",
                        labelStyle: TextStyle(color: Colors.black),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide: BorderSide(color: Colors.black))),
                  )),
              SizedBox(
                height: context.read<Model>().screenHeight(context) * 0.015,
              ),
              Form(
                  child: TextFormField(
                onChanged: (val) {
                  enteredPass = val;
                },
                decoration: const InputDecoration(
                    labelText: "Enter PassWord",
                    labelStyle: TextStyle(color: Colors.black),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide: BorderSide(color: Colors.black))),
              )),
              MaterialButton(
                onPressed: () {},
                child: const Text("Forgot Password?"),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      showModalBottomSheet(
                          showDragHandle: true,
                          isScrollControlled: true,
                          context: context,
                          builder: (context) {
                            return const SignUpBottomSheet();
                          });
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5))),
                    child: const Text(
                      "Register",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      if (enteredNumber == userList[0]["number"] &&
                          enteredPass == userList[0]["pass"]) {
                        context.read<Model>().Logintrue();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                            side: const BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(5))),
                    child: const Text(
                      "Sign in",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: context.read<Model>().screenHeight(context) * 0.01,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  MaterialButton(
                    onPressed: () {},
                    child: SizedBox(
                      width: 35,
                      height: 35,
                      child: Image.asset("images/insta.jpg"),
                    ),
                  ),
                  MaterialButton(
                    onPressed: () {},
                    child: const Icon(
                      Icons.facebook,
                      size: 40,
                    ),
                  ),
                  MaterialButton(
                    onPressed: () {},
                    child: SizedBox(
                      width: 33,
                      height: 33,
                      child: Image.asset("images/globe.jpg"),
                    ),
                  )
                ],
              ),
              Center(
                child: SizedBox(
                    width: 80,
                    height: 80,
                    child: Image.asset("images/icon.jpg")),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SignUpBottomSheet extends StatefulWidget {
  const SignUpBottomSheet({super.key});

  @override
  State<SignUpBottomSheet> createState() => _SignUpBottomSheetState();
}

class _SignUpBottomSheetState extends State<SignUpBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.read<Model>().screenHeight(context) * 0.90,
      child: StatefulBuilder(builder: (context, setState) {
        return ListView(
          physics: const NeverScrollableScrollPhysics(),
          children: [
            Container(
              decoration: const BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.black))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text(
                    " Enter Your info:",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
                  ),
                  ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5))),
                      child: const Icon(
                        Icons.check,
                      ))
                ],
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.black))),
              padding: EdgeInsets.symmetric(
                  horizontal: context.read<Model>().screenWidth(context) * 0.1),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: 120,
                    height: 120,
                    child: MaterialButton(
                      onPressed: () {},
                      shape: const CircleBorder(),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(45),
                          child: Ink.image(
                            image: const AssetImage("images/addpfp.jpg"),
                            fit: BoxFit.cover,
                          )),
                    ),
                  ),
                  const Text(
                    "Add Photo",
                    style: TextStyle(
                        fontSize: 24,
                        color: Colors.black,
                        fontWeight: FontWeight.w800),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                  vertical: context.read<Model>().screenHeight(context) * 0.03),
              decoration: const BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.black))),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: 140,
                    height: 50,
                    child: TextField(
                        decoration: InputDecoration(
                            hintText: "FirstName",
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                            ),
                            focusedBorder: OutlineInputBorder())),
                  ),
                  SizedBox(
                    width: 140,
                    height: 50,
                    child: TextField(
                        decoration: InputDecoration(
                            hintText: "LastName",
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                            ),
                            focusedBorder: OutlineInputBorder())),
                  )
                ],
              ),
            ),
            const Padding(
                padding: EdgeInsets.only(
                    top: 20, left: 20.0, right: 20, bottom: 10.0),
                child: TextField(
                    maxLength: 10,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.call_outlined),
                        hintText: "Number",
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        focusedBorder: OutlineInputBorder()))),
            const Padding(
              padding: EdgeInsets.only(left: 20.0, right: 20, bottom: 20.0),
              child: TextField(
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.key),
                      hintText: "Password",
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      focusedBorder: OutlineInputBorder())),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.location_pin),
                      hintText: "Location",
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      focusedBorder: OutlineInputBorder())),
            ),
          ],
        );
      }),
    );
  }
}
