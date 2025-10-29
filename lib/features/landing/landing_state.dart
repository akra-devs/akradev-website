import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'landing_state.freezed.dart';

@freezed
class LandingState with _$LandingState {
  const factory LandingState({
    required List<String> navItems,
    required HeroSection hero,
    required List<ServiceItem> services,
    required FooterContent footer,
    required List<CaseStudy> caseStudies,
    required List<ProcessStep> processSteps,
    required PrimaryCta spotlight,
    @Default(false) bool isContactDialogVisible,
    ContactIntent? contactIntent,
    @Default(LeadFormData()) LeadFormData formData,
    @Default(FormSubmissionStatus.idle) FormSubmissionStatus formStatus,
    String? formErrorMessage,
    @Default(true) bool isUrgencyBannerVisible,
  }) = _LandingState;

  factory LandingState.initial() => LandingState(
        navItems: const ['서비스', '프로세스', '연락처'],
        hero: const HeroSection(
          badge: '🚀 Product Studio · 3개월 완성 프로그램',
          headline: '3개월 안에 실제 수익 내는\n앱을 만들 수 있습니다',
          subHeadline: '언제까지 기획만 하고 출시는 미룰 건가요?',
          description:
              '아이디어부터 앱스토어 출시, 첫 수익까지. akradev studio가 함께하면\n'
              '평균 3개월이면 충분합니다. 전략, 디자인, 개발, 마케팅까지\n'
              '실제로 돈 버는 제품을 만드는 과정을 경험하세요.',
          metrics: [
            MetricInfo(value: '3개월', label: '평균 출시 기간'),
            MetricInfo(value: '10+', label: '런칭 성공 프로젝트'),
            MetricInfo(value: '100%', label: '클라이언트 만족도'),
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
          trustedBy: [
            'GS리테일',
            'YG Entertainment',
            'GreenLabs',
            'MegaStudio',
          ],
        ),
        services: const [
          ServiceItem(
            icon: Icons.auto_awesome,
            title: '자체 앱 개발',
            subtitle: 'Product incubation',
            description:
                '아이디어 발굴부터 제품 출시 후 운영까지 전 과정을 책임지는 셀프 프로덕트 팀입니다. '
                '시장 적합성을 빠르게 확인하고, 데이터 기반으로 제품 개선 사이클을 돌립니다.',
            points: [
              '아이디어 검증, UX 리서치, 포지셔닝 워크숍 진행',
              '플러터 기반 모바일/웹 동시 개발 및 배포 자동화',
              '운영 데이터/퍼널 분석으로 지표 개선 로드맵 수립',
            ],
          ),
          ServiceItem(
            icon: Icons.handshake_outlined,
            title: '외주 · 협업 개발',
            subtitle: 'Build with partners',
            description:
                '기획이 완료된 프로젝트부터 0에서 1을 만드는 신규 제품까지, 상황에 맞는 팀 구성을 제안합니다. '
                '프로덕트 매니저와 개발 리더가 직접 커뮤니케이션하며 속도와 퀄리티를 모두 챙깁니다.',
            points: [
              '요구사항 정리, 일정·견적 산출, MVP 범위 정의',
              '디자인 시스템 구축과 반응형 UI 개발',
              '런칭 이후 모니터링, 핫픽스 및 장기 운영 지원',
            ],
          ),
        ],
        caseStudies: const [
          CaseStudy(
            company: 'Habitree',
            title: '커뮤니티 기반 습관 형성 앱으로 리텐션 38% 향상',
            description:
                '제로에서 MVP까지 12주 만에 제작하고, 온보딩 퍼널을 최적화하여 초기 유저의 일간 재방문을 끌어올렸습니다.',
            result: '런칭 3개월 내 2만 다운로드, 일간 활성 3배 성장',
            highlights: [
              '일일 Habit 스티키 지표 정의 및 알림 시나리오 설계',
              '커뮤니티 기능(챌린지, 랭킹)으로 사용자 참여 촉진',
              '데이터 기반 AB 테스트로 온보딩 이탈률 26% 감소',
            ],
          ),
          CaseStudy(
            company: 'F&B Console',
            title: '프랜차이즈 매장 운영 자동화로 본사 대응 속도 단축',
            description:
                '실시간 매출 대시보드와 커스텀 알림 시스템을 구축해 매장 이슈를 빠르게 감지하고 의사 결정을 돕습니다.',
            result: '주요 알림 대응 시간 24시간 → 4시간 단축',
            highlights: [
              'POS·배송 데이터 통합, 이상 탐지 룰 엔진 구현',
              '현장 매니저용 모바일 앱과 데스크탑 관리자 도구를 동시 제공',
              '자동 리포트로 본사 주간 리포트 작성 시간 70% 절감',
            ],
          ),
          CaseStudy(
            company: 'EduLabs',
            title: 'B2B 러닝 플랫폼 리뉴얼로 세일즈 전환율 상승',
            description:
                '기업 고객 온보딩 시나리오를 재정비하고 모듈형 러닝 빌더를 제공해 세일즈 파이프라인을 안정화했습니다.',
            result: '견적 문의 대비 계약 전환율 2.1배 성장',
            highlights: [
              '고객 맞춤 커리큘럼 구성 기능과 퍼널 추적 대시보드 제공',
              'CI/CD 파이프라인과 모듈식 디자인 시스템 구축',
              '사용자 테스트를 통한 IA 리디자인으로 NPS +34점',
            ],
          ),
        ],
        processSteps: const [
          ProcessStep(
            order: 1,
            title: 'Discovery & Alignment',
            description: '비즈니스 목표, 사용자 페르소나, KPI를 명확히 정리하고 MVP 범위를 합의합니다.',
            duration: '1~2주',
          ),
          ProcessStep(
            order: 2,
            title: 'Experience Design',
            description: '사용자 여정, 와이어프레임, 모듈형 UI 시스템을 설계해 반복 개발에 강한 구조를 만듭니다.',
            duration: '2~4주',
          ),
          ProcessStep(
            order: 3,
            title: 'Build & Launch',
            description: '플러터 기반 멀티플랫폼 개발과 백엔드를 통합하여 안정적인 배포/모니터링 환경을 구성합니다.',
            duration: '4~8주',
          ),
          ProcessStep(
            order: 4,
            title: 'Operate & Grow',
            description: '지표 대시보드와 실험 로드맵을 운영하며, 핫픽스부터 장기 로드맵까지 같이 완주합니다.',
            duration: '지속',
          ),
        ],
        spotlight: const PrimaryCta(
          eyebrow: 'Ready to launch?',
          headline: '아이디어를 실행으로 옮길 팀이 필요하다면, 지금 이야기 나눠요',
          body:
              '프로덕트 전략, 디자인, 개발, 운영까지 한 팀으로 움직입니다. 간단한 아이디어 공유라도 괜찮아요.',
          primaryLabel: '프로젝트 미팅 예약',
          secondaryLabel: '소개서 다운로드',
        ),
        footer: const FooterContent(
          headline: "Let's ship something bold.",
          body:
              '자체 서비스 운영 노하우로 제품의 방향성을 함께 설계합니다. 아이디어 탐색 단계라도 연락 주세요.',
          contacts: [
            ContactInfo(icon: Icons.mail_outline, label: 'hello@akradev.studio'),
            ContactInfo(icon: Icons.chat_outlined, label: 'KakaoTalk · akradev'),
          ],
        ),
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
  }) = _HeroSection;
}

@freezed
class MetricInfo with _$MetricInfo {
  const factory MetricInfo({
    required String value,
    required String label,
  }) = _MetricInfo;
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
  }) = _CaseStudy;
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
  const factory ContactInfo({
    required IconData icon,
    required String label,
  }) = _ContactInfo;
}

enum ContactIntent { projectInquiry, portfolio }

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
