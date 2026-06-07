import 'dart:convert';

import 'package:crypto/crypto.dart';

class HashPassword {
  static String hash(String password) {
    //convertie le mot de passe en bytes
    final bytes = utf8.encode(password);
    //hash le mot de passe en utilisant sha256
    final digest = sha256.convert(bytes);
    //retourne le hash sous forme de string
    return digest.toString();
  }
    //verifie si le mot de passe correspond au hash
    static bool verify(String password, String hash){
      return hash == HashPassword.hash(password); 
    }
  }