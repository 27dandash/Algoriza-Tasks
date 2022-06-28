import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:test3/components/components.dart';
import 'package:test3/login/login_screen.dart';

class Signup extends StatefulWidget {
  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final TextEditingController _phonenumber = TextEditingController();

  final TextEditingController _RepetpasswordController =
      TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isPassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            Form(
              key: formKey,
              child: Column(
                  children: [
                Stack(
                  children: <Widget>[
                    Container(


                        height: 240,
                        child: const Image(image: AssetImage('assets/images/on_board2.png',),height: 6000,width: 10000,
                        ),

                    ),
                     Align(
                      alignment: Alignment.bottomLeft,
                      child: Container(
                       width: 35,height: 35,
                        decoration: const BoxDecoration(

                          color: Colors.black,
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),

                          child: Icon(Icons.arrow_back_ios_new,color: Colors.white,)),
                    )
                  ],
                ),
                Row(
                  children: const [
                    Text(
                      'Welcome To Fashion Daily',
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: const [
                    Text('Register',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    Spacer(),
                    Text('Help',
                        style: TextStyle(fontSize: 18, color: Colors.blue)),
                    Icon(
                      Icons.help,
                      color: Colors.blue,
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: const [
                    Text(
                      'Email',
                      style: TextStyle(fontSize: 15),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                defaultFormField(
                  validate: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Your email';
                    }
                    return null;
                  },
                  label: 'Email',
                  type: TextInputType.emailAddress,
                  controller:  _emailController,

                ),

                const SizedBox(height: 7),
                Row(
                  children: const [Text('Phone Number',
                    style: TextStyle(fontSize: 15),)],
                ),
                Container(
                  decoration:  BoxDecoration(

                    border: Border.all(
                      color: Colors.black,
                      width: 1,
                  ),),
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
                          width: 236,
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
                                borderSide: BorderSide(color: Colors.orange),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.red),
                              ),
                            ),
                          )),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: const [Text('Password',
                    style: TextStyle(fontSize: 15),)],
                ),
                const SizedBox(height: 10,),
                defaultFormField(
                  validate: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Repeat Your Password';
                    }
                    return null;
                  },
                  suffix: isPassword
                      ? Icons.visibility_off
                      : Icons.visibility,
                  isPassword: isPassword,
                  suffixPressed: () {
                    setState(() {
                      isPassword = !isPassword;
                    });
                  },
                  label: ' Password',
                  type: TextInputType.visiblePassword,
                  controller:  _passwordController,

                ),

                const SizedBox(height: 20),
                defaultButton(
              background: Colors.blue,
                  function: (){
                    if (formKey.currentState!.validate()) {
                      print("${_emailController.text}");
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return LoginScreen();
                        },
                      ));
                    }
                  },
                  textcolor: Colors.white,
                  text:  "Register",
                  width: double.infinity,
                ),
                const SizedBox(height: 10,),
                const Center(
                  child: Text('Or',style: TextStyle(fontSize: 15),),
                ),
                const SizedBox(height: 10,),
                myDivider(

                ),
                defaultButton(
                  background: Colors.white,
                  function: (){
                    if (formKey.currentState!.validate()) {
                      print("${_emailController.text}");
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return LoginScreen();
                        },
                      ));
                    }
                  },
                  textcolor: Colors.blue,
                  text:  "sign with by google",
                  width: double.infinity,
                ),

                Row(children: [
                  SizedBox(width: 25,),
                  Text("     Has any account ?",style: TextStyle(fontSize: 17),),
                  TextButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context){return LoginScreen();}));
                  }, child: Text("Sign in Here",style: TextStyle(fontSize: 17),))
                ],),
                const SizedBox(
                  height: 25,
                ),
                Row(children: [
                  Text("    By regestering your account , you are agree  to our",style: TextStyle(fontSize: 14,color: Colors.grey),),

                ],),
                const SizedBox(height: 10,),
                const Center(
                  child:                       Text("    terms and condition",style: TextStyle(fontSize: 14 ,color: Colors.blue),),

                ),

              ]),
            ),
          ],
        ),
      ),
    );
  }
}
