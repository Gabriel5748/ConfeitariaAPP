import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../model/user.dart';

class UserService {
  static const String _usersKey = 'users';
  final SharedPreferences _prefs;

  UserService(this._prefs);

  Future<void> saveUser(User user) async {
    try {
      List<User> users = await getUsers();
      
      // Verifica se já existe um usuário com este email
      final existingUserIndex = users.indexWhere((u) => u.email == user.email);
      if (existingUserIndex >= 0) {
        users[existingUserIndex] = user; // Atualiza o usuário existente
      } else {
        users.add(user); // Adiciona novo usuário
      }
      
      final List<Map<String, dynamic>> usersJson = users.map((u) => u.toJson()).toList();
      final String encodedData = jsonEncode(usersJson);
      await _prefs.setString(_usersKey, encodedData);
    } catch (e) {
      print('Erro ao salvar usuário: $e');
      throw Exception('Falha ao salvar usuário');
    }
  }

  Future<List<User>> getUsers() async {
    try {
      final String? usersJson = _prefs.getString(_usersKey);
      if (usersJson == null || usersJson.isEmpty) return [];

      final List<dynamic> decoded = jsonDecode(usersJson);
      return decoded.map((json) => User.fromJson(json as Map<String, dynamic>)).toList();
    } catch (e) {
      print('Erro ao obter usuários: $e');
      return [];
    }
  }

  Future<User?> getUserByEmail(String email) async {
    try {
      List<User> users = await getUsers();
      return users.firstWhere(
        (user) => user.email.toLowerCase() == email.toLowerCase(),
        orElse: () => throw Exception('Usuário não encontrado'),
      );
    } catch (e) {
      print('Erro ao buscar usuário por email: $e');
      return null;
    }
  }

  Future<bool> validateLogin(String email, String password) async {
    try {
      User? user = await getUserByEmail(email);
      return user != null && user.password == password;
    } catch (e) {
      print('Erro ao validar login: $e');
      return false;
    }
  }
} 