import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTexfeild extends StatefulWidget {
  final String? Function(String?)? validator;
  final TextEditingController controller;
  final void Function()? onPressed;
  final String hinttext;
  final bool obscuretext;
  final IconData? icon;

  CustomTexfeild({
    super.key,
    required this.validator,
    required this.hinttext,
    required this.controller,
    required this.obscuretext,
    this.onPressed,
    this.icon,
  });

  @override
  _CustomTexfeildState createState() => _CustomTexfeildState();
}

class _CustomTexfeildState extends State<CustomTexfeild> {
  final FocusNode _focusNode = FocusNode();

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextFormField(
        focusNode: _focusNode,
        validator: widget.validator,
        controller: widget.controller,
        obscureText: widget.obscuretext,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          isDense: true,
          focusedErrorBorder: OutlineInputBorder(borderSide: BorderSide.none),
          errorBorder: OutlineInputBorder(borderSide: BorderSide.none),
          focusedBorder: OutlineInputBorder(borderSide: BorderSide.none),
          enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide: BorderSide(color: Colors.white),
          ),
          hintStyle: GoogleFonts.inter(
            textStyle: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 14.sp,
                color: Color(0xffB3B3B3)),
          ),
          hintText: widget.hinttext,
          suffixIcon:
              IconButton(onPressed: widget.onPressed, icon: Icon(widget.icon)),
        ),
      ),
    );
  }
}
