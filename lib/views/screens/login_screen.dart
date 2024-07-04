import 'package:fire_youtube/models/user_model.dart';
import 'package:fire_youtube/services/user_services.dart';
import 'package:fire_youtube/views/screens/home_screen.dart';
import 'package:fire_youtube/views/screens/signup_screen.dart';
import 'package:fire_youtube/views/widgets/boite_dialoge.dart';
import 'package:fire_youtube/views/widgets/btn_widgets.dart';
import 'package:fire_youtube/views/widgets/google_whatsapp_widgets.dart';
import 'package:fire_youtube/views/widgets/input_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  void ouvrirBoitEmail() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return BoiteDialoge(
          controler: _emailController,
          buttonName: "send",
          couleur: Colors.blue,
          errorMessage: "Email is requirer",
          hin: "Email",
          text: "Password Athentification",
          icon: const Icon(Icons.email),
        );
      },
    );
  }

  void ouvrirBoitWhatshapp() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return BoiteDialoge(
          controler: _phoneNumberController,
          buttonName: "send code",
          couleur: Colors.green,
          errorMessage: "phone number is required",
          hin: "Number phone",
          text: "Phone Authentictication",
          icon: const Icon(Icons.call),
        );
      },
    );
  }

  // void openErrorDialog() {
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         content: Container(
  //           padding: const EdgeInsets.all(10),
  //           width: MediaQuery.sizeOf(context).width * 0.8,
  //           child: Column(
  //             mainAxisSize: MainAxisSize.min,
  //             children: [
  //               const Text(
  //                 "Attention!",
  //                 style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
  //               ),
  //               const Gap(10),
  //               const Text(
  //                 "Wrong email or password",
  //                 style: TextStyle(
  //                     fontSize: 12,
  //                     fontWeight: FontWeight.w400,
  //                     color: Colors.red),
  //               ),
  //               const Gap(10),
  //               SizedBox(
  //                 width: 125,
  //                 child: BtnWidgets(
  //                   text: "ok",
  //                   couleur: Colors.red,
  //                   action: () {
  //                     Navigator.pop(context);
  //                   },
  //                 ),
  //               )
  //             ],
  //           ),
  //         ),
  //       );
  //     },
  //   );
  // }

  void isLoad() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.blue,
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    double hauteur = MediaQuery.sizeOf(context).height;
    double largeur = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: Form(
        key: _formKey,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              height: hauteur,
              width: largeur,
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 0, horizontal: 12),
                child: Column(
                  children: [
                    SizedBox(
                      height: hauteur * 0.4,
                      width: largeur,
                      child: Image.asset(
                        "assets/login.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                    InputWidget(
                      controller: _emailController,
                      errorMessage: "Email is required",
                      isPasswod: false,
                      text: "Enter your email",
                      icon: const Icon(Icons.email),
                    ),
                    const Gap(10),
                    InputWidget(
                      controller: _passwordController,
                      errorMessage: "Password is required",
                      isPasswod: true,
                      text: "Enter your password",
                      icon: const Icon(Icons.lock),
                    ),
                    GestureDetector(
                      onTap: () {
                        ouvrirBoitEmail();
                      },
                      child: SizedBox(
                        width: largeur * 0.90,
                        height: hauteur * 0.03,
                        child: const Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            "Forgot password?",
                            style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Gap(10),
                    BtnWidgets(
                      text: "Login",
                      couleur: Colors.blue,
                      action: () async {
                        if (_formKey.currentState!.validate()) {
                          isLoad();
                          UserModel? user = await UserServices.login(
                              _emailController.text, _passwordController.text);
                          if (user == null) {
                            Navigator.pop(context);
                          } else {
                            Navigator.pop(context);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const HomeScreen()));
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text("Welcome Mrs/Ms ${user.name}")));
                            setState(
                              () {
                                _emailController.text = "";
                                _passwordController.text = "";
                              },
                            );
                          }
                        }
                      },
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Divider(
                            height: 2,
                            color: Colors.black45,
                            thickness: 1,
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                          child: Text("Or"),
                        ),
                        Expanded(
                          child: Divider(
                            height: 2,
                            color: Colors.black45,
                            thickness: 1,
                          ),
                        ),
                      ],
                    ),
                    const Gap(5),
                    GoogleWhatsappWidgets(
                      text: "Conytinue with google",
                      isGoogle: true,
                      couleur: Colors.deepPurple.shade500,
                      action: () {},
                    ),
                    const Gap(10),
                    GoogleWhatsappWidgets(
                      text: "Sign in with phone",
                      isGoogle: false,
                      couleur: Colors.green,
                      action: () {
                        ouvrirBoitWhatshapp();
                      },
                    ),
                    const Gap(10),
                    SizedBox(
                      width: largeur * 0.90,
                      height: hauteur * 0.03,
                      child: Align(
                        alignment: Alignment.center,
                        child: RichText(
                          text: TextSpan(
                            text: "Don't have an account?",
                            style: const TextStyle(
                              color: Colors
                                  .black, // Définir la couleur du texte principal
                              fontSize: 16, // Taille de police par défaut
                            ),
                            children: [
                              TextSpan(
                                text: " Sign Up",
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Colors
                                      .blue, // Couleur du texte pour "Sign Up"
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const SignupScreen(),
                                      ),
                                    );
                                  },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
