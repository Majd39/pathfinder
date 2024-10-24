import 'package:flutter/material.dart';

class CustomFieldForm extends StatelessWidget {
  CustomFieldForm({
    Key? key,
    this.validator,
    this.obscureText = false,
    this.hight = 45,
    this.width = 300,
    this.radius = 10,
    this.keybourdtype = TextInputType.name,
    this.lable = '',
    this.paddingleft = 30,
    this.paddingright = 30,
    this.paddingtop = 0,
    this.paddingbottom = 20,
    this.hinttext = '',
    required this.suffixIcon,
    this.readOnly = false,
    this.enabledBorder = const OutlineInputBorder(
      gapPadding: 2,
      borderRadius: BorderRadius.all(Radius.circular(20.0)),
      borderSide: BorderSide(color: Colors.black12),
    ),
    this.focusedBorder = const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(20.0)),
      borderSide: BorderSide(color: Colors.blue),
    ),
    this.color = Colors.black12,
    this.focusColor = Colors.blue,
    this.textcolor = Colors.black38,
    this.onTap,
    this.mycontroller,
    this.onChanged,
  }) : super(key: key);

  final Icon suffixIcon;
  final double hight;
  final double width;
  final String hinttext;
  final double paddingleft;
  final double paddingright;
  final double paddingtop;
  final double paddingbottom;
  final double radius;
  final TextInputType keybourdtype;
  final String lable;
  final bool readOnly;
  final InputBorder enabledBorder;
  final InputBorder focusedBorder;
  final Color color;
  final Color focusColor;
  final Color textcolor;
  final Function()? onTap;
  final Function(String)? onChanged;
  final TextEditingController? mycontroller;
  final String? Function(String?)? validator;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: paddingleft,
          right: paddingright,
          bottom: paddingbottom
      ),
      child: Container(
        height: hight,
        width: width,
        child: TextFormField(
          validator: validator,
          controller: mycontroller,  // Attach the controller
          onTap: onTap,
          obscureText: obscureText,
          onChanged: onChanged,
          readOnly: readOnly,
          decoration: InputDecoration(
            labelText: lable,
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
            ),
            filled: true,
            hintText: hinttext,
            hintStyle: TextStyle(color: textcolor),
            focusColor: focusColor,
            suffixIcon: suffixIcon,
            enabledBorder: enabledBorder,
            focusedBorder: focusedBorder,
          ),
          keyboardType: keybourdtype,
        ),
      ),
    );
  }
}
