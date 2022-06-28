import 'package:flutter/material.dart';

void navigateTo(context , widget)=>
    Navigator.push(context, MaterialPageRoute(
        builder: (context)=> widget));

void navigateFinish(context , widget)=>
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
        builder: (context)=> widget) , (Route<dynamic> route)=> false,);


Widget defaultButton({
  double width = double.infinity,
  required Color background ,

  required Color textcolor,
  double radius = 12.0,
  required Function() function,
  required String text,
}) =>
    Container(

      width: width,
      height: 50.0,
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(
          radius,
        ),

      ),
      child: OutlinedButton(

        onPressed: function,
        child: Text(
          text,
          style: TextStyle(
            color: textcolor,
          ),
        ),
      ),
    );

Widget myDivider() => Padding(
  padding: const EdgeInsetsDirectional.only(
    start: 20.0,
  ),
  child: Container(
    width: double.infinity,
    height: 1.0,
    color: Colors.grey[300],
  ),
);



Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType type,
  Function(String)? onSubmit,
  Function(String)? onChange,
  Function()? onTap,
  bool isPassword = false,
  required String? Function(String?)? validate,
  required String label,
   IconData ?prefix,
  IconData ? suffix,
  Function()? suffixPressed,
  bool isClickable = true,


}) =>
    TextFormField(

      cursorColor: Colors.orange,
      controller: controller,
      keyboardType: type,
      obscureText: isPassword,
      enabled: isClickable,
      onFieldSubmitted: onSubmit,
      onChanged: onChange,
      onTap: onTap,
      validator: validate,
      decoration: InputDecoration(

        labelStyle: TextStyle(color: Colors.grey),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.orange)),
        errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red)),
        labelText: label,
        prefixIcon: Icon(
          prefix,
        ),
        suffixIcon: suffix != null
            ? IconButton(
          onPressed: suffixPressed,
          icon: Icon(
            suffix,
          ),
        )
            : null,
        border: OutlineInputBorder(),
      ),
    );

