
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../shared/theme/app_colors.dart';
import '../../../shared/utils/responsive.dart' as responsive;
import '../landing_cubit.dart';
import '../landing_state.dart';

class ProjectGallerySection extends StatefulWidget {
  const ProjectGallerySection({super.key, required this.projects});

  final List<ProjectGalleryItem> projects;

  @override
  State<ProjectGallerySection> createState() => _ProjectGallerySectionState();
}

class _ProjectGallerySectionState extends State<ProjectGallerySection> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  String _getCategoryLabel(ProjectCategory category) {
    switch (category) {
      case ProjectCategory.all:
        return '전체';
      case ProjectCategory.healthcare:
        return '헬스케어';
      case ProjectCategory.b2b:
        return 'B2B';
      case ProjectCategory.edtech:
        return 'EdTech';
      case ProjectCategory.entertainment:
        return '엔터테인먼트';
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocBuilder<LandingCubit, LandingState>(
      builder: (context, state) {
        final cubit = context.read<LandingCubit>();

        // Filter projects based on selected category
        final filteredProjects =
            state.selectedProjectCategory == ProjectCategory.all
                ? widget.projects
                : widget.projects
                    .where(
                      (p) => p.categoryType == state.selectedProjectCategory,
                    )
                    .toList();

        return LayoutBuilder(
          builder: (context, constraints) {
            final width = constraints.maxWidth;
            final horizontalPadding = responsive.horizontalPadding(width);

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '프로젝트 갤러리',
                          style: theme.textTheme.titleMedium?.copyWith(
                            color: AppColors.accent,
                            letterSpacing: 0.8,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          '다양한 산업에서 수익 내는 앱 사례를 확인하세요',
                          style: theme.textTheme.headlineMedium?.copyWith(
                            color: AppColors.textPrimary,
                            fontWeight: FontWeight.w700,
                            fontSize: width >= 1024 ? 48 : 32,
                            letterSpacing: -0.4,
                          ),
                        ),
                        const SizedBox(height: 18),
                        Text(
                          'Flutter로 구축한 다양한 산업군의 모바일 앱 포트폴리오입니다. 아이디어 검증부터 디자인, 개발, 앱스토어 출시까지 전 과정을 직접 리드했습니다.',
                          style: theme.textTheme.bodyLarge?.copyWith(
                            color: AppColors.textSecondary,
                            height: 1.6,
                          ),
                        ),
                        const SizedBox(height: 32),
                        // Filter Buttons
                        Wrap(
                          spacing: 12,
                          runSpacing: 12,
                          children:
                              ProjectCategory.values.map((category) {
                                final isSelected =
                                    state.selectedProjectCategory == category;
                                return _FilterChip(
                                  label: _getCategoryLabel(category),
                                  isSelected: isSelected,
                                  onTap:
                                      () =>
                                          cubit.selectProjectCategory(category),
                                );
                              }).toList(),
                        ),
                      ],
                    ),

                ),
                const SizedBox(height: 32),
                SizedBox(
                  height: 420,
                  child:
                      filteredProjects.isEmpty
                          ? Center(
                            child: Text(
                              '해당 카테고리의 프로젝트가 없습니다',
                              style: theme.textTheme.bodyLarge?.copyWith(
                                color: AppColors.textSecondary,
                              ),
                            ),
                          )
                          : Scrollbar(
                            controller: _scrollController,
                            thumbVisibility: true,
                            thickness: 4,
                            radius: const Radius.circular(8),
                            child: ListView.builder(
                              controller: _scrollController,
                              scrollDirection: Axis.horizontal,
                              physics: const BouncingScrollPhysics(),
                              padding: EdgeInsets.symmetric(
                                horizontal: horizontalPadding,
                              ),
                              itemCount: filteredProjects.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: EdgeInsets.only(
                                    right:
                                        index < filteredProjects.length - 1
                                            ? 24
                                            : 0,
                                  ),
                                  child: _ProjectCard(
                                    project: filteredProjects[index],
                                  ),
                                );
                              },
                            ),
                          ),
                ),
              ],
            );
          },
        );
      },
    );
  }
}

class _FilterChip extends StatelessWidget {
  const _FilterChip({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color:
              isSelected
                  ? AppColors.accent
                  : AppColors.surface.withValues(alpha: 0.4),
          borderRadius: BorderRadius.circular(999),
          border: Border.all(
            color:
                isSelected
                    ? AppColors.accent
                    : Colors.white.withValues(alpha: 0.1),
            width: 1.5,
          ),
        ),
        child: Text(
          label,
          style: theme.textTheme.bodyMedium?.copyWith(
            color: isSelected ? Colors.white : AppColors.textSecondary,
            fontWeight: isSelected ? FontWeight.w700 : FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

class _ProjectCard extends StatefulWidget {
  const _ProjectCard({required this.project});

  final ProjectGalleryItem project;

  @override
  State<_ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<_ProjectCard> {
  bool _isHovered = false;

  void _handleHover(bool hovered) {
    if (_isHovered == hovered) return;
    setState(() => _isHovered = hovered);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final project = widget.project;

    return MouseRegion(
      onEnter: (_) => _handleHover(true),
      onExit: (_) => _handleHover(false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 220),
        curve: Curves.easeOut,
        width: 320,
        transform: Matrix4.translationValues(0.0, _isHovered ? -6.0 : 0.0, 0.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: _isHovered ? 0.45 : 0.22),
              blurRadius: _isHovered ? 44 : 24,
              offset: Offset(0, _isHovered ? 18 : 12),
              spreadRadius: _isHovered ? -6 : -12,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(24),
          child: Stack(
            fit: StackFit.expand,
            children: [
              _buildProjectImage(project),
              Positioned.fill(
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 220),
                  curve: Curves.easeOut,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors:
                          _isHovered
                              ? [
                                Colors.black.withValues(alpha: 0.08),
                                Colors.black.withValues(alpha: 0.85),
                              ]
                              : [
                                Colors.black.withValues(alpha: 0.0),
                                Colors.black.withValues(alpha: 0.78),
                              ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.all(24),
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0x00121A2F), Color(0xCC121A2F)],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  child: AnimatedCrossFade(
                    alignment: Alignment.topLeft,
                    firstChild: _buildDefaultContent(theme, project),
                    secondChild: _buildHoverContent(theme, project),
                    crossFadeState:
                        _isHovered
                            ? CrossFadeState.showSecond
                            : CrossFadeState.showFirst,
                    duration: const Duration(milliseconds: 240),
                    sizeCurve: Curves.easeOut,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProjectImage(ProjectGalleryItem project) {
    final targetUrl =
        _isHovered && project.hoverImageUrl != null
            ? project.hoverImageUrl!
            : project.imageUrl;

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 220),
      switchInCurve: Curves.easeOut,
      switchOutCurve: Curves.easeOut,
      child: Container(
        key: ValueKey<String>('${project.name}-$targetUrl-$_isHovered'),
        child: Image.network(
          targetUrl,
          fit: BoxFit.cover,
          alignment: Alignment.topCenter,
          filterQuality: FilterQuality.high,
          errorBuilder: (context, error, stackTrace) {
            return Container(
              color: const Color(0xFF1B2A4F),
              alignment: Alignment.center,
              child: Icon(
                Icons.broken_image_outlined,
                size: 48,
                color: Colors.white.withValues(alpha: 0.4),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildDefaultContent(ThemeData theme, ProjectGalleryItem project) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildCategoryChip(theme, project.category),
        const SizedBox(height: 12),
        Text(
          project.name,
          style: theme.textTheme.headlineSmall?.copyWith(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          project.description,
          style: theme.textTheme.bodySmall?.copyWith(
            color: AppColors.textSecondary,
            height: 1.5,
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }

  Widget _buildHoverContent(ThemeData theme, ProjectGalleryItem project) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildCategoryChip(theme, project.category),
        const SizedBox(height: 12),
        Text(
          project.name,
          style: theme.textTheme.headlineSmall?.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          project.description,
          style: theme.textTheme.bodySmall?.copyWith(
            color: Colors.white.withValues(alpha: 0.85),
            height: 1.5,
          ),
        ),
        if (project.hoverHighlights.isNotEmpty) ...[
          const SizedBox(height: 16),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children:
                project.hoverHighlights
                    .map((highlight) => _buildHighlightChip(theme, highlight))
                    .toList(),
          ),
        ],
      ],
    );
  }

  Widget _buildCategoryChip(ThemeData theme, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.accent.withValues(alpha: 0.18),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.accent.withValues(alpha: 0.4)),
      ),
      child: Text(
        label,
        style: theme.textTheme.bodySmall?.copyWith(
          color: AppColors.accent,
          fontWeight: FontWeight.w600,
          fontSize: 11,
          letterSpacing: 0.2,
        ),
      ),
    );
  }

  Widget _buildHighlightChip(ThemeData theme, String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: AppColors.accent.withValues(alpha: 0.35)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.check_rounded, size: 14, color: AppColors.accent),
          const SizedBox(width: 6),
          Flexible(
            child: Text(
              text,
              style: theme.textTheme.bodySmall?.copyWith(
                color: Colors.white.withValues(alpha: 0.88),
                fontSize: 11,
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
