import 'package:fire_youtube/services/user_services.dart';
import 'package:fire_youtube/views/screens/login_screen.dart';
import 'package:fire_youtube/views/widgets/btn_widgets.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextStyle sty = const TextStyle(
      fontWeight: FontWeight.w800, fontSize: 18, color: Colors.black);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Congratulation",
                style: sty,
              ),
              Text(
                "You have successfully Login",
                style: sty,
              ),
              BtnWidgets(
                action: () {
                  UserServices.logOut();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ),
                  );
                },
                text: "Log Out",
                couleur: Colors.blue,
              )
            ],
          ),
        ),
      ),
    );
  }
}
