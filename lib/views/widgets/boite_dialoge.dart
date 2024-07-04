import 'package:fire_youtube/views/widgets/btn_widgets.dart';
import 'package:fire_youtube/views/widgets/input_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';

class BoiteDialoge extends StatefulWidget {
  final String text;
  final Color couleur;
  final String buttonName;
  final String hin;
  final String errorMessage;
  final Icon icon;
  final TextEditingController controler;
  const BoiteDialoge({
    super.key,
    required this.text,
    required this.couleur,
    required this.buttonName,
    required this.hin,
    required this.icon,
    required this.errorMessage,
    required this.controler,
  });
  @override
  State<BoiteDialoge> createState() => _BoiteDialogeState();
}

class _BoiteDialogeState extends State<BoiteDialoge> {
  @override
  final _formKey = GlobalKey<FormState>();
  bool isCorrect = false;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: AlertDialog(
        content: Container(
          padding: const EdgeInsets.all(10),
          width: MediaQuery.sizeOf(context).width * 0.8,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                widget.text,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const Gap(10),
              InputWidget(
                controller: widget.controler,
                isPasswod: false,
                text: widget.hin,
                icon: widget.icon,
                errorMessage: widget.errorMessage,
              ),
              const Gap(10),
              SizedBox(
                width: 125,
                child: BtnWidgets(
                  text: widget.buttonName,
                  couleur: widget.couleur,
                  action: () {
                    if (_formKey.currentState!.validate()) {
                      setState(() {
                        isCorrect = !isCorrect;
                      });
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
