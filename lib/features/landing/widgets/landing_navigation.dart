import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../shared/theme/app_colors.dart';
import '../../../shared/widgets/nav_item.dart';

class LandingNavigation extends StatelessWidget {
  const LandingNavigation({
    super.key,
    required this.isDesktop,
    required this.navItems,
    required this.onProjectInquiry,
    required this.onNavItemClick,
  });

  final bool isDesktop;
  final List<String> navItems;
  final VoidCallback onProjectInquiry;
  final void Function(String) onNavItemClick;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    
    return ClipRRect(
      borderRadius: BorderRadius.circular(100), // Pill shape
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          decoration: BoxDecoration(
            color: AppColors.surface.withValues(alpha: 0.6),
            borderRadius: BorderRadius.circular(100),
            border: Border.all(
              color: Colors.white.withValues(alpha: 0.1),
              width: 1,
            ),
          ),
          child: Row(
            children: [
              // Logo / Brand
              Icon(Icons.code, color: AppColors.accent, size: 24),
              const SizedBox(width: 12),
              Text(
                'akradev studio',
                style: textTheme.titleLarge?.copyWith(
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.w700,
                  letterSpacing: -0.5,
                ),
              ),
              const Spacer(),
              if (isDesktop)
                Row(
                  children: [
                    for (final item in navItems)
                      Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: NavItem(
                          label: item, 
                          onTap: () => onNavItemClick(item)
                        ),
                      ),
                    const SizedBox(width: 16),
                    ElevatedButton(
                      onPressed: onProjectInquiry,
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                         textStyle: GoogleFonts.notoSansKr(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                      ),
                      child: const Text('무료 상담 신청'),
                    ),
                  ],
                )
              else
                IconButton(
                   onPressed: onProjectInquiry,
                   icon: const Icon(Icons.menu, color: Colors.white),
                ), 
            ],
          ),
        ),
      ),
    );
  }
}
