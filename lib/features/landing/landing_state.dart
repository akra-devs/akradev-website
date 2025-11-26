import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'landing_state.freezed.dart';

@freezed
class LandingState with _$LandingState {
  const factory LandingState({
    required List<String> navItems,
    required HeroSection hero,
    required FounderProfile founder,
    required List<ServiceItem> services,
    required FooterContent footer,
    required List<CaseStudy> caseStudies,
    required List<ProcessStep> processSteps,
    required PrimaryCta spotlight,
    required List<ProjectGalleryItem> galleryProjects,
    required List<ReviewItem> reviews,
    @Default(false) bool isContactDialogVisible,
    ContactIntent? contactIntent,
    @Default(LeadFormData()) LeadFormData formData,
    @Default(FormSubmissionStatus.idle) FormSubmissionStatus formStatus,
    String? formErrorMessage,
    @Default(true) bool isUrgencyBannerVisible,
    @Default(ProjectCategory.all) ProjectCategory selectedProjectCategory,
  }) = _LandingState;

  factory LandingState.initial() => LandingState(
    navItems: const ['철학', '팀', '서비스', '프로세스', '문의하기'],
    hero: const HeroSection(
      badge: '디지털 프로덕트 스튜디오',
      headline: '비즈니스의 본질을\n디지털로 구현합니다',
      subHeadline: '단순한 앱 개발을 넘어, 시장에서 증명되는\n지속 가능한 비즈니스 모델을 함께 설계합니다.',
      description:
          '우리는 기술을 통해 비즈니스 가치를 극대화하는 디지털 프로덕트 스튜디오입니다. '
          '기획부터 디자인, 개발, 그리고 런칭 이후의 데이터 분석까지. '
          '성공적인 프로덕트를 위한 A to Z를 파트너와 함께 고민하고 실행합니다.',
      metrics: [
        MetricInfo(value: '100%', label: '프로젝트 성공률'),
        MetricInfo(value: '3.5x', label: '평균 ROI 달성'),
        MetricInfo(value: '4.9', label: '클라이언트 만족도'),
      ],
      showcaseItems: [
        ShowcaseItem(
          title: 'Habitree',
          subtitle: 'Global Wellness Platform',
          description: '글로벌 20만 다운로드 달성 · 3개월 내 MVP 런칭',
        ),
        ShowcaseItem(
          title: 'F&B Console',
          subtitle: 'Enterprise SaaS Solution',
          description: '프랜차이즈 150개 매장 도입 · 운영 비용 60% 절감',
        ),
      ],
      trustedBy: ['GS Retail', 'YG Entertainment', 'GreenLabs', 'MegaStudio'],
      heroImageUrl: 'https://placehold.co/640x820/0f172a/38bdf8.png?text=Digital+Craftsmanship',
    ),
    founder: const FounderProfile(
      name: '김도란',
      role: '리드 아키텍트 & 파운더',
      bio:
          '비즈니스 임팩트를 최우선으로 생각하는 풀스택 엔지니어입니다. '
          '다수의 스타트업 초기 멤버로서 0 to 1을 경험했으며, '
          '기술적 복잡함을 해결하여 비즈니스 가치를 창출하는 데 집중합니다.',
      profileImageUrl: 'https://ui-avatars.com/api/?name=김도란&background=1B2A4F&color=fff&size=256&font-size=0.33',
      highlights: [
        '스타트업 CTO 출신',
        '대규모 트래픽 처리 경험',
        '비즈니스 중심의 기술 설계',
      ],
      techStacks: ['Flutter', 'Node.js', 'AWS', 'Supabase', 'Python'],
    ),
    services: const [
      ServiceItem(
        icon: Icons.rocket_launch_outlined,
        title: 'MVP 개발',
        subtitle: '가설 검증을 위한 최적의 시작',
        description:
            '핵심 가설을 검증하기 위한 최소 기능 제품(MVP)을 신속하게 구축합니다. '
            '불필요한 기능은 과감히 덜어내고, 시장 반응을 확인할 수 있는 '
            '가장 효율적인 형태의 프로덕트를 제안합니다.',
        points: [
          '비즈니스 모델 분석 및 핵심 가치 정의',
          '빠른 프로토타이핑 및 사용자 테스트',
          '시장 검증을 위한 데이터 수집 환경 구축',
        ],
      ),
      ServiceItem(
        icon: Icons.layers_outlined,
        title: '프로덕트 엔지니어링',
        subtitle: '확장 가능한 아키텍처',
        description:
            '검증된 프로덕트의 고도화 및 스케일업을 지원합니다. '
            '대규모 트래픽을 처리할 수 있는 견고한 아키텍처를 설계하고, '
            '유지보수성과 확장성을 고려한 엔지니어링을 제공합니다.',
        points: [
          '클린 아키텍처 기반의 확장 가능한 코드베이스',
          'CI/CD 파이프라인 구축 및 배포 자동화',
          '성능 최적화 및 레거시 시스템 리팩토링',
        ],
      ),
    ],
    caseStudies: const [
      CaseStudy(
        company: 'Habitree',
        title: '습관 형성 플랫폼의 글로벌 스케일업',
        description:
            '초기 아이디어 단계에서 시작하여 글로벌 런칭까지 전 과정을 함께했습니다. '
            '게이미피케이션 요소를 도입하여 사용자 리텐션을 극대화하고, '
            '국가별 현지화 전략을 통해 글로벌 시장에 성공적으로 안착했습니다.',
        result: '글로벌 20만 다운로드, 리텐션 38% 달성',
        highlights: [
          '사용자 행동 데이터 기반의 UX 최적화',
          '실시간 동기화 및 오프라인 모드 지원',
          '다국어 지원 및 타임존 처리 완벽 대응',
        ],
        detailedMetrics: DetailedMetrics(
          downloads: '20만+',
          retention: '30일 리텐션 38%',
          revenue: '전월 대비 +150%',
          conversionRate: '유료 전환 4.3%',
        ),
      ),
      CaseStudy(
        company: 'F&B Console',
        title: '프랜차이즈 운영 효율화 솔루션',
        description:
            '수기 관리되던 매장 데이터를 디지털로 전환하여 운영 효율을 혁신했습니다. '
            '실시간 매출 분석 및 재고 관리 시스템을 통해 '
            '본사와 가맹점 간의 커뮤니케이션 비용을 획기적으로 줄였습니다.',
        result: '운영 비용 60% 절감, 업무 처리 속도 5배 향상',
        highlights: [
          '복잡한 비즈니스 로직의 도메인 주도 설계(DDD)',
          '실시간 데이터 파이프라인 구축',
          '크로스 플랫폼(Web, Tablet, Mobile) 완벽 지원',
        ],
        detailedMetrics: DetailedMetrics(
          downloads: '150개 매장',
          retention: '활성 매장 99%',
          revenue: '비용 60% 절감',
          conversionRate: '속도 5배 향상',
        ),
      ),
      CaseStudy(
        company: 'EduLabs',
        title: 'B2B 교육 플랫폼의 디지털 트랜스포메이션',
        description:
            '기존 레거시 시스템을 현대적인 웹 애플리케이션으로 재구축했습니다. '
            '사용자 경험(UX)을 중심으로 인터페이스를 전면 개편하여 '
            'B2B 고객사의 도입률과 만족도를 크게 높였습니다.',
        result: '계약 전환율 2.1배 상승, 고객 만족도(NPS) 34점 증가',
        highlights: [
          '디자인 시스템 구축을 통한 일관된 브랜드 경험',
          '대용량 미디어 처리 및 스트리밍 최적화',
          '관리자 대시보드 및 데이터 시각화 구현',
        ],
        detailedMetrics: DetailedMetrics(
          downloads: '38개 고객사',
          retention: '재계약율 89%',
          revenue: '연간 매출 \$180K',
          conversionRate: '12% → 26%',
        ),
      ),
    ],
    processSteps: const [
      ProcessStep(
        order: 1,
        title: '발견 및 정의',
        description: '비즈니스의 본질과 목표를 깊이 있게 이해합니다. 핵심 문제를 정의하고 해결책을 구체화합니다.',
        duration: '전략 수립',
      ),
      ProcessStep(
        order: 2,
        title: '디자인 및 설계',
        description: '사용자 경험을 설계하고 시각화합니다. 심미성과 사용성을 모두 고려한 인터페이스를 만듭니다.',
        duration: '크리에이티브',
      ),
      ProcessStep(
        order: 3,
        title: '개발 및 구현',
        description: '견고하고 확장 가능한 코드를 작성합니다. 최신 기술 스택을 활용하여 최고의 성능을 구현합니다.',
        duration: '엔지니어링',
      ),
      ProcessStep(
        order: 4,
        title: '성장 및 최적화',
        description: '런칭은 시작일 뿐입니다. 데이터 기반의 분석과 개선을 통해 지속적인 성장을 만들어갑니다.',
        duration: '그로스',
      ),
    ],
    spotlight: const PrimaryCta(
      eyebrow: '지금 시작하세요',
      headline: '당신의 비즈니스를\n다음 단계로 이끌어드립니다',
      body: '단순한 개발 외주가 아닌, 비즈니스 파트너로서 함께 고민하겠습니다.\n'
          '성공적인 디지털 프로덕트를 위한 여정을 지금 시작하세요.',
      primaryLabel: '프로젝트 문의하기',
      secondaryLabel: '포트폴리오 보기',
    ),
    footer: const FooterContent(
      headline: '미래를 함께 만듭니다.',
      body: '혁신적인 아이디어가 있으신가요? 언제든 편하게 이야기 나눠보세요.',
      contacts: [
        ContactInfo(icon: Icons.email_outlined, label: 'contact@akradev.studio'),
        ContactInfo(icon: Icons.chat_bubble_outline, label: '카카오톡 채널 @akradev'),
      ],
    ),
    galleryProjects: const [
      ProjectGalleryItem(
        name: 'Habitree',
        category: '헬스케어',
        description: '글로벌 습관 형성 플랫폼',
        imageUrl:
            'https://placehold.co/400x600/1e293b/38bdf8.png?text=Habitree',
        hoverImageUrl:
            'https://placehold.co/400x600/0f172a/38bdf8.png?text=Dashboard',
        hoverHighlights: [
          '글로벌 현지화',
          '게이미피케이션',
          '실시간 동기화',
        ],
        categoryType: ProjectCategory.healthcare,
      ),
      ProjectGalleryItem(
        name: 'F&B Console',
        category: 'SaaS',
        description: '프랜차이즈 매장 관리 솔루션',
        imageUrl:
            'https://placehold.co/400x600/1e293b/f472b6.png?text=FnB+Console',
        hoverImageUrl:
            'https://placehold.co/400x600/0f172a/f472b6.png?text=Analytics',
        hoverHighlights: [
          '멀티 플랫폼 지원',
          '실시간 데이터 분석',
          '재고 관리 시스템',
        ],
        categoryType: ProjectCategory.b2b,
      ),
      ProjectGalleryItem(
        name: 'EduLabs',
        category: 'EdTech',
        description: 'B2B 학습 관리 시스템(LMS)',
        imageUrl:
            'https://placehold.co/400x600/1e293b/a78bfa.png?text=EduLabs',
        hoverImageUrl:
            'https://placehold.co/400x600/0f172a/a78bfa.png?text=LMS',
        hoverHighlights: [
          '디자인 시스템 구축',
          '미디어 스트리밍',
          '데이터 시각화',
        ],
        categoryType: ProjectCategory.edtech,
      ),
      ProjectGalleryItem(
        name: 'YG Artist Hub',
        category: '엔터테인먼트',
        description: '글로벌 팬 커뮤니티 플랫폼',
        imageUrl:
            'https://placehold.co/400x600/1e293b/fbbf24.png?text=YG+Hub',
        hoverImageUrl:
            'https://placehold.co/400x600/0f172a/fbbf24.png?text=Community',
        hoverHighlights: [
          '대규모 트래픽 처리',
          '라이브 스트리밍',
          '글로벌 커머스',
        ],
        categoryType: ProjectCategory.entertainment,
      ),
    ],
    reviews: const [
      ReviewItem(
        clientName: 'Minjun Kim',
        clientCompany: 'Habitree',
        clientRole: 'CEO',
        rating: 5.0,
        review:
            '단순히 개발만 해주는 것이 아니라, 비즈니스 모델에 대한 깊은 이해를 바탕으로 프로덕트의 방향성을 함께 고민해주었습니다. 덕분에 글로벌 시장에서도 통하는 퀄리티의 앱을 런칭할 수 있었습니다.',
        projectType: '앱 개발',
      ),
      ReviewItem(
        clientName: 'Seoyeon Park',
        clientCompany: 'GS Retail',
        clientRole: 'Head of IT',
        rating: 4.8,
        review:
            '복잡한 요구사항을 명쾌하게 정리하고, 기술적으로 완벽하게 구현해냈습니다. 특히 현장의 목소리를 반영한 UI/UX 설계가 인상적이었습니다. 결과물에 매우 만족합니다.',
        projectType: '엔터프라이즈 솔루션',
      ),
      ReviewItem(
        clientName: 'Junho Lee',
        clientCompany: 'EduLabs',
        clientRole: 'Product Owner',
        rating: 4.9,
        review:
            '기존 시스템의 한계를 뛰어넘는 혁신적인 제안을 해주었습니다. 디자인 시스템 도입으로 개발 생산성이 크게 향상되었고, 사용자들의 반응도 폭발적입니다.',
        projectType: '플랫폼 리뉴얼',
      ),
      ReviewItem(
        clientName: 'Jiwoo Choi',
        clientCompany: 'YG Ent.',
        clientRole: 'Director',
        rating: 5.0,
        review:
            '대규모 트래픽이 발생하는 이벤트에서도 안정적인 서비스를 제공해주었습니다. 기술력은 물론이고, 커뮤니케이션 능력도 탁월하여 프로젝트 진행이 매우 매끄러웠습니다.',
        projectType: '글로벌 플랫폼',
      ),
      ReviewItem(
        clientName: 'Sumin Jung',
        clientCompany: 'GreenLabs',
        clientRole: 'CTO',
        rating: 4.9,
        review:
            '스타트업의 속도와 엔터프라이즈의 안정성을 모두 갖춘 팀입니다. MVP 검증부터 스케일업까지 믿고 맡길 수 있는 든든한 파트너입니다.',
        projectType: '애그리테크 IoT',
      ),
    ],
    contactIntent: null,
  );
}

@freezed
class HeroSection with _$HeroSection {
  const factory HeroSection({
    required String badge,
    required String headline,
    required String subHeadline,
    required String description,
    required List<MetricInfo> metrics,
    required List<ShowcaseItem> showcaseItems,
    required List<String> trustedBy,
    String? heroImageUrl,
  }) = _HeroSection;
}

@freezed
class MetricInfo with _$MetricInfo {
  const factory MetricInfo({required String value, required String label}) =
      _MetricInfo;
}

@freezed
class ShowcaseItem with _$ShowcaseItem {
  const factory ShowcaseItem({
    required String title,
    required String subtitle,
    required String description,
  }) = _ShowcaseItem;
}

@freezed
class FounderProfile with _$FounderProfile {
  const factory FounderProfile({
    required String name,
    required String role,
    required String bio,
    required List<String> highlights,
    required List<String> techStacks,
    String? profileImageUrl,
  }) = _FounderProfile;
}

@freezed
class ServiceItem with _$ServiceItem {
  const factory ServiceItem({
    required IconData icon,
    required String title,
    required String subtitle,
    required String description,
    required List<String> points,
  }) = _ServiceItem;
}

@freezed
class CaseStudy with _$CaseStudy {
  const factory CaseStudy({
    required String company,
    required String title,
    required String description,
    required String result,
    required List<String> highlights,
    DetailedMetrics? detailedMetrics,
  }) = _CaseStudy;
}

@freezed
class DetailedMetrics with _$DetailedMetrics {
  const factory DetailedMetrics({
    required String downloads,
    required String retention,
    required String revenue,
    required String conversionRate,
  }) = _DetailedMetrics;
}

@freezed
class ProcessStep with _$ProcessStep {
  const factory ProcessStep({
    required int order,
    required String title,
    required String description,
    required String duration,
  }) = _ProcessStep;
}

@freezed
class PrimaryCta with _$PrimaryCta {
  const factory PrimaryCta({
    required String eyebrow,
    required String headline,
    required String body,
    required String primaryLabel,
    required String secondaryLabel,
  }) = _PrimaryCta;
}

@freezed
class FooterContent with _$FooterContent {
  const factory FooterContent({
    required String headline,
    required String body,
    required List<ContactInfo> contacts,
  }) = _FooterContent;
}

@freezed
class ContactInfo with _$ContactInfo {
  const factory ContactInfo({required IconData icon, required String label}) =
      _ContactInfo;
}

enum ContactIntent { projectInquiry, portfolio }

enum ProjectCategory { all, healthcare, b2b, edtech, entertainment }

@freezed
class LeadFormData with _$LeadFormData {
  const factory LeadFormData({
    @Default('') String name,
    @Default('') String email,
    @Default('') String company,
    @Default('') String projectDescription,
    @Default('') String budget,
    @Default('') String timeline,
  }) = _LeadFormData;
}

enum FormSubmissionStatus { idle, submitting, success, error }

@freezed
class ProjectGalleryItem with _$ProjectGalleryItem {
  const factory ProjectGalleryItem({
    required String name,
    required String category,
    required String description,
    required String imageUrl,
    String? hoverImageUrl,
    @Default([]) List<String> hoverHighlights,
    required ProjectCategory categoryType,
    String? appStoreUrl,
    String? playStoreUrl,
  }) = _ProjectGalleryItem;
}

@freezed
class ReviewItem with _$ReviewItem {
  const factory ReviewItem({
    required String clientName,
    required String clientCompany,
    required String clientRole,
    required double rating,
    required String review,
    required String projectType,
    String? avatarUrl,
  }) = _ReviewItem;
}
