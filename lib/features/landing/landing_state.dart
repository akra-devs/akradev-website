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
      badge: '🚀 Spring Boot · Kotlin 백엔드 스튜디오',
      headline: '비즈니스의 핵심은 데이터 흐름입니다.\nAPI부터 안정화까지 맡겨 주세요',
      subHeadline: 'B2B 교육 · 플랫폼 특화 백엔드 & Flutter 팀',
      description:
          '도메인 주도 설계로 복잡한 요구사항을 모델링하고,\n'
          'Spring Boot · Kotlin 기반으로 확장 가능한 API 아키텍처를 구축합니다.\n'
          '운영에 필요한 인증, 결제, 모니터링, Flutter 앱까지 한 번에 완성하세요.',
      metrics: [
        MetricInfo(value: '120+', label: '구축한 API 엔드포인트'),
        MetricInfo(value: '99.95%', label: '운영 SLA 보장'),
        MetricInfo(value: '3개월', label: '평균 초기 런칭 기간'),
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
      heroImageUrl: 'https://placehold.co/640x820/0f172a/38bdf8.png?text=Backend+Flow',
    ),
    founder: const FounderProfile(
      name: '도란 (akradev studio)',
      role: 'Spring Boot · Kotlin 백엔드 & Flutter 개발자',
      bio:
          'B2B 교육 솔루션 백엔드 엔지니어로서 도메인 주도 설계(DDD)와 이벤트 기반 아키텍처를 적용해 '
          '대규모 데이터 흐름을 설계해 왔습니다. Kotlin · Spring Boot로 API와 배치를 안정화하고, '
          'Flutter 멀티플랫폼 앱으로 운영자·학습자 경험을 동시에 제공합니다.',
      highlights: [
        '교육/러닝 도메인 복잡도를 DDD로 분해하고 확장 가능한 모델 구축',
        'Spring Boot + Kotlin 기반 API, 배치, 메시징 인프라 설계 및 최적화',
        'OAuth2, JWT, 결제/알림 등 핵심 연동을 포함한 프로덕트 전 주기 리드',
        'Flutter로 프런트·운영 대시보드를 빠르게 구현해 팀 생산성 2배 향상',
      ],
      techStacks: [
        'Spring Boot',
        'Kotlin',
        'Domain-Driven Design',
        'CQRS · Event Sourcing',
        'Flutter',
        'PostgreSQL',
        'AWS · GCP · NCP',
      ],
      profileImageUrl: 'https://placehold.co/360x360/111f39/34d399.png?text=akradev',
    ),
    services: const [
      ServiceItem(
        icon: Icons.auto_awesome,
        title: '데이터 중심 백엔드 구축',
        subtitle: 'Domain-driven backend',
        description:
            '비즈니스 용어와 규칙을 도메인 모델로 정리하고, Spring Boot · Kotlin으로 확장 가능한 백엔드를 제공합니다. '
            '교육·플랫폼 특화 경험을 바탕으로 인증, 결제, 통계까지 안정적으로 운영할 수 있습니다.',
        points: [
          '워크숍을 통한 요구사항·도메인 분석 및 컨텍스트 매핑',
          'DDD 기반 엔티티/애그리게잇 설계, CQRS·이벤트 구조 적용',
          '모니터링·로깅·배포 자동화까지 운영 필수 요소 내장',
        ],
      ),
      ServiceItem(
        icon: Icons.api_outlined,
        title: 'API 개발 외주',
        subtitle: 'REST · GraphQL · Event-driven',
        description:
            '프런트엔드 팀이나 외부 파트너와 함께 사용할 수 있는 명세 기반 API를 설계·개발합니다. '
            'Swagger, AsyncAPI, gRPC 등 협업 도구를 활용해 커뮤니케이션 비용을 줄입니다.',
        points: [
          '인증·권한(SSO, OAuth2, JWT) 및 멀티 테넌시 구조 설계',
          '고성능 캐싱, 비동기 큐, 배치 파이프라인으로 비용 대비 성능 최적화',
          'Swagger/Redoc 명세와 Postman 컬렉션 제공, 연동 QA 지원',
        ],
      ),
      ServiceItem(
        icon: Icons.handshake_outlined,
        title: '운영 파트너십 & 고도화',
        subtitle: 'Operate & scale together',
        description:
            '기존 시스템을 진단하고, API 개선·데이터 마트·운영 자동화를 함께 추진합니다. '
            '릴리즈 파이프라인과 모니터링 체계를 정비해 팀 전체 생산성을 높입니다.',
        points: [
          '레거시 코드 리팩터링, 테스트 코드 및 품질 지표 정비',
          '데이터 파이프라인/BI 구축으로 KPI 모니터링 체계화',
          'SLA 기반 유지보수, 장애 대응 가이드 및 온콜 프로세스 구축',
        ],
      ),
    ],
    caseStudies: const [
      CaseStudy(
        company: 'Habitree',
        title: '커뮤니티 기반 습관 앱 백엔드 전면 구축',
        description:
            '12주 만에 Spring Boot · Kotlin API와 Flutter 앱을 동시 구축해, 커뮤니티 기능과 알림 워크플로를 안정화했습니다.',
        result: '런칭 3개월 내 23,481 다운로드, MAU 3배 성장',
        highlights: [
          'DDD 기반 컨텍스트 매핑으로 습관/챌린지 도메인 모델링',
          'JWT + 소셜 로그인 API, Webhook 기반 리마인더 알림 구축',
          'Grafana/Prometheus 모니터링으로 리텐션 지표 실시간 추적',
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
        title: '전국 매장 데이터 허브 및 운영 API 구축',
        description:
            '매장·물류·CS 데이터를 하나의 API 게이트웨이로 통합하고, 이벤트 기반 대응 시나리오를 설계했습니다.',
        result: '주요 이슈 대응 시간 24시간 → 4시간 단축',
        highlights: [
          'Kafka + Spring Cloud Stream으로 이상 징후 실시간 탐지',
          '매장 등급·공지 API를 Flutter 운영 앱과 관리자 포털에 동시 제공',
          '주간 리포트 자동화로 보고서 작성 시간 70% 절감',
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
        title: 'B2B 러닝 플랫폼 API 전환 및 데이터 마트 구축',
        description:
            '기존 PHP 백엔드를 Kotlin 마이크로서비스로 이관하고, 세일즈 퍼널 분석용 데이터 마트를 설계했습니다.',
        result: '견적 문의 대비 계약 전환율 2.1배 성장',
        highlights: [
          'GraphQL + REST 하이브리드 API로 파트너사 연동 비용 절감',
          '데이터 마트·Looker Studio 대시보드로 전환 퍼널 가시화',
          'CI/CD + 블루/그린 배포로 무중단 운영 체계 마련',
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
        title: 'Discovery & Domain Story',
        description: '비즈니스 목표와 데이터 흐름을 인터뷰로 파악하고, 도메인 이벤트·용어를 정리합니다.',
        duration: '1~2주',
      ),
      ProcessStep(
        order: 2,
        title: 'Modeling & API Blueprint',
        description: '컨텍스트 매핑, ERD, API 명세(Swagger/AsyncAPI)와 시퀀스 다이어그램을 설계합니다.',
        duration: '2~4주',
      ),
      ProcessStep(
        order: 3,
        title: 'Build, QA & Automation',
        description: 'Spring Boot · Flutter 구현, 테스트 코드, CI/CD, 모니터링 대시보드까지 한 흐름으로 완성합니다.',
        duration: '4~8주',
      ),
      ProcessStep(
        order: 4,
        title: 'Operate & Grow',
        description: 'SLA 운영, 성능 튜닝, 데이터 파이프라인 확장을 통해 전환·리텐션 실험을 뒷받침합니다.',
        duration: '지속',
      ),
    ],
    spotlight: const PrimaryCta(
      eyebrow: 'Need a backend partner?',
      headline: 'API 아키텍처부터 운영 자동화까지, 한 번에 맡기세요',
      body: 'Spring Boot · Kotlin 기반 백엔드와 Flutter 앱을 함께 제공하고, 명세·테스트·모니터링을 포함한 운영 체계를 세팅합니다.',
      primaryLabel: 'API 프로젝트 상담 예약',
      secondaryLabel: '포트폴리오 살펴보기',
    ),
    footer: const FooterContent(
      headline: '데이터 흐름이 막히는 지점이 있다면 연락 주세요.',
      body: '요구사항 문서가 없어도 괜찮습니다. 도메인 스토리 정리부터 Swagger 명세, 배포 자동화까지 함께 만들어 드립니다.',
      contacts: [
        ContactInfo(icon: Icons.mail_outline, label: 'hello@akradev.studio'),
        ContactInfo(icon: Icons.chat_outlined, label: 'KakaoTalk · akradev'),
      ],
    ),
    galleryProjects: const [
      ProjectGalleryItem(
        name: 'Habitree',
        category: '헬스케어 · 습관 형성',
        description: 'Spring Boot + Flutter로 커뮤니티 습관 앱을 12주 만에 런칭',
        imageUrl:
            'https://via.placeholder.com/400x600/1e293b/38bdf8?text=Habitree',
        hoverImageUrl:
            'https://via.placeholder.com/400x600/0f172a/38bdf8?text=Habitree+Dashboard',
        hoverHighlights: [
          'DDD 기반 Kotlin API로 회원/챌린지 도메인 정비',
          'Flutter 운영 대시보드와 실시간 알림 파이프라인 구축',
        ],
        categoryType: ProjectCategory.healthcare,
      ),
      ProjectGalleryItem(
        name: 'F&B Console',
        category: 'B2B · 운영 대시보드',
        description: 'Kafka 기반 운영 API로 전국 매장 대응 속도를 4시간으로 단축',
        imageUrl:
            'https://via.placeholder.com/400x600/1e293b/f472b6?text=FnB+Console',
        hoverImageUrl:
            'https://via.placeholder.com/400x600/0f172a/f472b6?text=Ops+Automation',
        hoverHighlights: [
          '매장·물류 데이터를 통합하는 API 게이트웨이 구축',
          '주간 리포트 자동화로 리포트 작성 70% 절감',
        ],
        categoryType: ProjectCategory.b2b,
      ),
      ProjectGalleryItem(
        name: 'EduLabs Platform',
        category: 'EdTech · 러닝 플랫폼',
        description: 'GraphQL + REST API로 B2B 러닝 플랫폼 재구축',
        imageUrl:
            'https://via.placeholder.com/400x600/1e293b/a78bfa?text=EduLabs',
        hoverImageUrl:
            'https://via.placeholder.com/400x600/0f172a/a78bfa?text=Learning+Builder',
        hoverHighlights: [
          'Kotlin 마이크로서비스로 기존 Monolith 리뉴얼',
          'Looker Studio 대시보드로 퍼널 가시화',
        ],
        categoryType: ProjectCategory.edtech,
      ),
      ProjectGalleryItem(
        name: 'YG Artist Hub',
        category: '엔터테인먼트 · 팬 커뮤니티',
        description: '팬 활동 API와 커머스 연동으로 매출 48% 향상',
        imageUrl:
            'https://via.placeholder.com/400x600/1e293b/fbbf24?text=YG+Hub',
        hoverImageUrl:
            'https://via.placeholder.com/400x600/0f172a/fbbf24?text=Fan+Engagement',
        hoverHighlights: [
          '라이브·굿즈·포인트를 연결하는 이벤트 기반 구조 설계',
          '팬 활동 지표 대시보드로 재방문율 2.6배 상승',
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
