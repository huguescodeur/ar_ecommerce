// // ignore_for_file: sized_box_for_whitespace, avoid_print, override_on_non_overriding_member

// import 'package:ar_ecommerce/features/shop_ar/presentation_layer/screens/auth_screens/login_screen.dart';
// import 'package:email_validator/email_validator.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:fluttertoast/fluttertoast.dart';

// import '../../../domain_layer/usescases/auth_domain.dart';
// import '../../provider/email_signup_provider.dart';
// import '../../widgets/auth_widgets/auth_sign_button_widget.dart';
// import '../../widgets/auth_widgets/auth_social_button_widget.dart';
// import '../../widgets/auth_widgets/auth_text_change_widget.dart';
// import '../../widgets/auth_widgets/auth_textfield_widget.dart';

// class RegisterScreen extends ConsumerStatefulWidget {
//   const RegisterScreen({Key? key}) : super(key: key);

//   @override
//   ConsumerState<ConsumerStatefulWidget> createState() => _RegisterScreenState();
// }

// class _RegisterScreenState extends ConsumerState<RegisterScreen> {
//   // ? Controller
//   final TextEditingController usernameController = TextEditingController();
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();

//   // ? Focus
//   // late FocusNode usernameFocus;

//   // late FocusNode emailFocus;

//   // late FocusNode passwordFocus;

//   // late FocusNode registerButtonFocus;

//   AuthServices authServices = AuthServices();
//   bool isValid = false;

//   @override
//   // void initState() {
//   //   super.initState();
//   //   usernameFocus = FocusNode();
//   //   emailFocus = FocusNode();
//   //   passwordFocus = FocusNode();
//   //   registerButtonFocus = FocusNode();
//   // }

//   // @override
//   // void dispose() {
//   //   usernameFocus.unfocus();
//   //   emailFocus.unfocus();
//   //   passwordFocus.unfocus();
//   //   usernameFocus.dispose();
//   //   emailFocus.dispose();
//   //   passwordFocus.dispose();
//   //   registerButtonFocus.dispose();
//   //   super.dispose();
//   // }

//   // ? Message toast
//   messageToast({required String message}) {
//     Fluttertoast.showToast(msg: message, backgroundColor: Colors.red);
//   }

//   // ? SignUp
//   signUp() async {
//     isValid = EmailValidator.validate(emailController.text);
//     if (usernameController.text.isEmpty ||
//         emailController.text.isEmpty ||
//         passwordController.text.isEmpty) {
//       messageToast(message: "Veuillez remplir tous les champs !");
//     } else if (usernameController.text.length < 4) {
//       messageToast(message: "Le nom doit être supérieur à 3 caractères.");
//     } else if (!isValid) {
//       messageToast(message: "Entrer une adresse e-mail valide");
//     } else if (passwordController.text.length < 6) {
//       messageToast(
//           message: "Le mot de passe doit être supérieur à 5 caractères.");
//     } else {
//       await authServices
//           .registerUser(
//               username: usernameController.text,
//               email: emailController.text,
//               password: passwordController.text,
//               context: context)
//           .then((value) {
//         ref.read(emailProvider.notifier).state = emailController.text;
//       });
//     }
//     print("Sign Up");
//     // Stocker l'e-mail dans le fournisseur
//   }

//   @override
//   Widget build(BuildContext context) {
//     var hauteurEcran = MediaQuery.of(context).size.height;

//     return Scaffold(
//       backgroundColor: const Color(0xff1E1F28),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 15),
//           child: Column(
//             // mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: [
//               Container(
//                 height: 100,
//                 width: double.infinity,
//                 // color: Colors.red,
//                 // padding: const EdgeInsets.only(left: 18),
//                 child: const Align(
//                   alignment: Alignment.bottomLeft,
//                   child: Text(
//                     "Sign up",
//                     textAlign: TextAlign.start,
//                     style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 30,
//                         fontWeight: FontWeight.bold),
//                   ),
//                 ),
//               ),
//               // ? TextField
//               Container(
//                 // color: Colors.green,
//                 padding: const EdgeInsets.only(top: 45),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: <Widget>[
//                     AuthTextfieldWidget(
//                       controller: usernameController,
//                       // focusNode: usernameFocus,
//                       // nextFocusNode: emailFocus,
//                       obscureText: false,
//                       labelText: "Name",
//                       iconData: Icons.person_outline,
//                       isPassword: false,
//                     ),
//                     const SizedBox(
//                       height: 10,
//                     ),
//                     AuthTextfieldWidget(
//                       controller: emailController,
//                       // focusNode: emailFocus,
//                       // nextFocusNode: passwordFocus,
//                       obscureText: false,
//                       labelText: "Email",
//                       iconData: Icons.email_outlined,
//                       isPassword: false,
//                     ),

//                     const SizedBox(
//                       height: 10,
//                     ),
//                     AuthTextfieldWidget(
//                       controller: passwordController,
//                       // focusNode: passwordFocus,
//                       // nextFocusNode: registerButtonFocus,
//                       obscureText: true,
//                       labelText: "Password",
//                       // onTap: () => print(""),
//                       iconData: Icons.visibility_off_outlined,
//                       isPassword: true,
//                     ),

//                     // ? Go to Login screen
//                     AuthTextChangeWidget(
//                       text: "Already have an account?",
//                       iconData: Icons.arrow_right_alt,
//                       onTap: () => Navigator.of(context).push(MaterialPageRoute(
//                           builder: (context) => const LoginScreen())),
//                     ),

//                     // ? Login Bouton
//                     AuthSignButtonWidget(
//                       text: "Sign up",
//                       // focusNode: registerButtonFocus,
//                       onTap: signUp,
//                     ),
//                   ],
//                 ),
//               ),
//               Container(
//                 // height: 400,
//                 height: hauteurEcran / 4.8,
//                 width: double.infinity,
//                 // color: Colors.blue,
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: <Widget>[
//                     const Text(
//                       "Or sign up with social account",
//                       textAlign: TextAlign.end,
//                       style: TextStyle(color: Colors.white, fontSize: 18),
//                     ),
//                     const SizedBox(
//                       height: 10,
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         AuthSocialButtonWidget(
//                           pathImage: "assets/images/google_1.png",
//                           onTap: () => print("Google"),
//                         ),
//                         const SizedBox(
//                           width: 10,
//                         ),
//                         AuthSocialButtonWidget(
//                           pathImage: "assets/images/facebook.png",
//                           onTap: () => print("Facebook"),
//                         )
//                       ],
//                     )
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// ignore_for_file: sized_box_for_whitespace, avoid_print, override_on_non_overriding_member

import 'package:ar_ecommerce/features/shop_ar/presentation_layer/screens/auth_screens/login_screen.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../domain_layer/usescases/auth_domain.dart';
import '../../provider/email_signup_provider.dart';
import '../../widgets/auth_widgets/auth_sign_button_widget.dart';
import '../../widgets/auth_widgets/auth_social_button_widget.dart';
import '../../widgets/auth_widgets/auth_text_change_widget.dart';
import '../../widgets/auth_widgets/auth_textfield_widget.dart';

class RegisterScreen extends ConsumerStatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends ConsumerState<RegisterScreen> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  AuthServices authServices = AuthServices();
  bool isValid = false;
  bool isLoading = false;

  messageToast({required String message}) {
    Fluttertoast.showToast(msg: message, backgroundColor: Colors.red);
  }

  signUp() async {
    setState(() {
      isLoading = true;
    });

    isValid = EmailValidator.validate(emailController.text);

    if (usernameController.text.isEmpty ||
        emailController.text.isEmpty ||
        passwordController.text.isEmpty) {
      messageToast(message: "Veuillez remplir tous les champs !");
    } else if (usernameController.text.length < 4) {
      messageToast(message: "Le nom doit être supérieur à 3 caractères.");
    } else if (!isValid) {
      messageToast(message: "Entrer une adresse e-mail valide");
    } else if (passwordController.text.length < 6) {
      messageToast(
          message: "Le mot de passe doit être supérieur à 5 caractères.");
    } else {
      await authServices
          .registerUser(
              username: usernameController.text,
              email: emailController.text,
              password: passwordController.text,
              context: context)
          .then((value) {
        ref.read(emailProvider.notifier).state = emailController.text;
      });
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    var hauteurEcran = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xff1E1F28),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              Container(
                height: 100,
                width: double.infinity,
                child: const Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    "Sign up",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 45),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    AuthTextfieldWidget(
                      controller: usernameController,
                      obscureText: false,
                      labelText: "Name",
                      iconData: Icons.person_outline,
                      isPassword: false,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    AuthTextfieldWidget(
                      controller: emailController,
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
                      obscureText: true,
                      labelText: "Password",
                      iconData: Icons.visibility_off_outlined,
                      isPassword: true,
                    ),
                    AuthTextChangeWidget(
                      text: "Already have an account?",
                      iconData: Icons.arrow_right_alt,
                      onTap: () => Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const LoginScreen())),
                    ),
                    AuthSignButtonWidget(
                      text: "Sign up",
                      onTap: signUp,
                      isLoading: isLoading,
                    ),
                  ],
                ),
              ),
              Container(
                height: hauteurEcran / 4.8,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    const Text(
                      "Or sign up with social account",
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
                          onTap: () => print("Google"),
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
