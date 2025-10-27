# 프로젝트 진행 기록

akradev studio 웹사이트(Flutter Web) 구축 과정에서 논의·적용한 사항을 문서로 정리합니다. 향후 논의나 의사결정 시 참고할 수 있도록, 날짜 대신 단계 중심으로 기록했습니다.

## 1. 초기 상태
- Flutter 기본 카운터 예제를 기반으로 프로젝트가 생성되어 있었음.
- 웹사이트 방향성: 자체 앱 개발과 외주 협업을 모두 다루는 스튜디오 소개 페이지.
- 요구사항: 반응형 구성, 한국어·영어 혼용 카피, 고품질(High-end) UI.

## 2. 메시지 및 정보 구조 논의
- 메인 섹션: 소개(Hero) · 서비스 · 프로세스 · 사례 · CTA · 푸터 구조로 합의.
- 톤앤매너: Fastcampus Vibe Coding 랜딩과 유사한 “전환 유도형” 페이지 지향.
- 콘텐츠 가정: 실제 협업사, 지표, 로고 등은 아직 확정되지 않았기에 임시 값 사용.

## 3. 기술 스택 및 상태 관리 결정
- 상태 관리: BLoC + Freezed 조합으로 통일 (팀 운영 원칙).
- `flutter_bloc`, `freezed`, `freezed_annotation`, `build_runner` 의존성 추가.
- `LandingState`를 중심으로 Hero/Services/Case Studies/Process/CTA/Contact 정보를 한 곳에서 관리하도록 설계.

## 4. 구현된 주요 UI/UX 요소

### 4.1 히어로 영역
- 배지, 메인 헤드라인, 서브 헤드라인, 장점 설명, CTA(프로젝트 상담/포트폴리오), 핵심 지표, 파트너 로고 배치.
- Freezed 모델로 구조화하여 카피 교체를 쉽게 함.

### 4.2 사례(스토리) 섹션
- 카드 3개 구성: 회사명, 문제·해결·성과 하이라이트, 결과 지표 포함.
- 임시 콘텐츠: Habitree, F&B Console, EduLabs (실제 데이터 수급 시 교체 예정).

### 4.3 프로세스 섹션
- 4단계 (Discovery → Design → Build → Grow) 타임라인 카드화.
- 기간·설명 문구 추가로 기대감을 관리.

### 4.4 서비스 섹션
- 자체 앱 개발 / 외주 협업 개발 2개의 카드, 주요 포인트 리스트업.
- 기존 카피를 유지하되 주변 섹션과 어울리도록 디자인 톤 보정.

### 4.5 Spotlight CTA
- 그라데이션 배경의 메인 CTA 블록(프로젝트 미팅 / 소개서 다운로드).
- Hero CTA와 동일한 Cubit 액션을 사용하여 대화형 흐름을 유지.

### 4.6 푸터 & 연락처
- 기존 연락처(Email, KakaoTalk) 유지.
- Contact Dialog는 intent(프로젝트 문의/포트폴리오)에 따라 문구를 조정하도록 Cubit에서 제어.

## 5. 상태 관리 흐름 (LandingCubit)
1. `requestProjectInquiry` / `requestPortfolio` 호출 시 Dialog 노출 상태와 intent 업데이트.
2. Dialog 닫힘 후 `dismissContactDialog`로 상태 초기화.
3. 모든 CTA 버튼은 Cubit 메서드만 호출하도록 위젯 계층 단일화.

## 6. 반응형 고려 사항
- `_horizontalPadding` 헬퍼로 브레이크포인트 기반 여백 조정.
- Case Study/Process/Service 섹션은 Wrap + 카드 폭 계산을 통해 1~3열 전환.
- Spotlight CTA는 900px 기준으로 Row ↔ Column 구조 변경.

## 7. 테스트 및 품질 체크
- `flutter pub run build_runner build --delete-conflicting-outputs` 실행하여 Freezed 코드 생성.
- `flutter analyze`로 린트 확인 (현재 미해결 경고 없음).

## 8. 임시 데이터 및 추후 확정 필요 항목
- **Hero 메트릭/Trusted By 로고**: 실제 런칭 시 정확한 지표 및 레퍼런스 수정 필요.
- **Case Study 상세**: 회사명, 수치, 하이라이트는 대체 예정.
- **Process 기간**: 파트너 프로젝트 유형별로 조정 가능.
- **Spotlight CTA 문구**: 캠페인 목적에 맞춰 주기적으로 업데이트 권장.

## 9. 다음 단계 제안
1. **내비게이션 앵커링**: 상단 메뉴 클릭 시 각 섹션으로 스크롤 연결.
2. **리드 폼 연동**: Contact dialog → 실제 입력 폼 및 백엔드 연동.
3. **애니메이션 강화**: 스크롤 인/아웃 애니메이션 및 Hover 효과 추가.
4. **다국어 지원 논의**: 영문 카피 병행 여부 및 i18n 전략 결정.

## 10. 진행 현황 요약
- [x] Flutter 초기 구조 정리 및 BLoC 도입
- [x] Hero/Services/Case Studies/Process/CTA/푸터 UI 배치
- [x] 상태 기반 Contact Dialog 흐름 통합
- [ ] 실제 데이터 수급 및 카피 확정
- [ ] 리드 폼/추적 및 애니메이션 개선

---
마지막 업데이트: 이 문서는 `docs/progress.md`에서 관리되며, 기능 추가나 카피 확정 시 계속 보완할 예정입니다.
