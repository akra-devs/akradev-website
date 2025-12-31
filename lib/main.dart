import 'dart:async';

import 'dart:ui'; // For ImageFilter


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import 'features/landing/landing_cubit.dart';
import 'features/landing/landing_state.dart';
import 'features/landing/sections/case_studies_section.dart';
import 'features/landing/sections/footer_section.dart';
import 'features/landing/sections/founder_section.dart';
import 'features/landing/sections/hero_section.dart';
import 'features/landing/sections/philosophy_section.dart';
import 'features/landing/sections/process_section.dart';
import 'features/landing/sections/project_gallery_section.dart';
import 'features/landing/sections/review_section.dart';
import 'features/landing/sections/services_section.dart';
import 'features/landing/sections/spotlight_section.dart';
import 'shared/theme/app_colors.dart';
import 'shared/theme/app_theme.dart';
import 'shared/utils/responsive.dart' as responsive;


void main() {
  runApp(const MyApp());
}

// Custom ScrollBehavior to enable drag scrolling on web/desktop
class AppScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        PointerDeviceKind.stylus,
        PointerDeviceKind.trackpad,
      };
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'akradev studio',
      debugShowCheckedModeBanner: false,
      scrollBehavior: AppScrollBehavior(),
      theme: AppTheme.darkTheme,
      home: BlocProvider(
        create: (_) => LandingCubit(),
        child: const LandingPage(),
      ),
    );
  }
}

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _philosophyKey = GlobalKey();
  final GlobalKey _founderKey = GlobalKey();
  final GlobalKey _servicesKey = GlobalKey();
  final GlobalKey _processKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToSection(String sectionName) {
    GlobalKey? targetKey;
    switch (sectionName) {
      case '철학':
        targetKey = _philosophyKey;
        break;
      case '팀':
        targetKey = _founderKey;
        break;
      case '서비스':
        targetKey = _servicesKey;
        break;
      case '프로세스':
        targetKey = _processKey;
        break;
      case '문의하기':
        targetKey = _contactKey;
        break;
    }

    if (targetKey?.currentContext != null) {
      final context = targetKey!.currentContext!;
      final box = context.findRenderObject() as RenderBox?;
      if (box != null) {
        final position = box.localToGlobal(Offset.zero).dy;
        final scrollOffset = _scrollController.offset;
        final targetOffset =
            scrollOffset + position - 80; // 80px offset for navigation

        _scrollController.animateTo(
          targetOffset,
          duration: const Duration(milliseconds: 800),
          curve: Curves.easeInOutCubic,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final width = mediaQuery.size.width;
    final responsiveScale = responsive.textScale(width);
    final systemScale = MediaQuery.textScaleFactorOf(context);
    final effectiveTextScale =
        systemScale > 1.0 ? systemScale : systemScale * responsiveScale;

    return MediaQuery(
      data: mediaQuery.copyWith(
        textScaler: TextScaler.linear(effectiveTextScale),
      ),
      child: BlocListener<LandingCubit, LandingState>(
        listenWhen: (previous, current) =>
            previous.isContactDialogVisible != current.isContactDialogVisible ||
            previous.contactIntent != current.contactIntent,
        listener: (context, state) async {
          if (state.isContactDialogVisible) {
            await _showContactDialog(context, state);
            if (context.mounted) {
              context.read<LandingCubit>().dismissContactDialog();
            }
          }
        },
        child: BlocBuilder<LandingCubit, LandingState>(
          builder: (context, state) {
            final cubit = context.read<LandingCubit>();
            void handleProjectInquiry() => cubit.requestProjectInquiry();
            void handlePortfolioRequest() => cubit.requestPortfolio();

            return Scaffold(
              body: Stack(
                children: [
                  SingleChildScrollView(
                    controller: _scrollController,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        if (state.isUrgencyBannerVisible)
                          const SizedBox(height: 48),
                        LandingHero(
                          hero: state.hero,
                          navItems: state.navItems,
                          onProjectInquiry: handleProjectInquiry,
                          onPortfolioRequest: handlePortfolioRequest,
                          onNavItemClick: _scrollToSection,
                        ),
                        // Increased spacing for "Pro" feel (Whitespace is luxury)
                        const SizedBox(height: 160),
                        PhilosophySection(key: _philosophyKey),
                        const SizedBox(height: 160),
                        FounderSection(
                          key: _founderKey,
                          profile: state.founder,
                        ),
                        const SizedBox(height: 180),
                        CaseStudiesSection(
                          studies: state.caseStudies,
                          onProjectInquiry: handleProjectInquiry,
                        ),
                        const SizedBox(height: 180),
                        ProjectGallerySection(projects: state.galleryProjects),
                        const SizedBox(height: 180),
                        ProcessSection(
                          key: _processKey,
                          steps: state.processSteps,
                        ),
                        const SizedBox(height: 180),
                        LandingServices(
                          key: _servicesKey,
                          services: state.services,
                        ),
                        const SizedBox(height: 180),
                        ReviewSection(reviews: state.reviews),
                        const SizedBox(height: 180),
                        SpotlightCtaSection(
                          data: state.spotlight,
                          onPrimary: handleProjectInquiry,
                          onSecondary: handlePortfolioRequest,
                        ),
                        const SizedBox(height: 120),
                        FooterSection(key: _contactKey, content: state.footer),
                      ],
                    ),
                  ),
                  if (state.isUrgencyBannerVisible)
                    Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      child: UrgencyBanner(
                        onDismiss: () => cubit.dismissUrgencyBanner(),
                      ),
                    ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}







Future<void> _showContactDialog(BuildContext context, LandingState state) {
  return showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (dialogContext) {
      return BlocProvider.value(
        value: context.read<LandingCubit>(),
        child: Dialog(
          backgroundColor: AppColors.surface,
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600),
            child: _LeadFormDialog(
              intent: state.contactIntent ?? ContactIntent.projectInquiry,
            ),
          ),
        ),
      );
    },
  );
}

class _LeadFormDialog extends StatefulWidget {
  const _LeadFormDialog({required this.intent});

  final ContactIntent intent;

  @override
  State<_LeadFormDialog> createState() => _LeadFormDialogState();
}

class _LeadFormDialogState extends State<_LeadFormDialog> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _companyController = TextEditingController();
  final _descriptionController = TextEditingController();
  String? _selectedBudget;
  String? _selectedTimeline;

  final List<String> _budgetOptions = [
    '1천만원 미만',
    '1천만원 ~ 3천만원',
    '3천만원 ~ 5천만원',
    '5천만원 ~ 1억원',
    '1억원 이상',
    '협의 필요',
  ];

  final List<String> _timelineOptions = [
    '가능한 빠르게',
    '1개월 이내',
    '1~3개월',
    '3~6개월',
    '6개월 이상',
    '유동적',
  ];

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _companyController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cubit = context.read<LandingCubit>();

    return BlocConsumer<LandingCubit, LandingState>(
      listener: (context, state) {
        if (state.formStatus == FormSubmissionStatus.success) {
          Navigator.of(context).pop();
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('문의가 성공적으로 접수되었습니다. 빠른 시일 내에 연락드리겠습니다.'),
              backgroundColor: AppColors.accent,
            ),
          );
        }
      },
      builder: (context, state) {
        final isSubmitting =
            state.formStatus == FormSubmissionStatus.submitting;
        final headline =
            widget.intent == ContactIntent.portfolio ? '포트폴리오 요청' : '프로젝트 문의';

        return SingleChildScrollView(
          padding: const EdgeInsets.all(32),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        headline,
                        style: theme.textTheme.headlineSmall?.copyWith(
                          color: AppColors.textPrimary,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed:
                          isSubmitting
                              ? null
                              : () => Navigator.of(context).pop(),
                      icon: const Icon(Icons.close),
                      color: AppColors.textSecondary,
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  '아래 정보를 입력해주시면 빠르게 연락드리겠습니다.',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
                const SizedBox(height: 24),
                _buildTextField(
                  controller: _nameController,
                  label: '이름',
                  hint: '홍길동',
                  isRequired: true,
                  enabled: !isSubmitting,
                  onChanged: (value) => cubit.updateFormField(name: value),
                ),
                const SizedBox(height: 16),
                _buildTextField(
                  controller: _emailController,
                  label: '이메일',
                  hint: 'example@company.com',
                  isRequired: true,
                  enabled: !isSubmitting,
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (value) => cubit.updateFormField(email: value),
                ),
                const SizedBox(height: 16),
                _buildTextField(
                  controller: _companyController,
                  label: '회사명',
                  hint: '(선택) 소속 회사나 팀',
                  enabled: !isSubmitting,
                  onChanged: (value) => cubit.updateFormField(company: value),
                ),
                const SizedBox(height: 16),
                _buildTextField(
                  controller: _descriptionController,
                  label: '프로젝트 설명',
                  hint: '어떤 제품을 만들고 싶으신가요? 간단히 설명해주세요.',
                  isRequired: true,
                  enabled: !isSubmitting,
                  maxLines: 4,
                  onChanged:
                      (value) =>
                          cubit.updateFormField(projectDescription: value),
                ),
                const SizedBox(height: 16),
                _buildDropdown(
                  label: '예상 예산',
                  value: _selectedBudget,
                  items: _budgetOptions,
                  enabled: !isSubmitting,
                  onChanged: (value) {
                    setState(() => _selectedBudget = value);
                    cubit.updateFormField(budget: value);
                  },
                ),
                const SizedBox(height: 16),
                _buildDropdown(
                  label: '희망 시작 시기',
                  value: _selectedTimeline,
                  items: _timelineOptions,
                  enabled: !isSubmitting,
                  onChanged: (value) {
                    setState(() => _selectedTimeline = value);
                    cubit.updateFormField(timeline: value);
                  },
                ),
                if (state.formErrorMessage != null) ...[
                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.red.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: Colors.red.withValues(alpha: 0.3),
                      ),
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.error_outline,
                          color: Colors.red,
                          size: 20,
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            state.formErrorMessage!,
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed:
                          isSubmitting
                              ? null
                              : () => Navigator.of(context).pop(),
                      child: const Text('취소'),
                    ),
                    const SizedBox(width: 12),
                    ElevatedButton(
                      onPressed:
                          isSubmitting
                              ? null
                              : () {
                                cubit.submitLeadForm();
                              },
                      child:
                          isSubmitting
                              ? const SizedBox(
                                width: 20,
                                height: 20,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                ),
                              )
                              : const Text('제출하기'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
    bool isRequired = false,
    bool enabled = true,
    int maxLines = 1,
    TextInputType? keyboardType,
    required Function(String) onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              label,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: AppColors.textPrimary,
                fontWeight: FontWeight.w600,
              ),
            ),
            if (isRequired)
              Text(' *', style: TextStyle(color: AppColors.accent)),
          ],
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          enabled: enabled,
          maxLines: maxLines,
          keyboardType: keyboardType,
          onChanged: onChanged,
          style: TextStyle(color: AppColors.textPrimary),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(
              color: AppColors.textSecondary.withValues(alpha: 0.5),
            ),
            filled: true,
            fillColor: AppColors.background.withValues(alpha: 0.5),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: Colors.white.withValues(alpha: 0.1),
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: Colors.white.withValues(alpha: 0.1),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: AppColors.accent, width: 2),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 12,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDropdown({
    required String label,
    required String? value,
    required List<String> items,
    required bool enabled,
    required Function(String?) onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        DropdownButtonFormField<String>(
          // ignore: deprecated_member_use
          value: value,
          onChanged: enabled ? onChanged : null,
          dropdownColor: AppColors.surface,
          style: TextStyle(color: AppColors.textPrimary),
          decoration: InputDecoration(
            filled: true,
            fillColor: AppColors.background.withValues(alpha: 0.5),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: Colors.white.withValues(alpha: 0.1),
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: Colors.white.withValues(alpha: 0.1),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: AppColors.accent, width: 2),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 12,
            ),
          ),
          items:
              items.map((item) {
                return DropdownMenuItem(value: item, child: Text(item));
              }).toList(),
        ),
      ],
    );
  }
}

class UrgencyBanner extends StatefulWidget {
  const UrgencyBanner({super.key, required this.onDismiss});

  final VoidCallback onDismiss;

  @override
  State<UrgencyBanner> createState() => _UrgencyBannerState();
}

class _UrgencyBannerState extends State<UrgencyBanner> {
  late Timer _timer;
  late DateTime _deadline;
  Duration _remaining = Duration.zero;

  @override
  void initState() {
    super.initState();
    // 7일 후를 마감 시간으로 설정
    _deadline = DateTime.now().add(const Duration(days: 7));
    _updateRemaining();

    // 매초 업데이트
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (mounted) {
        _updateRemaining();
      }
    });
  }

  void _updateRemaining() {
    setState(() {
      _remaining = _deadline.difference(DateTime.now());
      if (_remaining.isNegative) {
        _remaining = Duration.zero;
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  String _formatRemaining() {
    final days = _remaining.inDays;
    final hours = _remaining.inHours % 24;
    final minutes = _remaining.inMinutes % 60;
    final seconds = _remaining.inSeconds % 60;

    if (days > 0) {
      return '$days일 $hours시간 $minutes분 남음';
    } else if (hours > 0) {
      return '$hours시간 $minutes분 $seconds초 남음';
    } else {
      return '$minutes분 $seconds초 남음';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFFFC1C49), Color(0xFFFF6B6B)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.2),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.access_time, color: Colors.white, size: 18),
          const SizedBox(width: 8),
          const Text(
            '이번 주 무료 상담 마감까지',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.3,
            ),
          ),
          const SizedBox(width: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.15),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Text(
              _formatRemaining(),
              style: const TextStyle(
                color: Color(0xFFFC1C49),
                fontSize: 13,
                fontWeight: FontWeight.w800,
                letterSpacing: 0.5,
              ),
            ),
          ),
          const SizedBox(width: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.25),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Text(
              '서둘러 신청하세요!',
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const Spacer(),
          IconButton(
            icon: const Icon(Icons.close, color: Colors.white, size: 20),
            onPressed: widget.onDismiss,
            constraints: const BoxConstraints(),
            padding: EdgeInsets.zero,
            visualDensity: VisualDensity.compact,
          ),
        ],
      ),
    );
  }
}






