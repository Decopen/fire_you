import 'package:fire_youtube/models/user_model.dart';
import 'package:fire_youtube/views/screens/login_screen.dart';
import 'package:fire_youtube/services/user_services.dart';
import 'package:fire_youtube/views/widgets/btn_widgets.dart';
import 'package:fire_youtube/views/widgets/input_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
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
                        "assets/signup.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                    InputWidget(
                      controller: _nameController,
                      errorMessage: "Name is required",
                      isPasswod: false,
                      text: "Enter your name",
                      icon: const Icon(Icons.person),
                    ),
                    const Gap(20),
                    InputWidget(
                      controller: _emailController,
                      errorMessage: "Email is required",
                      isPasswod: false,
                      text: "Enter your Email",
                      icon: const Icon(Icons.email),
                    ),
                    const Gap(20),
                    InputWidget(
                      controller: _passwordController,
                      errorMessage: "Password is required",
                      isPasswod: true,
                      text: "Enter your password",
                      icon: const Icon(Icons.lock),
                    ),
                    const Gap(20),
                    BtnWidgets(
                      text: "Sign Up",
                      couleur: Colors.blue,
                      action: () async {
                        if (_formKey.currentState!.validate()) {
                          bool isRegister = await UserServices.register(
                            UserModel(
                              name: _nameController.text.trim(),
                              Email: _emailController.text.trim(),
                              Password: _passwordController.text.trim(),
                            ),
                          );
                          if (isRegister) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: const Text(
                                  "Compté crée veillez vous connecter",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                  ),
                                ),
                                backgroundColor: Colors.blue,
                                action: SnackBarAction(
                                  label: 'ok',
                                  onPressed: () {},
                                  textColor: Colors.white,
                                ),
                              ),
                            );
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LoginScreen(),
                              ),
                            );
                          } else {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text("pas bon "),
                            ));
                          }
                        }
                      },
                    ),
                    const Gap(50),
                    SizedBox(
                      width: largeur * 0.90,
                      height: hauteur * 0.03,
                      child: Align(
                        alignment: Alignment.center,
                        child: RichText(
                          text: TextSpan(
                            text: "Have already an account ?",
                            style: const TextStyle(
                              color: Colors
                                  .black, // Définir la couleur du texte principal
                              fontSize: 16, // Taille de police par défaut
                            ),
                            children: [
                              TextSpan(
                                text: " Log in",
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
                                                const LoginScreen()));
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
