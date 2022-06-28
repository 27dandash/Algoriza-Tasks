import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test3/components/components.dart';
import 'package:test3/sign_up/signup.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final TextEditingController _phonenumber = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: Colors.grey[450],
        body: Padding(
            padding: EdgeInsets.all(20),
            child: SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: ListView(children: [
                Form(
                  key: formKey,
                  child: Column(children: [
                    const Image(
                      image: AssetImage(
                        'assets/images/on_board2.png',
                      ),

                    ),
                    Row(
                      children: const [
                        Text(
                          'Welcome To Fashion Daily',
                          style: TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: const [
                        Text('Sign in',
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold)),
                        Spacer(),
                        Text('Help',
                            style: TextStyle(fontSize: 18, color: Colors.blue)),
                        Icon(
                          Icons.help,
                          color: Colors.blue,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: const [
                        Text(
                          'Phone Number',
                          style: TextStyle(fontSize: 15),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          width: 1,
                        ),
                      ),
                      child: Row(
                        children: [
                          CountryCodePicker(
                            onChanged: print,
                            initialSelection: 'IT',
                            favorite: const ['+81', 'Ja'],
                            showCountryOnly: false,
                            showOnlyCountryWhenClosed: false,
                            alignLeft: false,
                          ),
                          // SizedBox(width: 10,),
                          SizedBox(
                              width: 246,
                              child: TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter Your phone number';
                                  }
                                  return null;
                                },
                                controller: _phonenumber,
                                obscureText: true,
                                keyboardType: TextInputType.visiblePassword,
                                cursorColor: Colors.orange,
                                decoration: const InputDecoration(
                                  labelText: 'Eg.812345678',
                                  labelStyle: TextStyle(color: Colors.grey),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.orange),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.red),
                                  ),
                                ),
                              )),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    defaultButton(
                      background: Colors.blue,
                      function: () {
                        if (formKey.currentState!.validate()) {
                          print("${_phonenumber.text}");
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return LoginScreen();
                            },
                          ));
                        }
                      },
                      textcolor: Colors.white,
                      text: "Register",
                      width: double.infinity,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Center(
                      child: Text(
                        'Or',
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    myDivider(),
                    defaultButton(
                      background: Colors.white,
                      function: () {
                        if (formKey.currentState!.validate()) {
                          print("${_phonenumber.text}");
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return LoginScreen();
                            },
                          ));
                        }
                      },
                      textcolor: Colors.blue,
                      text: "sign with by google",
                      width: double.infinity,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 25,
                        ),
                        Text(
                          "    Dosen/'t Has any account ?",
                          style: TextStyle(fontSize: 15),
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return Signup();
                              }));
                            },
                            child: Text(
                              "Register Here",
                              style: TextStyle(fontSize: 15),
                            ))
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Row(
                      children: [
                        Text(
                          "    Use the application according to policy rules. Any",
                          style: TextStyle(fontSize: 13, color: Colors.grey),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text(
                          "      kinds of violations will be subject  to sanctions.",
                          style: TextStyle(fontSize: 13, color: Colors.grey),
                        ),
                      ],
                    ),
                  ]),
                ),
              ]),
            )));
  }
}
