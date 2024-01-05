import 'dart:convert';

import 'package:ar_ecommerce/features/shop_ar/domain_layer/usescases/auth_manager.dart';
import 'package:ar_ecommerce/features/shop_ar/presentation_layer/provider/get_current_user_info.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

// UserInfo.dart

import 'dart:convert';
import 'package:http/http.dart' as http;

// Créez un StateNotifier pour gérer l'état de l'utilisateur
class UserNotifier extends StateNotifier<Map<String, dynamic>> {
  UserNotifier() : super({});

  Future<void> getCurrentUser() async {
    final url = Uri.parse('http://10.0.2.2:5000/current-user');

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String accessToken = prefs.getString('accessToken') ?? '';

    try {
      final response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $accessToken',
        },
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> userData = json.decode(response.body);
        // userInfoProvider = _currentUserData
        // print(userData); // Stocke les données
        state = userData; // Met à jour l'état avec les données de l'utilisateur
        print('ID utilisateur actuellement connecté : ${userData['id']}');
      } else {
        Map<String, dynamic> error = json.decode(response.body);
        print("Erreur: $error");
        print(
            'Erreur lors de la récupération des informations de l\'utilisateur : ${response.statusCode}');
      }
    } catch (e) {
      print('Erreur lors de la requête : ${e.toString()}');
    }
  }
}



// class UserInfo {
//   Map<String, dynamic> _currentUserData = {}; // Variable globale

//   Future<void> getCurrentUser() async {
//     final url = Uri.parse('http://10.91.227.20:5000/current-user');

//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     String accessToken = prefs.getString('accessToken') ?? '';

//     try {
//       final response = await http.get(
//         url,
//         headers: {
//           'Content-Type': 'application/json',
//           'Authorization': 'Bearer $accessToken',
//         },
//       );

//       if (response.statusCode == 200) {
//         _currentUserData = json.decode(response.body);
//         // userInfoProvider = _currentUserData
//         print(_currentUserData); // Stocke les données
//         print(
//             'ID utilisateur actuellement connecté : ${_currentUserData['id']}');
//       } else {
//         Map<String, dynamic> error = json.decode(response.body);
//         print("Erreur: $error");
//         print(
//             'Erreur lors de la récupération des informations de l\'utilisateur : ${response.statusCode}');
//       }
//     } catch (e) {
//       print('Erreur lors de la requête : ${e.toString()}');
//     }
//   }
// }


// class UserInfo {
//   Future<void> getCurrentUser() async {
//     final url = Uri.parse('http://10.91.227.20:5000/current-user');

//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     String accessToken = prefs.getString('accessToken') ?? '';

//     try {
//       final response = await http.get(
//         url,
//         headers: {
//           'Content-Type': 'application/json',
//           'Authorization': 'Bearer $accessToken',
//         },
//       );

//       if (response.statusCode == 200) {
//         Map<String, dynamic> userData = json.decode(response.body);
//         print("User data: $userData");
//         print('ID utilisateur actuellement connecté : ${userData['id']}');
//       } else {
//         Map<String, dynamic> error = json.decode(response.body);
//         print("Erreur: $error");
//         print(
//             'Erreur lors de la récupération des informations de l\'utilisateur : ${response.statusCode}');
//       }
//     } catch (e) {
//       print('Erreur lors de la requête : ${e.toString()}');
//     }
//   }
  
// }
