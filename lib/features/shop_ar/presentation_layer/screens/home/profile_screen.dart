// ignore_for_file: sized_box_for_whitespace, avoid_print

import 'package:ar_ecommerce/features/shop_ar/domain_layer/usescases/get_user_info/get_user_info.dart';
import 'package:ar_ecommerce/features/shop_ar/presentation_layer/utils/color_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  final userProvider =
      StateNotifierProvider<UserNotifier, Map<String, dynamic>>(
          (ref) => UserNotifier());

  @override
  void initState() {
    super.initState();
    ref.read(userProvider.notifier).getCurrentUser();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, watch, child) {
        final user = ref.watch(userProvider);
        print("User: $user");
        // print("infos user: $user");
        return Scaffold(
          backgroundColor: secondaryColor,
          body: SafeArea(
            child: Container(
              height: double.infinity,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    user["username"] ?? "",
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

// class ProfileScreen extends ConsumerStatefulWidget {
//   const ProfileScreen({Key? key}) : super(key: key);

//   @override
//   ConsumerState<ConsumerStatefulWidget> createState() => _ProfileScreenState();
// }

// class _ProfileScreenState extends ConsumerState<ProfileScreen> {
//   final userProvider =
//       StateNotifierProvider<UserNotifier, Map<String, dynamic>>(
//           (ref) => UserNotifier());

//   @override
//   void initState() {
//     super.initState();
//     ref.read(userProvider.notifier).getCurrentUser();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final user = ref.watch(userProvider);
//     print("infos user: $user");
//     return Scaffold(
//         backgroundColor: secondaryColor,
//         body: SafeArea(
//           child: Container(
//             height: double.infinity,
//             width: double.infinity,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 Text(
//                   user["username"] ?? "",
//                   style: const TextStyle(
//                       color: Colors.white,
//                       fontSize: 30,
//                       fontWeight: FontWeight.bold),
//                 ),
//               ],
//             ),
//           ),
//         ));
//   }
// }
