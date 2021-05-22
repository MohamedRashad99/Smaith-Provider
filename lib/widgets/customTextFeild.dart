import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../constants.dart';

class CustomTextField extends StatefulWidget {
  final String hint;
  final bool label;
  final TextInputType type;
  final Function onsave;
  final Function valid;
  final IconData icon;
  final IconData eIcon;
  final TextEditingController controller;
  final Function onTap;
  final IconData dIcon;
  final FocusNode focus;
  final bool read;
  final bool line;
  final Function edit;
  final bool isEdit;

  CustomTextField({
    this.hint,
    this.onsave,
    this.onTap,
    this.icon,
    this.type = TextInputType.text,
    this.valid,
    this.controller,
    this.focus,
    this.dIcon,
    this.label,
    this.read,
    this.eIcon,
    this.edit,
    this.isEdit,
    this.line,
  });

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _isHidden = true;
  void _visibility() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 8),
      child: TextFormField(
        onTap: widget.onTap,
        validator: widget.valid,
        controller: widget.controller,
        cursorColor: kPrimaryColor,
        focusNode: widget.focus,
        readOnly: widget.read == true,
        maxLines: widget.line == true ? 7 : 1,
        obscureText: widget.icon == Icons.lock_outline ? _isHidden : false,
        keyboardType: widget.type,
        onChanged: (widget.onsave),
        style: TextStyle(fontSize: 14, color: kPrimaryColor),
        decoration: InputDecoration(
          hintText: widget.hint,
          prefixIcon: Icon(
            widget.dIcon,
            color: kPrimaryColor,
          ),
          labelText: widget.label == true ? "+966" : null,
          icon: widget.isEdit == true ? Icon(Icons.edit) : null,
          labelStyle: TextStyle(
            fontSize: 16,
            color: kPrimaryColor,
            fontFamily: "dinnextl bold",
          ),
          hintStyle: TextStyle(fontSize: 14, color: kTextColor, fontFamily: "dinnextl medium"),
          suffixIcon: widget.icon == Icons.lock_outline
              ? IconButton(
                  onPressed: _visibility,
                  alignment: Alignment.center,
                  icon: _isHidden
                      ? Icon(
                          Icons.visibility_off,
                          color: kTextColor,
                        )
                      : Icon(
                          Icons.visibility,
                          color: kPrimaryColor,
                        ),
                )
              : null,
          filled: true,
          //prefixText: widget.hint,
          fillColor: Colors.white,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: kPrimaryColor, width: 1),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: kPrimaryColor, width: 2),
            borderRadius: BorderRadius.circular(10),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
