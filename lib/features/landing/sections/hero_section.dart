import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../shared/utils/responsive.dart' as responsive;
import '../../../shared/widgets/fade_in_up.dart';
import '../../../shared/widgets/hover_scale_effect.dart';
import '../landing_state.dart';
import '../widgets/landing_navigation.dart';

class LandingHero extends StatelessWidget {
  const LandingHero({
    super.key,
    required this.hero,
    required this.navItems,
    required this.onProjectInquiry,
    required this.onPortfolioRequest,
    required this.onNavItemClick,
  });

  final HeroSection hero;
  final List<String> navItems;
  final VoidCallback onProjectInquiry;
  final VoidCallback onPortfolioRequest;
  final void Function(String) onNavItemClick;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    
    return SizedBox(
      height: math.max(size.height, 800), // Full viewport height
      width: double.infinity,
      child: Stack(
        children: [
          // 1. Cinematic Background
          const Positioned.fill(
            child: _CinematicBackground(),
          ),

          // 2. Content Layer
          Positioned.fill(
            child: Column(
              children: [
                LandingNavigation(
                  isDesktop: size.width >= 1024,
                  navItems: navItems,
                  onProjectInquiry: onProjectInquiry,
                  onNavItemClick: onNavItemClick,
                ),
                Expanded(
                  child: Center(
                    child: SingleChildScrollView(
                      physics: const NeverScrollableScrollPhysics(),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: responsive.horizontalPadding(size.width),
                        ),
                        child: _HeroContent(
                          hero: hero,
                          onProjectInquiry: onProjectInquiry,
                          onPortfolioRequest: onPortfolioRequest,
                        ),
                      ),
                    ),
                  ),
                ),
                // Scroll Indicator
                const Padding(
                  padding: EdgeInsets.only(bottom: 40),
                  child: _ScrollIndicator(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _CinematicBackground extends StatelessWidget {
  const _CinematicBackground();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Deep Space Background
        Container(
          color: const Color(0xFF000000), // Pure Black for OLED feel
        ),
        
        // Dynamic Aurora Effects with Depth
        Positioned(
          top: -200,
          left: -100,
          child: _AnimatedAurora(
            color: const Color(0xFF38BDF8).withValues(alpha: 0.15),
            size: 1000,
            duration: const Duration(seconds: 20),
            offsetScale: 0.8, // Slower movement for depth
          ),
        ),
        Positioned(
          bottom: -200,
          right: -100,
          child: _AnimatedAurora(
            color: const Color(0xFF6366F1).withValues(alpha: 0.15),
            size: 1200,
            duration: const Duration(seconds: 25),
            offsetScale: 1.2, // Faster movement for foreground feel
          ),
        ),
        // Third Layer for extra depth
        Positioned(
          top: 300,
          right: -200,
          child: _AnimatedAurora(
            color: const Color(0xFF818CF8).withValues(alpha: 0.1),
            size: 800,
            duration: const Duration(seconds: 30),
            offsetScale: 0.5, // Very slow background layer
          ),
        ),
        
        // Grain Overlay for Texture
        Positioned.fill(
          child: Opacity(
            opacity: 0.03,
            child: Image.network(
              'https://www.transparenttextures.com/patterns/stardust.png',
              repeat: ImageRepeat.repeat,
              errorBuilder: (_, __, ___) => const SizedBox(),
            ),
          ),
        ),
      ],
    );
  }
}

class _HeroContent extends StatelessWidget {
  const _HeroContent({
    required this.hero,
    required this.onProjectInquiry,
    required this.onPortfolioRequest,
  });

  final HeroSection hero;
  final VoidCallback onProjectInquiry;
  final VoidCallback onPortfolioRequest;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDesktop = MediaQuery.of(context).size.width >= 1024;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Badge
        FadeInUp(
          delay: const Duration(milliseconds: 200),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.08),
              borderRadius: BorderRadius.circular(100),
              border: Border.all(color: Colors.white.withValues(alpha: 0.1)),
            ),
            child: Text(
              hero.badge,
              style: theme.textTheme.labelMedium?.copyWith(
                color: const Color(0xFFE2E8F0),
                letterSpacing: 1.0,
              ),
            ),
          ),
        ),
        const SizedBox(height: 40),
        
        // Headline (Titanium Gradient)
        FadeInUp(
          delay: const Duration(milliseconds: 400),
          child: ShaderMask(
            shaderCallback: (bounds) => const LinearGradient(
              colors: [
                Color(0xFFFFFFFF), // White
                Color(0xFF94A3B8), // Slate 400
                Color(0xFF64748B), // Slate 500
              ],
              stops: [0.0, 0.5, 1.0],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ).createShader(bounds),
            child: Text(
              hero.headline,
              textAlign: TextAlign.center,
              style: theme.textTheme.displayLarge?.copyWith(
                fontSize: isDesktop ? 96 : 56,
                height: 1.05,
                letterSpacing: isDesktop ? -3.0 : -1.5,
              ),
            ),
          ),
        ),
        const SizedBox(height: 32),
        
        // Subheadline
        FadeInUp(
          delay: const Duration(milliseconds: 600),
          child: Text(
            hero.subHeadline,
            textAlign: TextAlign.center,
            style: theme.textTheme.headlineMedium?.copyWith(
              color: const Color(0xFF94A3B8),
              fontSize: isDesktop ? 32 : 24,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(height: 64),
        
        // CTAs
        FadeInUp(
          delay: const Duration(milliseconds: 800),
          child: Wrap(
            spacing: 24,
            runSpacing: 16,
            alignment: WrapAlignment.center,
            children: [
              HoverScaleEffect(
                child: ElevatedButton(
                  onPressed: onProjectInquiry,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 24),
                    textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                  ),
                  child: const Text('프로젝트 문의하기'),
                ),
              ),
              HoverScaleEffect(
                child: OutlinedButton(
                  onPressed: onPortfolioRequest,
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.white,
                    side: const BorderSide(color: Colors.white24, width: 1.5),
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 24),
                    textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  child: const Text('성공 사례 보기'),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _AnimatedAurora extends StatefulWidget {
  const _AnimatedAurora({
    required this.color,
    required this.size,
    required this.duration,
    this.offsetScale = 1.0,
  });

  final Color color;
  final double size;
  final Duration duration;
  final double offsetScale;

  @override
  State<_AnimatedAurora> createState() => _AnimatedAuroraState();
}

class _AnimatedAuroraState extends State<_AnimatedAurora>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(
            math.sin(_controller.value * math.pi) * 50 * widget.offsetScale,
            math.cos(_controller.value * math.pi) * 50 * widget.offsetScale,
          ),
          child: Container(
            width: widget.size,
            height: widget.size,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: [widget.color, Colors.transparent],
                stops: const [0.0, 0.6],
              ),
            ),
          ),
        );
      },
    );
  }
}

class _ScrollIndicator extends StatelessWidget {
  const _ScrollIndicator();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '아래로 스크롤하여 더 알아보기',
          style: GoogleFonts.notoSansKr(
            color: Colors.white38,
            fontSize: 12,
            letterSpacing: 1.0,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 12),
        const Icon(Icons.keyboard_arrow_down, color: Colors.white38, size: 24),
      ],
    );
  }
}
