
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({Key? key,required this.controller, this.enableSuffixIcon,required this.labelText}) : super(key: key);

  final TextEditingController controller;
  final String labelText;
  final bool ? enableSuffixIcon;
  @override
  Widget build(BuildContext context) {
    return  TextField(
      enableInteractiveSelection: false, // will disable paste operation
      controller: controller,
      style: const TextStyle(fontSize: 17,fontWeight: FontWeight.bold),

      decoration:  InputDecoration(

        suffixIcon: (enableSuffixIcon!=null)? Icon(Icons.arrow_drop_down_sharp,size: 35,color: Theme.of(context).primaryColor,):null,

        labelText: labelText,
        labelStyle:  TextStyle(fontSize: 23,color:Theme.of(context).primaryColor.withOpacity(0.7),fontWeight: FontWeight.bold,),
        enabledBorder:  UnderlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).primaryColor,width: 2),
        ),
        hintStyle: TextStyle(fontSize: 17,color: Theme.of(context).primaryColor.withOpacity(0.7),
        ),
      ),

    );
  }
}