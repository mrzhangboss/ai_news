
import 'package:flutter/material.dart';

class EncryptUtils {
  static String encryptString(String text, int shift) {
    return text.characters.map((char) {
      if (char.codeUnitAt(0) >= 'a'.codeUnitAt(0) && char.codeUnitAt(0) <= 'z'.codeUnitAt(0)) {
        return String.fromCharCode(((char.codeUnitAt(0) - 'a'.codeUnitAt(0) + shift) % 26) + 'a'.codeUnitAt(0));
      } else if (char.codeUnitAt(0) >= 'A'.codeUnitAt(0) && char.codeUnitAt(0) <= 'Z'.codeUnitAt(0)) {
        return String.fromCharCode(((char.codeUnitAt(0) - 'A'.codeUnitAt(0) + shift) % 26) + 'A'.codeUnitAt(0));
      } else {
        return char;
      }
    }).join('');
  }

  static String decryptString(String text, int shift) {
    return encryptString(text, 26 - (shift % 26)); // Decrypt by shifting in the opposite direction
  }
}

