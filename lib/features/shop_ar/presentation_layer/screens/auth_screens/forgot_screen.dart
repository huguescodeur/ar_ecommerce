// ignore_for_file: sized_box_for_whitespace, avoid_print

import 'package:ar_ecommerce/features/shop_ar/domain_layer/usescases/auth_domain.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../widgets/auth_widgets/auth_sign_button_widget.dart';

import '../../widgets/auth_widgets/auth_textfield_widget.dart';

class ForgotScreen extends StatefulWidget {
  const ForgotScreen({Key? key}) : super(key: key);

  @override
  State<ForgotScreen> createState() => _ForgotScreenState();
}

class _ForgotScreenState extends State<ForgotScreen> {
  // ? Controller
  final TextEditingController emailController = TextEditingController();

  AuthServices authServices = AuthServices();

// ? Focus
  late FocusNode emailFocus;
  late FocusNode sendFocus;

  @override
  void initState() {
    super.initState();

    emailFocus = FocusNode();
    sendFocus = FocusNode();
  }

  @override
  void dispose() {
    emailFocus.dispose();
    sendFocus.dispose();

    super.dispose();
  }

  googleOut() async {
    await authServices.signOutWithGoogle();
  }

  @override
  Widget build(BuildContext context) {
    // var hauteurEcran = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color(0xff1E1F28),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 140,
                width: double.infinity,
                // color: Colors.blue,
                // padding: const EdgeInsets.only(left: 18),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: InkResponse(
                        onTap: () => Navigator.pop(context),
                        hoverColor: Colors.white.withOpacity(0.1),
                        splashColor: Colors.white.withOpacity(0.1),
                        radius: 25,
                        splashFactory: NoSplash.splashFactory,
                        // Couleur de surbrillance au survol
                        child: const Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                    ),
                    const Text(
                      "Forgot password",
                      // textAlign: TextAlign.start,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              // ? TextField
              Container(
                // color: Colors.green,
                padding: const EdgeInsets.only(top: 45),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Please, enter your email address. You will receive a link to create a new password via email.",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    AuthTextfieldWidget(
                      controller: emailController,
                      // focusNode: emailFocus,
                      // nextFocusNode: sendFocus,
                      obscureText: false,
                      labelText: "Email",
                      iconData: Icons.email_outlined,
                      isPassword: false,
                    ),

                    const Gap(25),

                    // ? Forgot Boutton
                    AuthSignButtonWidget(
                        // focusNode: sendFocus,
                        text: "Send",
                        onTap: googleOut),
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
