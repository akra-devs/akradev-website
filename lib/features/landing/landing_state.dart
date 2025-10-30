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
    navItems: const ['만드는 사람', '서비스', '프로세스', '연락처'],
    hero: const HeroSection(
      badge: '🚀 Product Studio · 3개월 완성 프로그램',
      headline: '3개월 안에 실제 수익 내는\n앱을 만들 수 있습니다',
      subHeadline: '언제까지 기획만 하고 출시는 미룰 건가요?',
      description:
          '아이디어부터 앱스토어 출시, 첫 수익까지. akradev studio가 함께하면\n'
          '평균 3개월이면 충분합니다. Flutter로 iOS·Android·Web을 한 번에,\n'
          '전략·디자인·개발·마케팅까지 실제로 돈 버는 제품을 만드는 과정을 경험하세요.',
      metrics: [
        MetricInfo(value: '3개월', label: '평균 출시 기간'),
        MetricInfo(value: '10+', label: '런칭 성공 프로젝트'),
        MetricInfo(value: '4.9/5.0', label: '클라이언트 평점'),
      ],
      showcaseItems: [
        ShowcaseItem(
          title: 'Habitree',
          subtitle: '습관 형성 커뮤니티 앱',
          description: 'iOS, Android, 웹 동시 런칭 · 3개월 MVP 제작',
        ),
        ShowcaseItem(
          title: 'F&B Console',
          subtitle: '프랜차이즈 매장 운영 대시보드',
          description: '실시간 매출 모니터링 · 커스텀 알림 시나리오',
        ),
      ],
      trustedBy: ['GS리테일', 'YG Entertainment', 'GreenLabs', 'MegaStudio'],
      heroImageUrl: 'https://placehold.co/640x820/0f172a/38bdf8.png?text=Flutter+App+Studio',
    ),
    founder: const FounderProfile(
      name: '도란 (akradev studio)',
      role: 'Flutter Product Studio 대표 · 모바일 제품 개발자',
      bio:
          'Flutter로 iOS·Android·Web을 동시에 개발하며, 자체 앱 개발 경험을 바탕으로 '
          '빠른 MVP 출시와 데이터 기반 제품 개선을 실행합니다. BLoC 패턴과 클린 아키텍처로 '
          '확장 가능한 코드를 작성하고, 백엔드 개발 경험으로 풀스택 프로젝트를 완성합니다.',
      highlights: [
        'Flutter로 Habitree(습관 앱), F&B Console(매장 운영) 등 10+ 프로젝트 런칭',
        'BLoC + Freezed 상태 관리, 클린 아키텍처로 유지보수 가능한 코드베이스 구축',
        'Firebase, Supabase, REST API 연동으로 인증·결제·알림 전체 플로우 구현',
        '앱스토어·플레이스토어 배포 자동화(Fastlane, CI/CD)로 릴리즈 주기 단축',
      ],
      techStacks: [
        'Flutter',
        'Dart',
        'BLoC · Riverpod',
        'Firebase · Supabase',
        'REST API · GraphQL',
        'Spring Boot (백엔드 협업)',
        'Git · CI/CD',
      ],
      profileImageUrl: 'https://placehold.co/360x360/111f39/34d399.png?text=akradev',
    ),
    services: const [
      ServiceItem(
        icon: Icons.auto_awesome,
        title: '자체 앱 개발',
        subtitle: 'Product incubation',
        description:
            '아이디어 발굴부터 제품 출시 후 운영까지 전 과정을 책임지는 셀프 프로덕트 팀입니다. '
            'Flutter로 iOS·Android·Web을 동시 개발하고, 시장 적합성을 빠르게 확인하며, '
            '데이터 기반으로 제품 개선 사이클을 돌립니다.',
        points: [
          '아이디어 검증, UX 리서치, 포지셔닝 워크숍 진행',
          'Flutter 기반 모바일/웹 동시 개발 및 배포 자동화',
          '운영 데이터/퍼널 분석으로 지표 개선 로드맵 수립',
        ],
      ),
      ServiceItem(
        icon: Icons.handshake_outlined,
        title: '외주 · 협업 개발',
        subtitle: 'Build with partners',
        description:
            '기획이 완료된 프로젝트부터 0에서 1을 만드는 신규 제품까지, 상황에 맞는 팀 구성을 제안합니다. '
            '프로덕트 매니저와 개발 리더가 직접 커뮤니케이션하며 속도와 퀄리티를 모두 챙깁니다. '
            'Flutter 앱 개발은 물론, 백엔드(Spring Boot) 개발까지 풀스택으로 지원합니다.',
        points: [
          '요구사항 정리, 일정·견적 산출, MVP 범위 정의',
          'Flutter UI/UX 디자인 시스템 구축과 반응형 개발',
          '런칭 이후 모니터링, 핫픽스 및 장기 운영 지원',
        ],
      ),
    ],
    caseStudies: const [
      CaseStudy(
        company: 'Habitree',
        title: '커뮤니티 기반 습관 형성 앱으로 리텐션 38% 향상',
        description:
            '제로에서 MVP까지 12주 만에 제작하고, Flutter로 iOS·Android·Web을 동시 런칭했습니다. '
            '온보딩 퍼널을 최적화하여 초기 유저의 일간 재방문을 끌어올렸습니다.',
        result: '런칭 3개월 내 23,481 다운로드, 일간 활성 3배 성장',
        highlights: [
          '일일 Habit 스티키 지표 정의 및 알림 시나리오 설계',
          '커뮤니티 기능(챌린지, 랭킹)으로 사용자 참여 촉진',
          '데이터 기반 AB 테스트로 온보딩 이탈률 26% 감소',
        ],
        detailedMetrics: DetailedMetrics(
          downloads: '23,481',
          retention: 'D7 38%',
          revenue: r'월 $4.2K',
          conversionRate: '1.8% → 4.3%',
        ),
      ),
      CaseStudy(
        company: 'F&B Console',
        title: '프랜차이즈 매장 운영 자동화로 본사 대응 속도 단축',
        description:
            'Flutter로 실시간 매출 대시보드와 커스텀 알림 시스템을 구축해 매장 이슈를 빠르게 감지하고 '
            '의사 결정을 돕습니다. 모바일·웹·데스크톱을 동시 지원합니다.',
        result: '주요 알림 대응 시간 24시간 → 4시간 단축',
        highlights: [
          'POS·배송 데이터 통합, 이상 탐지 룰 엔진 구현',
          '현장 매니저용 모바일 앱과 데스크탑 관리자 도구를 동시 제공',
          '자동 리포트로 본사 주간 리포트 작성 시간 70% 절감',
        ],
        detailedMetrics: DetailedMetrics(
          downloads: '142개 매장',
          retention: 'DAU 94%',
          revenue: '운영비 -62%',
          conversionRate: '대응시간 -83%',
        ),
      ),
      CaseStudy(
        company: 'EduLabs',
        title: 'B2B 러닝 플랫폼 리뉴얼로 계약 전환율 2배 향상',
        description:
            'Flutter Web으로 학습자·관리자 화면을 통합 재구성하고, 직관적인 IA 개선으로 전환 퍼널을 최적화했습니다. '
            '세일즈 데모부터 온보딩까지 한 번에 제공합니다.',
        result: '견적 문의 대비 계약 전환율 12% → 26%로 2.1배 성장',
        highlights: [
          'CI/CD 파이프라인과 모듈식 디자인 시스템 구축',
          '사용자 테스트를 통한 IA 리디자인으로 NPS +34점',
          '백엔드 API 연동 최적화로 페이지 로딩 속도 40% 개선',
        ],
        detailedMetrics: DetailedMetrics(
          downloads: '38개 기업',
          retention: '재계약 89%',
          revenue: r'ARR $180K',
          conversionRate: '12% → 26%',
        ),
      ),
    ],
    processSteps: const [
      ProcessStep(
        order: 1,
        title: 'Discovery',
        description: '비즈니스 목표, 타깃 유저, 핵심 가치를 인터뷰로 파악하고, 아이디어 검증 및 MVP 범위를 정의합니다.',
        duration: '1~2주',
      ),
      ProcessStep(
        order: 2,
        title: 'Design',
        description: 'UX 리서치, 정보 구조 설계, UI 프로토타입을 통해 사용자 흐름을 최적화하고 디자인 시스템을 구축합니다.',
        duration: '2~3주',
      ),
      ProcessStep(
        order: 3,
        title: 'Build',
        description: 'Flutter로 iOS·Android·Web을 동시 개발하고, 백엔드 연동, 테스트, 배포 자동화까지 한 번에 완성합니다.',
        duration: '4~8주',
      ),
      ProcessStep(
        order: 4,
        title: 'Grow',
        description: '앱스토어 출시 후 사용자 데이터를 분석하고, A/B 테스트와 기능 개선으로 전환율과 리텐션을 높입니다.',
        duration: '지속',
      ),
    ],
    spotlight: const PrimaryCta(
      eyebrow: '지금 바로 시작하세요',
      headline: '3개월 후 앱스토어에서 만나볼 수 있습니다',
      body: 'Flutter로 iOS·Android·Web을 한 번에 개발하고, 아이디어 검증부터 출시·운영까지 전체 프로세스를 함께합니다. '
          '백엔드가 필요하면 Spring Boot로 함께 구축합니다.',
      primaryLabel: '프로젝트 미팅 시작',
      secondaryLabel: '포트폴리오 살펴보기',
    ),
    footer: const FooterContent(
      headline: '만들고 싶은 앱이 있다면 편하게 연락 주세요.',
      body: '아이디어만 있어도 괜찮습니다. MVP 범위 정의부터 디자인, 개발, 앱스토어 출시까지 함께 만들어 드립니다.',
      contacts: [
        ContactInfo(icon: Icons.mail_outline, label: 'hello@akradev.studio'),
        ContactInfo(icon: Icons.chat_outlined, label: 'KakaoTalk · akradev'),
      ],
    ),
    galleryProjects: const [
      ProjectGalleryItem(
        name: 'Habitree',
        category: '헬스케어 · 습관 형성',
        description: 'Flutter로 iOS·Android·Web 동시 런칭, 12주 만에 MVP 완성',
        imageUrl:
            'https://via.placeholder.com/400x600/1e293b/38bdf8?text=Habitree',
        hoverImageUrl:
            'https://via.placeholder.com/400x600/0f172a/38bdf8?text=Habitree+Dashboard',
        hoverHighlights: [
          'BLoC 패턴 기반 상태 관리로 안정적인 커뮤니티 기능 구현',
          'Firebase 연동으로 실시간 알림, 인증, 데이터 동기화',
        ],
        categoryType: ProjectCategory.healthcare,
      ),
      ProjectGalleryItem(
        name: 'F&B Console',
        category: 'B2B · 운영 대시보드',
        description: 'Flutter로 모바일·웹·데스크톱 운영 도구 동시 제공',
        imageUrl:
            'https://via.placeholder.com/400x600/1e293b/f472b6?text=FnB+Console',
        hoverImageUrl:
            'https://via.placeholder.com/400x600/0f172a/f472b6?text=Ops+Automation',
        hoverHighlights: [
          '매장 현황 실시간 대시보드와 커스텀 알림 시스템 구현',
          '반응형 디자인으로 모바일·태블릿·데스크톱 동시 지원',
        ],
        categoryType: ProjectCategory.b2b,
      ),
      ProjectGalleryItem(
        name: 'EduLabs Platform',
        category: 'EdTech · 러닝 플랫폼',
        description: 'Flutter Web으로 B2B 러닝 플랫폼 UI/UX 전면 리뉴얼',
        imageUrl:
            'https://via.placeholder.com/400x600/1e293b/a78bfa?text=EduLabs',
        hoverImageUrl:
            'https://via.placeholder.com/400x600/0f172a/a78bfa?text=Learning+Builder',
        hoverHighlights: [
          'IA 재설계로 학습자·관리자 화면 사용성 대폭 개선',
          '반응형 디자인 시스템으로 데스크톱·태블릿 모두 지원',
        ],
        categoryType: ProjectCategory.edtech,
      ),
      ProjectGalleryItem(
        name: 'YG Artist Hub',
        category: '엔터테인먼트 · 팬 커뮤니티',
        description: 'Flutter 앱으로 팬 커뮤니티·커머스 통합, 매출 48% 향상',
        imageUrl:
            'https://via.placeholder.com/400x600/1e293b/fbbf24?text=YG+Hub',
        hoverImageUrl:
            'https://via.placeholder.com/400x600/0f172a/fbbf24?text=Fan+Engagement',
        hoverHighlights: [
          '라이브 스트리밍·굿즈 판매·포인트 시스템 통합 앱 개발',
          '실시간 알림·채팅으로 팬 참여 촉진, 재방문율 2.6배 상승',
        ],
        categoryType: ProjectCategory.entertainment,
      ),
    ],
    reviews: const [
      ReviewItem(
        clientName: '김민준',
        clientCompany: 'Habitree',
        clientRole: 'CEO',
        rating: 5.0,
        review:
            'MVP부터 정식 출시까지 3개월 만에 완성했습니다. 기획 단계부터 데이터 기반으로 의사결정을 도와주셔서 불필요한 시행착오를 줄일 수 있었어요. 특히 온보딩 퍼널 최적화로 리텐션이 크게 개선되었습니다.',
        projectType: '헬스케어 앱 개발',
      ),
      ReviewItem(
        clientName: '박서연',
        clientCompany: 'GS리테일',
        clientRole: 'IT기획팀 팀장',
        rating: 4.8,
        review:
            '프랜차이즈 매장 운영 대시보드 구축 프로젝트를 함께했습니다. 복잡한 데이터 통합 작업을 빠르게 처리해주셨고, 현장 매니저들의 피드백을 즉각 반영해주는 민첩함이 인상적이었습니다. 대응 시간이 실제로 83% 단축되었어요.',
        projectType: 'B2B 운영 도구',
      ),
      ReviewItem(
        clientName: '이준호',
        clientCompany: 'EduLabs',
        clientRole: 'Product Manager',
        rating: 4.9,
        review:
            'B2B 러닝 플랫폼 리뉴얼 프로젝트였는데, 단순히 개발만 하는 게 아니라 세일즈 퍼널까지 함께 고민해주셨습니다. 덕분에 계약 전환율이 2배 이상 올랐고, 클라이언트 온보딩도 훨씬 수월해졌어요.',
        projectType: 'EdTech 플랫폼',
      ),
      ReviewItem(
        clientName: '최지우',
        clientCompany: 'YG Entertainment',
        clientRole: 'Digital Contents Director',
        rating: 5.0,
        review:
            '팬 커뮤니티 플랫폼과 굿즈 판매를 통합한 프로젝트였습니다. 엔터테인먼트 산업 특성을 잘 이해하고 계셔서 커뮤니케이션이 매끄러웠어요. 특히 실시간 알림 시스템과 결제 통합이 안정적으로 작동합니다.',
        projectType: '엔터테인먼트 플랫폼',
      ),
      ReviewItem(
        clientName: '정수민',
        clientCompany: 'GreenLabs',
        clientRole: 'CTO',
        rating: 4.9,
        review:
            '애그리테크 스타트업으로서 빠른 MVP 검증이 필요했는데, akradev 팀이 정확히 필요한 만큼만 개발하고 나머지는 데이터로 검증하는 방식을 제안해주셨습니다. 덕분에 예산을 40% 절약하면서도 핵심 가설은 모두 검증했어요.',
        projectType: '농업 IoT 대시보드',
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
