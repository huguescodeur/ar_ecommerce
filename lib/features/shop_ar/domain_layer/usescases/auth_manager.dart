import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthManager {
  static Map<String, String> cookies = {};

  static void storeCookies(http.Response response) {
    String rawCookies = response.headers['set-cookie'] ?? '';
    List<String> cookieParts = rawCookies.split(';');
    cookies['cookie'] = cookieParts[0];
  }

  static Future<void> setLoggedIn(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', value);
  }

  static Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isLoggedIn') ?? false;
  }

  // ... Reste de votre code d'AuthManager
}

// Votre page de connexion

// Future<Map<String, dynamic>> loginUser({
//   required String email,
//   required String password,
//   required BuildContext context,
// }) async {
//   final url = Uri.parse('http://192.168.0.124:5000/login');
//   try {
//     final response = await http.post(
//       url,
//       headers: {'Content-Type': 'application/json'},
//       body: jsonEncode({'email': email, 'password': password}),
//     );

//     if (response.statusCode == 200) {
//       AuthManager.storeCookies(response); // Stocker les cookies
//       // ... Reste de votre code
//     } else if (response.statusCode == 401) {
//       // ... Reste de votre code
//     } else {
//       // ... Reste de votre code
//     }
//   } catch (e) {
//     // ... Reste de votre code
//   }
// }
