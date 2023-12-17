// ignore_for_file: sized_box_for_whitespace, avoid_print

import 'package:ar_ecommerce/features/shop_ar/presentation_layer/screens/auth_screens/register_screen.dart';
// import 'package:ar_ecommerce/features/shop_ar/presentation_layer/screens/verify_screen.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

// import '../../../domain_layer/usescases/auth_manager.dart';
import '../../../domain_layer/usescases/auth_domain.dart';
import '../../widgets/auth_widgets/auth_sign_button_widget.dart';
import '../../widgets/auth_widgets/auth_social_button_widget.dart';
import '../../widgets/auth_widgets/auth_text_change_widget.dart';
import '../../widgets/auth_widgets/auth_textfield_widget.dart';
import 'forgot_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // ? Controller
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  AuthServices authServices = AuthServices();
  bool isValid = false;

  // ? Focus

  late FocusNode emailFocus;

  late FocusNode passwordFocus;

  late FocusNode loginButtonFocus;

  @override
  void initState() {
    super.initState();
    emailFocus = FocusNode();
    passwordFocus = FocusNode();
    loginButtonFocus = FocusNode();
  }

  // @override
  // void dispose() {
  //   emailFocus.unfocus();
  //   passwordFocus.unfocus();
  //   emailFocus.dispose();
  //   passwordFocus.dispose();
  //   loginButtonFocus.dispose();
  //   super.dispose();
  // }

  // ? Toggle ObscureTexte
  void toggleObscureText(IconData iconData) {
    setState(() {
      // widget.obscureText = !widget.obscureText;

      iconData = iconData == Icons.visibility
          ? Icons.visibility_off
          : Icons.visibility;
      print("Moi");
    });
  }

  // ? login
  // ? Message toast
  messageToast({required String message}) {
    Fluttertoast.showToast(msg: message, backgroundColor: Colors.red);
  }

  // ? SignUp
  signIn() async {
    isValid = EmailValidator.validate(emailController.text);
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      messageToast(message: "Veuillez remplir tous les champs !");
    } else if (!isValid) {
      messageToast(message: "Entrer une adresse e-mail valide");
    } else {
      print(
          "Email: ${emailController.text} and Password: ${passwordController.text}");
      await authServices.loginUser(
          email: emailController.text,
          password: passwordController.text,
          context: context);
    }
    print("Sign In");
    // Stocker l'e-mail dans le fournisseur
  }

  // ? Sign In with google
  googleAuth() async {
    await authServices.signInWithGoogle();
  }

  @override
  Widget build(BuildContext context) {
    // final TextEditingController emailController = TextEditingController();

    // final TextEditingController passwordController = TextEditingController();

    var hauteurEcran = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color(0xff1E1F28),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                height: 100,
                width: double.infinity,
                // color: Colors.red,
                // padding: const EdgeInsets.only(left: 18),
                child: const Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    "Login",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              // ? TextField
              Container(
                // color: Colors.green,
                padding: const EdgeInsets.only(top: 45),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    AuthTextfieldWidget(
                      controller: emailController,
                      // focusNode: emailFocus,
                      // nextFocusNode: passwordFocus,
                      obscureText: false,
                      labelText: "Email",
                      iconData: Icons.email_outlined,
                      isPassword: false,
                    ),

                    const SizedBox(
                      height: 10,
                    ),
                    AuthTextfieldWidget(
                      controller: passwordController,
                      // focusNode: passwordFocus,
                      // nextFocusNode: loginButtonFocus,
                      obscureText: true,
                      labelText: "Password",
                      // onTap: () => print("object"),
                      iconData: Icons.visibility_off_outlined,
                      isPassword: true,
                    ),

                    // ? Forgot Password
                    AuthTextChangeWidget(
                      text: "Forgot your password?",
                      iconData: Icons.arrow_right_alt,
                      onTap: () => Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const ForgotScreen(),
                      )),
                    ),
                    // ? Login Bouton
                    AuthSignButtonWidget(
                      // focusNode: loginButtonFocus,
                      text: "Login",
                      onTap: signIn,
                    ),
                    // ? Go to register screen
                    AuthTextChangeWidget(
                      text: "Don't have an account?",
                      iconData: Icons.arrow_right_alt,
                      onTap: () => Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const RegisterScreen(),
                      )),
                    ),
                  ],
                ),
              ),
              Container(
                // height: 400,
                height: hauteurEcran / 4.4,
                width: double.infinity,
                // color: Colors.blue,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    const Text(
                      "Or login with social account",
                      textAlign: TextAlign.end,
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AuthSocialButtonWidget(
                          pathImage: "assets/images/google_1.png",
                          onTap: () async {
                            await googleAuth();
                            print("Google");
                          },
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        AuthSocialButtonWidget(
                          pathImage: "assets/images/facebook.png",
                          onTap: () => print("Facebook"),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
