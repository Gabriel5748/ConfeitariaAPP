import 'package:flutter/material.dart';

class AppTheme {
  // Cores principais
  static const Color primaryColor = Color(0xFFF9C6D1); // Rosa Pastel
  static const Color secondaryColor = Color(0xFFF8D0A4); // Pêssego Claro
  static const Color backgroundColor = Color(0xFFF2E2D2); // Bege Claro
  static const Color cardColor = Color(0xFFFFFFFF);
  static const Color textColor = Color(0xFF4A4A4A); // Cinza escuro para texto
  static const Color accentColor = Color(0xFFA8D8E8); // Azul Claro
  static const Color highlightColor = Color(0xFFE5C07B); // Dourado Claro

  // Gradientes
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [primaryColor, secondaryColor],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // Estilos de texto
  static final TextStyle titleStyle = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: textColor,
  );

  static final TextStyle subtitleStyle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: textColor,
  );

  static final TextStyle bodyTextStyle = TextStyle(
    fontSize: 16,
    color: textColor,
  );

  // Decorações
  static final BoxDecoration cardDecoration = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(15),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.1),
        blurRadius: 10,
        offset: const Offset(0, 5),
      ),
    ],
  );

  static BoxDecoration gradientDecoration = BoxDecoration(
    gradient: primaryGradient,
    borderRadius: BorderRadius.circular(15),
  );

  // Botões
  static final ButtonStyle primaryButtonStyle = ElevatedButton.styleFrom(
    backgroundColor: primaryColor,
    foregroundColor: textColor,
    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15),
    ),
  );

  static final ButtonStyle secondaryButtonStyle = ElevatedButton.styleFrom(
    backgroundColor: Colors.white,
    foregroundColor: primaryColor,
    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15),
    ),
  );

  // Input Decoration
  static final InputDecorationTheme inputDecorationTheme = InputDecorationTheme(
    filled: true,
    fillColor: Colors.white,
    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide.none,
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide(color: Colors.grey.shade200),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide(color: primaryColor),
    ),
  );
} 