import 'package:flutter/material.dart';

class DefaultTextField extends StatelessWidget {
  Key? formKey;
  VoidCallback? onTap;
  TextEditingController? controller;
  TextStyle? style;
  bool isHidden;
  Function(String value)? onChanged;
  Function(String value)? onFieldSubmitted;
  TextInputType? type;
  String? hintText;
  IconData? suffix;
  IconData? prefix;
  Function()? suffixPressed;
  Color? cursorColor;
  String? Function(String? value)? validator;
  String? labelText;
      bool?   isEnabled ;

  DefaultTextField(
      {Key? key,
        this.isEnabled,
      this.onTap,
      this.controller,
      this.style,
      required this.isHidden,
      this.onChanged,
      this.onFieldSubmitted,
      this.type,
      this.hintText,
      this.suffix,
      this.prefix,
      this.suffixPressed,
      this.cursorColor,
      this.validator,
      this.labelText,
      this.formKey})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(15)),
      child: TextFormField(
        enabled: isEnabled,
          style: TextStyle(fontSize: 18,color: Colors.grey.shade400),
          obscureText: isHidden,
          onFieldSubmitted: onFieldSubmitted,
          validator: validator,
          key: key,
          controller: controller,
          onChanged: (String value) {},
          // cursorColor: Colors.grey.shade200,
          decoration: InputDecoration(
            filled: true,
              fillColor: Colors.grey.shade200,
              border:InputBorder.none,
              // focusedErrorBorder: OutlineInputBorder(
              //     borderRadius: BorderRadius.circular(15.0),
              //     // borderSide: BorderSide(color: Theme.of(context).primaryColor)
              // ),
              // errorBorder: OutlineInputBorder(
              //     borderRadius: BorderRadius.circular(15.0),
              //     // borderSide: BorderSide(color: Theme.of(context).primaryColor)
              // ),
              // enabledBorder: OutlineInputBorder(
              //     borderRadius: BorderRadius.circular(15.0),
              //     // borderSide: BorderSide(color: Theme.of(context).primaryColor)
              // ),
              labelText: labelText,
              hintStyle: TextStyle(color:Colors.grey.shade500 ,fontSize: 18),
              labelStyle: TextStyle(color: Theme.of(context).primaryColor),
              hintText: hintText,

              // hintText: hintText,
              prefixIcon: Icon(prefix, color: Theme.of(context).primaryColor),
              suffixIcon: InkWell(
                onTap: suffixPressed,
                child: Icon(
                  suffix,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 20,horizontal: 1)) // border: InputBorder.none,
          ),
    );
  }
}
