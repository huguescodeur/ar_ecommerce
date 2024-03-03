// ignore_for_file: use_build_context_synchronously, prefer_const_constructors, avoid_print

import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import 'package:ar_ecommerce/features/shop_ar/presentation_layer/screens/auth_screens/verify_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'auth_manager.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthServices {
  // ? Méthode Login
  Future<Map<String, dynamic>> loginUser(
      {required String email,
      required String password,
      required BuildContext context}) async {
    final url = Uri.parse('http://192.168.0.124:5000/login');
    try {
      if (email.isEmpty || password.isEmpty) {
        // Gérer le cas où l'e-mail ou le mot de passe est vide
        throw Exception("L'e-mail ou le mot de passe est vide");
      }

      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'email': email, 'password': password}),
      );

      // Vérifiez si la réponse contient un cookie
      String? rawCookie = response.headers['set-cookie'];
      if (rawCookie != null) {
        // Stockez le cookie dans les préférences partagées
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('accessCookie', rawCookie);
      }

      if (response.statusCode == 200) {
        Map<String, dynamic> responseData = json.decode(response.body);
        String? accessToken = responseData['access_token'];

        // Stockez le jeton d'accès dans les préférences partagées
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('accessToken', accessToken!);

        print('Stored access token: ${prefs.getString('accessToken')}');
        // String successMessage = responseData["message"];
        Navigator.pushReplacementNamed(context, '/main');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.green,
            content: Text("Vous êtes connecté"),
            duration: const Duration(seconds: 3),
          ),
        );
        AuthManager.setLoggedIn(true);
        return responseData;
      } else if (response.statusCode == 401) {
        Map<String, dynamic> responseData = json.decode(response.body);
        // String failedMessage = responseData["message"];
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.red,
            content: Text("Identifiant incorrect"),
            duration: const Duration(seconds: 3),
          ),
        );
        AuthManager.setLoggedIn(false);
        return responseData;
      } else {
        AuthManager.setLoggedIn(false);
        throw Exception('Erreur de connexion: ${response.statusCode}');
      }
    } catch (e) {
      print('Erreur lors de la requête : ${e.toString()}');
      // Traitez l'erreur en conséquence, par exemple, affichez un message d'erreur générique
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Text(
              'Erreur lors de la requête. Veuillez réessayer. ${e.toString()}'),
          duration: const Duration(seconds: 3),
        ),
      );
      AuthManager.setLoggedIn(false);
      return {};
    }
  }

  // ? Méthode Register
  Future<void> registerUser(
      {required String username,
      required String email,
      required String password,
      required BuildContext context}) async {
    final url = Uri.parse('http://192.168.0.124:5000/register');
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(
          {'username': username, 'email': email, 'password': password}),
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> responseData = json.decode(response.body);
      String successMessage = responseData['message'];
      // La requête a réussi, vous pouvez traiter la réponse si nécessaire
      print('Inscription réussie!');
      print(successMessage);
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => VerifyCode(),
      ));
    } else if (response.statusCode == 409) {
      // L'e-mail existe déjà, afficher un message d'erreur
      Map<String, dynamic> responseData = json.decode(response.body);
      String errorMessage = responseData['error'];
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Text(errorMessage),
          duration: const Duration(seconds: 2),
        ),
      );
    } else {
      // La requête a échoué, vous pouvez afficher un message d'erreur
      print("Erreur lors de l'inscription: ${response.body}");
      Map<String, dynamic> responseData = json.decode(response.body);
      String errorMessage = responseData['error'];

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Text(errorMessage),
          duration: const Duration(seconds: 2),
        ),
      );
    }
  }

  // ? Méthode Verify Code Token
  Future<void> verifyCode(
      {required String email,
      required String enteredCode,
      required BuildContext context}) async {
    final url = Uri.parse('http://192.168.0.124:5000/verify-code');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email, 'code': enteredCode}),
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> responseData = json.decode(response.body);
      String? accessToken = responseData['access_token'];

      // Stocker le jeton d'accès dans les préférences partagées
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('accessToken', accessToken!);

      Navigator.pushReplacementNamed(context, '/main');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.green,
          content: Text("Vous êtes connecté"),
          duration: const Duration(seconds: 2),
        ),
      );
      // ? Naviguez vers l'écran suivant après la vérification réussie
      // Navigator.pushReplacementNamed(context, '/main');
      AuthManager.setLoggedIn(true);
    } else {
      // Affichez un message d'erreur à l'utilisateur en cas d'échec de la vérification
      print("Erreur lors de la vérification du code: ${response.body}");
      Map<String, dynamic> responseData = json.decode(response.body);
      String errorMessage = responseData['error'];
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Text(errorMessage),
          duration: const Duration(seconds: 2),
        ),
      );
      AuthManager.setLoggedIn(false);
    }
  }

  // ? Google Sign In
// * Google login
  Future<UserCredential?> signInWithGoogle() async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      if (googleUser == null) {
        // L'utilisateur a annulé la connexion Google
        return null;
      }

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential
      final userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);

      // Enregistrez l'état de connexion dans SharedPreferences
      AuthManager.setLoggedIn(true);

      return userCredential;
    } catch (e) {
      print("Erreur lors de la connexion avec Google : $e");
      AuthManager.setLoggedIn(false);
      return null;
    }
  }

  // ? Google Logout
  Future<void> signOutWithGoogle() async {
    await GoogleSignIn().signOut(); // Déconnexion avec Firebase
    await FirebaseAuth.instance.signOut();
    print("Logout");

    // Mettez à jour l'état de connexion dans SharedPreferences
    AuthManager.setLoggedIn(false);
  }

  // ? User Logout
  logoutUser(BuildContext context) async {
    // Effacer le jeton d'accès de SharedPreferences
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('accessToken');

    // Mettre à jour l'état de l'application

    // Rediriger l'utilisateur vers la page de connexion
    Navigator.pushReplacementNamed(context, '/login');

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.green,
        content: Text('Déconnexion réussie'),
        duration: const Duration(seconds: 3),
      ),
    );
    AuthManager.setLoggedIn(false);
  }
}

// // ? Méthode Login
  // Future<Map<String, dynamic>> loginUser(
  //     {required String email,
  //     required String password,
  //     required BuildContext context}) async {
  //   final url = Uri.parse('http://192.168.0.124:5000/login');
  //   try {
  //     if (email.isEmpty || password.isEmpty) {
  //       // Gérer le cas où l'e-mail ou le mot de passe est vide
  //       throw Exception("L'e-mail ou le mot de passe est vide");
  //     }

  //     final response = await http.post(
  //       url,
  //       headers: {'Content-Type': 'application/json'},
  //       body: jsonEncode({'email': email, 'password': password}),
  //     );

  //     // print('Response status: ${response.statusCode}');
  //     // print('Response body: ${response.body}');

  //     if (response.statusCode == 200) {
  //       // AuthManager.storeCookies(response);
  //       // ? Activer la persistance de connection
  //       AuthManager.setLoggedIn(true);

  //       Map<String, dynamic> responseData = json.decode(response.body);
  //       String? accessToken = responseData['access_token'];

  //       // print('Decoded response: $responseData');

  //       // ? stockons le jetons d'accès dans les préférences partagées
  //       SharedPreferences prefs = await SharedPreferences.getInstance();
  //       await prefs.setString('accessToken', accessToken!);

  //       print('Stored access token: ${prefs.getString('accessToken')}');
  //       // String successMessage = responseData["message"];
  //       Navigator.pushReplacementNamed(context, '/main');
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(
  //           backgroundColor: Colors.green,
  //           content: Text("Vous êtes connecté"),
  //           duration: const Duration(seconds: 3),
  //         ),
  //       );
  //       return responseData;
  //     } else if (response.statusCode == 401) {
  //       Map<String, dynamic> responseData = json.decode(response.body);
  //       // String failedMessage = responseData["message"];
  //       AuthManager.setLoggedIn(false);
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(
  //           backgroundColor: Colors.red,
  //           content: Text("Identifiant incorrect"),
  //           duration: const Duration(seconds: 3),
  //         ),
  //       );
  //       return responseData;
  //     } else {
  //       AuthManager.setLoggedIn(false);
  //       throw Exception('Erreur de connexion: ${response.statusCode}');
  //     }
  //   } catch (e) {
  //     AuthManager.setLoggedIn(false);
  //     print('Erreur lors de la requête : ${e.toString()}');
  //     // Traitez l'erreur en conséquence, par exemple, affichez un message d'erreur générique
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(
  //         backgroundColor: Colors.red,
  //         content: Text(
  //             'Erreur lors de la requête. Veuillez réessayer. ${e.toString()}'),
  //         duration: const Duration(seconds: 3),
  //       ),
  //     );
  //     return {};
  //   }
  // }


  // ? Méthode Verify Code
  // Future<void> verifyCode(
  //     {required String email,
  //     required String enteredCode,
  //     required BuildContext context}) async {
  //   final url = Uri.parse('http://10.92.35.26:5000/verify-code');
  //   final response = await http.post(
  //     url,
  //     headers: {'Content-Type': 'application/json'},
  //     body: jsonEncode({'email': email, 'code': enteredCode}),
  //   );

  //   print(enteredCode);

  //   if (response.statusCode == 200) {
  //     Map<String, dynamic> responseData = json.decode(response.body);
  //     String successMessage = responseData['message'];
  //     print(successMessage);
  //     AuthManager.setLoggedIn(true);
  //     Navigator.pushReplacementNamed(context, '/main');
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(
  //         backgroundColor: Colors.green,
  //         content: Text(successMessage),
  //         duration: const Duration(seconds: 2),
  //       ),
  //     );
  //     // Naviguez vers l'écran suivant après la vérification réussie
  //   } else {
  //     // Affichez un message d'erreur à l'utilisateur en cas d'échec de la vérification
  //     print("Erreur lors de la vérification du code: ${response.body}");
  //     Map<String, dynamic> responseData = json.decode(response.body);
  //     String errorMessage = responseData['error'];
  //     AuthManager.setLoggedIn(false);
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(
  //         backgroundColor: Colors.red,
  //         content: Text(errorMessage),
  //         duration: const Duration(seconds: 2),
  //       ),
  //     );
  //   }
  // }