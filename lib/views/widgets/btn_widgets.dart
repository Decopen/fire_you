import 'package:flutter/material.dart';

class BtnWidgets extends StatefulWidget {
  final String text;
  final Color couleur;
  final VoidCallback action;
  const BtnWidgets(
      {super.key,
      required this.text,
      required this.couleur,
      required this.action});
  @override
  State<BtnWidgets> createState() => _BtnWidgetsState();
}

class _BtnWidgetsState extends State<BtnWidgets> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: MediaQuery.sizeOf(context).width,
      child: ElevatedButton(
        onPressed: () {
          widget.action();
        },
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
          backgroundColor: widget.couleur,
        ),
        child: Text(
          widget.text,
          style:
              const TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
