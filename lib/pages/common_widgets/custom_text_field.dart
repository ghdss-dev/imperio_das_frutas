import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Customtextfield extends StatefulWidget {
  final IconData icon;
  final String label;
  final bool issecret;
  final List<TextInputFormatter>? inputFormatters;
  final String? initialValue;
  final bool readOnly;

  const Customtextfield({super.key,
    required this.icon,
    required this.label,
    this.inputFormatters,
    this.issecret = false,
    this.initialValue,
    this.readOnly = false,
  });

  @override
  State<Customtextfield> createState() => _CustomtextfieldState();
}

class _CustomtextfieldState extends State<Customtextfield> {
  bool isobscure = false;
  @override
  void initState() {
    super.initState();
    isobscure = widget.issecret;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        readOnly: widget.readOnly,
        initialValue: widget.initialValue,
        inputFormatters: widget.inputFormatters,
        obscureText: isobscure,
        decoration: InputDecoration(
          prefixIcon: Icon(widget.icon),
          isDense: true,
          suffixIcon: widget.issecret
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      isobscure = !isobscure;
                    });
                  },
                  icon:
                      Icon(isobscure ? Icons.visibility : Icons.visibility_off))
              : null,
          labelText: widget.label,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(148)),
        ));
  }
}
