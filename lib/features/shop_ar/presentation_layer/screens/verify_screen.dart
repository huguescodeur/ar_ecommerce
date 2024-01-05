// // ignore_for_file: sized_box_for_whitespace, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:pinput/pinput.dart';

import '../../domain_layer/usescases/auth_domain.dart';
import '../provider/email_signup_provider.dart';
import '../provider/isloading.dart';

// class VerifyCode extends ConsumerWidget {
//   const VerifyCode({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final TextEditingController enteredCodeController = TextEditingController();
//     AuthServices authServices = AuthServices();

//     // final email = ref.read(emailProvider);
//     // Utilisez ref.watch pour récupérer la valeur de l'e-mail
//     final email = ref.watch(emailProvider);
//     print(email);
//     // print(email);
//     final defaultPinTheme = PinTheme(
//       width: 56,
//       height: 60,
//       textStyle: const TextStyle(
//         fontSize: 22,
//         color: Colors.black,
//       ),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(8),
//         border: Border.all(color: Colors.black),
//       ),
//     );

//     // ? verify
//     Future<void> verify() async {
//       await authServices.verifyCode(
//           email: email,
//           enteredCode: enteredCodeController.text,
//           context: context);
//     }

//     return Scaffold(
//       backgroundColor: const Color(0xff1E1F28),
//       // appBar: AppBar(
//       //   backgroundColor: Colors.green,
//       //   title: Text(email),
//       //   centerTitle: true,
//       // ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(20),
//         child: Container(
//           margin: const EdgeInsets.only(top: 40),
//           width: double.infinity,
//           child: Column(
//             children: [
//               const Gap(40),
//               const Text(
//                 "Verification",
//                 style: TextStyle(
//                   color: Colors.red,
//                   fontSize: 28,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               Container(
//                 margin: const EdgeInsets.symmetric(vertical: 40),
//                 child: const Text(
//                   "Enter the code sent to your email",
//                   style: TextStyle(
//                     color: Colors.grey,
//                     fontSize: 18,
//                   ),
//                 ),
//               ),
//               Container(
//                 margin: const EdgeInsets.only(bottom: 40),
//                 child: Text(
//                   email,
//                   style: const TextStyle(
//                     color: Colors.white,
//                     fontSize: 18,
//                   ),
//                 ),
//               ),
//               Pinput(
//                 length: 5,
//                 controller: enteredCodeController,
//                 defaultPinTheme: defaultPinTheme,
//                 focusedPinTheme: defaultPinTheme.copyWith(
//                   decoration: defaultPinTheme.decoration!.copyWith(
//                     border: Border.all(color: Colors.red),
//                   ),
//                 ),
//                 onCompleted: (pin) => debugPrint(pin),
//               ),
//               const Gap(45),

//               // ? Button Verify
//               Container(
//                 height: 60,
//                 width: 200,
//                 // margin: EdgeInsets.only(top: 40),
//                 // color: Colors.red,
//                 child: ElevatedButton(
//                     style: ButtonStyle(
//                         backgroundColor:
//                             const MaterialStatePropertyAll(Colors.red),
//                         shape: MaterialStatePropertyAll(RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(8)))),
//                     onPressed: () {
//                       print("Vérification");
//                       verify();
//                     },
//                     child: const Text(
//                       'Confirmer',
//                       style: TextStyle(
//                         fontSize: 25,
//                         color: Colors.white,
//                         // fontWeight: FontWeight.bold
//                       ),
//                     )),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// ...

class VerifyCode extends ConsumerWidget {
  const VerifyCode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Pour lire la valeur
    final isLoading = ref.read(isLoadingProvider);

    final TextEditingController enteredCodeController = TextEditingController();
    AuthServices authServices = AuthServices();
    final email = ref.watch(emailProvider);
    print(email);
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 60,
      textStyle: const TextStyle(
        fontSize: 22,
        color: Colors.black,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.black),
      ),
    );

    // bool isLoading = false;

    Future<void> verify() async {
      try {
        // ref.read(isLoadingProvider).state = true;
        ref.read(isLoadingProvider.notifier).state = true;

        await authServices.verifyCode(
          email: email,
          enteredCode: enteredCodeController.text,
          context: context,
        );

        ref.read(isLoadingProvider.notifier).state = false;
      } catch (e) {
        ref.read(isLoadingProvider.notifier).state = false;

        // Gérez l'erreur selon vos besoins
      }
    }

    return Scaffold(
      backgroundColor: const Color(0xff1E1F28),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Container(
          margin: const EdgeInsets.only(top: 40),
          width: double.infinity,
          child: Column(
            children: [
              const Gap(40),
              const Text(
                "Vérification",
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 40),
                child: const Text(
                  "Entrez le code envoyé à votre adresse e-mail",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 18,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 40),
                child: Text(
                  email,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
              Pinput(
                length: 5,
                controller: enteredCodeController,
                defaultPinTheme: defaultPinTheme,
                focusedPinTheme: defaultPinTheme.copyWith(
                  decoration: defaultPinTheme.decoration!.copyWith(
                    border: Border.all(color: Colors.red),
                  ),
                ),
                onCompleted: (pin) => debugPrint(pin),
              ),
              const Gap(45),

              // Bouton de vérification
              Container(
                height: 60,
                width: 200,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: const MaterialStatePropertyAll(Colors.red),
                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    )),
                  ),
                  onPressed: isLoading
                      ? null
                      : () {
                          print("Vérification");
                          verify();
                        },
                  child: isLoading
                      ? const CircularProgressIndicator(
                          color: Colors.white,
                        )
                      : const Text(
                          'Confirmer',
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                          ),
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
