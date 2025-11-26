import 'package:flutter/material.dart';

class AppColors {
  // Richer Dark Backgrounds (Slate/Navy based)
  static const background = Color(0xFF020617); // Slate 950 (Deepest)
  static const surface = Color(0xFF0F172A);    // Slate 900
  static const surfaceHighlight = Color(0xFF1E293B); // Slate 800
  
  // Accents
  static const accent = Color(0xFF38BDF8);     // Sky 400
  static const accentGlow = Color(0xFF0EA5E9); // Sky 500
  static const secondary = Color(0xFF6366F1);  // Indigo 500

  // Text
  static const textPrimary = Color(0xFFF8FAFC);   // Slate 50
  static const textSecondary = Color(0xFF94A3B8); // Slate 400
  static const textTertiary = Color(0xFF64748B);  // Slate 500
  
  // Borders & Dividers
  static final border = Colors.white.withValues(alpha: 0.08);
  static final borderHighlight = Colors.white.withValues(alpha: 0.15);
}
