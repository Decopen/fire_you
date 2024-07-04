import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class GoogleWhatsappWidgets extends StatefulWidget {
  final bool isGoogle;
  final Color couleur;
  final String text;
  final VoidCallback action;
  const GoogleWhatsappWidgets({
    super.key,
    required this.text,
    required this.isGoogle,
    required this.couleur,
    required this.action,
  });

  @override
  State<GoogleWhatsappWidgets> createState() => _GoogleWhatsappWidgetsState();
}

class _GoogleWhatsappWidgetsState extends State<GoogleWhatsappWidgets> {
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
        child: !widget.isGoogle
            ? Row(
                children: [
                  const Icon(
                    Icons.call,
                    size: 24,
                    color: Colors.white,
                  ),
                  const Gap(30),
                  Text(
                    widget.text,
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w700),
                  )
                ],
              )
            : Row(
                children: [
                  const Text(
                    "G",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w600),
                  ),
                  const Gap(30),
                  Text(
                    widget.text,
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w700),
                  )
                ],
              ),
      ),
    );
  }
}
