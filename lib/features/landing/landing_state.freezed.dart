// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'landing_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$LandingState {
  List<String> get navItems => throw _privateConstructorUsedError;
  HeroSection get hero => throw _privateConstructorUsedError;
  List<ServiceItem> get services => throw _privateConstructorUsedError;
  FooterContent get footer => throw _privateConstructorUsedError;
  List<CaseStudy> get caseStudies => throw _privateConstructorUsedError;
  List<ProcessStep> get processSteps => throw _privateConstructorUsedError;
  PrimaryCta get spotlight => throw _privateConstructorUsedError;
  List<ProjectGalleryItem> get galleryProjects =>
      throw _privateConstructorUsedError;
  List<ReviewItem> get reviews => throw _privateConstructorUsedError;
  bool get isContactDialogVisible => throw _privateConstructorUsedError;
  ContactIntent? get contactIntent => throw _privateConstructorUsedError;
  LeadFormData get formData => throw _privateConstructorUsedError;
  FormSubmissionStatus get formStatus => throw _privateConstructorUsedError;
  String? get formErrorMessage => throw _privateConstructorUsedError;
  bool get isUrgencyBannerVisible => throw _privateConstructorUsedError;
  ProjectCategory get selectedProjectCategory =>
      throw _privateConstructorUsedError;

  /// Create a copy of LandingState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LandingStateCopyWith<LandingState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LandingStateCopyWith<$Res> {
  factory $LandingStateCopyWith(
    LandingState value,
    $Res Function(LandingState) then,
  ) = _$LandingStateCopyWithImpl<$Res, LandingState>;
  @useResult
  $Res call({
    List<String> navItems,
    HeroSection hero,
    List<ServiceItem> services,
    FooterContent footer,
    List<CaseStudy> caseStudies,
    List<ProcessStep> processSteps,
    PrimaryCta spotlight,
    List<ProjectGalleryItem> galleryProjects,
    List<ReviewItem> reviews,
    bool isContactDialogVisible,
    ContactIntent? contactIntent,
    LeadFormData formData,
    FormSubmissionStatus formStatus,
    String? formErrorMessage,
    bool isUrgencyBannerVisible,
    ProjectCategory selectedProjectCategory,
  });

  $HeroSectionCopyWith<$Res> get hero;
  $FooterContentCopyWith<$Res> get footer;
  $PrimaryCtaCopyWith<$Res> get spotlight;
  $LeadFormDataCopyWith<$Res> get formData;
}

/// @nodoc
class _$LandingStateCopyWithImpl<$Res, $Val extends LandingState>
    implements $LandingStateCopyWith<$Res> {
  _$LandingStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LandingState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? navItems = null,
    Object? hero = null,
    Object? services = null,
    Object? footer = null,
    Object? caseStudies = null,
    Object? processSteps = null,
    Object? spotlight = null,
    Object? galleryProjects = null,
    Object? reviews = null,
    Object? isContactDialogVisible = null,
    Object? contactIntent = freezed,
    Object? formData = null,
    Object? formStatus = null,
    Object? formErrorMessage = freezed,
    Object? isUrgencyBannerVisible = null,
    Object? selectedProjectCategory = null,
  }) {
    return _then(
      _value.copyWith(
            navItems:
                null == navItems
                    ? _value.navItems
                    : navItems // ignore: cast_nullable_to_non_nullable
                        as List<String>,
            hero:
                null == hero
                    ? _value.hero
                    : hero // ignore: cast_nullable_to_non_nullable
                        as HeroSection,
            services:
                null == services
                    ? _value.services
                    : services // ignore: cast_nullable_to_non_nullable
                        as List<ServiceItem>,
            footer:
                null == footer
                    ? _value.footer
                    : footer // ignore: cast_nullable_to_non_nullable
                        as FooterContent,
            caseStudies:
                null == caseStudies
                    ? _value.caseStudies
                    : caseStudies // ignore: cast_nullable_to_non_nullable
                        as List<CaseStudy>,
            processSteps:
                null == processSteps
                    ? _value.processSteps
                    : processSteps // ignore: cast_nullable_to_non_nullable
                        as List<ProcessStep>,
            spotlight:
                null == spotlight
                    ? _value.spotlight
                    : spotlight // ignore: cast_nullable_to_non_nullable
                        as PrimaryCta,
            galleryProjects:
                null == galleryProjects
                    ? _value.galleryProjects
                    : galleryProjects // ignore: cast_nullable_to_non_nullable
                        as List<ProjectGalleryItem>,
            reviews:
                null == reviews
                    ? _value.reviews
                    : reviews // ignore: cast_nullable_to_non_nullable
                        as List<ReviewItem>,
            isContactDialogVisible:
                null == isContactDialogVisible
                    ? _value.isContactDialogVisible
                    : isContactDialogVisible // ignore: cast_nullable_to_non_nullable
                        as bool,
            contactIntent:
                freezed == contactIntent
                    ? _value.contactIntent
                    : contactIntent // ignore: cast_nullable_to_non_nullable
                        as ContactIntent?,
            formData:
                null == formData
                    ? _value.formData
                    : formData // ignore: cast_nullable_to_non_nullable
                        as LeadFormData,
            formStatus:
                null == formStatus
                    ? _value.formStatus
                    : formStatus // ignore: cast_nullable_to_non_nullable
                        as FormSubmissionStatus,
            formErrorMessage:
                freezed == formErrorMessage
                    ? _value.formErrorMessage
                    : formErrorMessage // ignore: cast_nullable_to_non_nullable
                        as String?,
            isUrgencyBannerVisible:
                null == isUrgencyBannerVisible
                    ? _value.isUrgencyBannerVisible
                    : isUrgencyBannerVisible // ignore: cast_nullable_to_non_nullable
                        as bool,
            selectedProjectCategory:
                null == selectedProjectCategory
                    ? _value.selectedProjectCategory
                    : selectedProjectCategory // ignore: cast_nullable_to_non_nullable
                        as ProjectCategory,
          )
          as $Val,
    );
  }

  /// Create a copy of LandingState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $HeroSectionCopyWith<$Res> get hero {
    return $HeroSectionCopyWith<$Res>(_value.hero, (value) {
      return _then(_value.copyWith(hero: value) as $Val);
    });
  }

  /// Create a copy of LandingState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FooterContentCopyWith<$Res> get footer {
    return $FooterContentCopyWith<$Res>(_value.footer, (value) {
      return _then(_value.copyWith(footer: value) as $Val);
    });
  }

  /// Create a copy of LandingState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PrimaryCtaCopyWith<$Res> get spotlight {
    return $PrimaryCtaCopyWith<$Res>(_value.spotlight, (value) {
      return _then(_value.copyWith(spotlight: value) as $Val);
    });
  }

  /// Create a copy of LandingState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LeadFormDataCopyWith<$Res> get formData {
    return $LeadFormDataCopyWith<$Res>(_value.formData, (value) {
      return _then(_value.copyWith(formData: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$LandingStateImplCopyWith<$Res>
    implements $LandingStateCopyWith<$Res> {
  factory _$$LandingStateImplCopyWith(
    _$LandingStateImpl value,
    $Res Function(_$LandingStateImpl) then,
  ) = __$$LandingStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    List<String> navItems,
    HeroSection hero,
    List<ServiceItem> services,
    FooterContent footer,
    List<CaseStudy> caseStudies,
    List<ProcessStep> processSteps,
    PrimaryCta spotlight,
    List<ProjectGalleryItem> galleryProjects,
    List<ReviewItem> reviews,
    bool isContactDialogVisible,
    ContactIntent? contactIntent,
    LeadFormData formData,
    FormSubmissionStatus formStatus,
    String? formErrorMessage,
    bool isUrgencyBannerVisible,
    ProjectCategory selectedProjectCategory,
  });

  @override
  $HeroSectionCopyWith<$Res> get hero;
  @override
  $FooterContentCopyWith<$Res> get footer;
  @override
  $PrimaryCtaCopyWith<$Res> get spotlight;
  @override
  $LeadFormDataCopyWith<$Res> get formData;
}

/// @nodoc
class __$$LandingStateImplCopyWithImpl<$Res>
    extends _$LandingStateCopyWithImpl<$Res, _$LandingStateImpl>
    implements _$$LandingStateImplCopyWith<$Res> {
  __$$LandingStateImplCopyWithImpl(
    _$LandingStateImpl _value,
    $Res Function(_$LandingStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LandingState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? navItems = null,
    Object? hero = null,
    Object? services = null,
    Object? footer = null,
    Object? caseStudies = null,
    Object? processSteps = null,
    Object? spotlight = null,
    Object? galleryProjects = null,
    Object? reviews = null,
    Object? isContactDialogVisible = null,
    Object? contactIntent = freezed,
    Object? formData = null,
    Object? formStatus = null,
    Object? formErrorMessage = freezed,
    Object? isUrgencyBannerVisible = null,
    Object? selectedProjectCategory = null,
  }) {
    return _then(
      _$LandingStateImpl(
        navItems:
            null == navItems
                ? _value._navItems
                : navItems // ignore: cast_nullable_to_non_nullable
                    as List<String>,
        hero:
            null == hero
                ? _value.hero
                : hero // ignore: cast_nullable_to_non_nullable
                    as HeroSection,
        services:
            null == services
                ? _value._services
                : services // ignore: cast_nullable_to_non_nullable
                    as List<ServiceItem>,
        footer:
            null == footer
                ? _value.footer
                : footer // ignore: cast_nullable_to_non_nullable
                    as FooterContent,
        caseStudies:
            null == caseStudies
                ? _value._caseStudies
                : caseStudies // ignore: cast_nullable_to_non_nullable
                    as List<CaseStudy>,
        processSteps:
            null == processSteps
                ? _value._processSteps
                : processSteps // ignore: cast_nullable_to_non_nullable
                    as List<ProcessStep>,
        spotlight:
            null == spotlight
                ? _value.spotlight
                : spotlight // ignore: cast_nullable_to_non_nullable
                    as PrimaryCta,
        galleryProjects:
            null == galleryProjects
                ? _value._galleryProjects
                : galleryProjects // ignore: cast_nullable_to_non_nullable
                    as List<ProjectGalleryItem>,
        reviews:
            null == reviews
                ? _value._reviews
                : reviews // ignore: cast_nullable_to_non_nullable
                    as List<ReviewItem>,
        isContactDialogVisible:
            null == isContactDialogVisible
                ? _value.isContactDialogVisible
                : isContactDialogVisible // ignore: cast_nullable_to_non_nullable
                    as bool,
        contactIntent:
            freezed == contactIntent
                ? _value.contactIntent
                : contactIntent // ignore: cast_nullable_to_non_nullable
                    as ContactIntent?,
        formData:
            null == formData
                ? _value.formData
                : formData // ignore: cast_nullable_to_non_nullable
                    as LeadFormData,
        formStatus:
            null == formStatus
                ? _value.formStatus
                : formStatus // ignore: cast_nullable_to_non_nullable
                    as FormSubmissionStatus,
        formErrorMessage:
            freezed == formErrorMessage
                ? _value.formErrorMessage
                : formErrorMessage // ignore: cast_nullable_to_non_nullable
                    as String?,
        isUrgencyBannerVisible:
            null == isUrgencyBannerVisible
                ? _value.isUrgencyBannerVisible
                : isUrgencyBannerVisible // ignore: cast_nullable_to_non_nullable
                    as bool,
        selectedProjectCategory:
            null == selectedProjectCategory
                ? _value.selectedProjectCategory
                : selectedProjectCategory // ignore: cast_nullable_to_non_nullable
                    as ProjectCategory,
      ),
    );
  }
}

/// @nodoc

class _$LandingStateImpl implements _LandingState {
  const _$LandingStateImpl({
    required final List<String> navItems,
    required this.hero,
    required final List<ServiceItem> services,
    required this.footer,
    required final List<CaseStudy> caseStudies,
    required final List<ProcessStep> processSteps,
    required this.spotlight,
    required final List<ProjectGalleryItem> galleryProjects,
    required final List<ReviewItem> reviews,
    this.isContactDialogVisible = false,
    this.contactIntent,
    this.formData = const LeadFormData(),
    this.formStatus = FormSubmissionStatus.idle,
    this.formErrorMessage,
    this.isUrgencyBannerVisible = true,
    this.selectedProjectCategory = ProjectCategory.all,
  }) : _navItems = navItems,
       _services = services,
       _caseStudies = caseStudies,
       _processSteps = processSteps,
       _galleryProjects = galleryProjects,
       _reviews = reviews;

  final List<String> _navItems;
  @override
  List<String> get navItems {
    if (_navItems is EqualUnmodifiableListView) return _navItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_navItems);
  }

  @override
  final HeroSection hero;
  final List<ServiceItem> _services;
  @override
  List<ServiceItem> get services {
    if (_services is EqualUnmodifiableListView) return _services;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_services);
  }

  @override
  final FooterContent footer;
  final List<CaseStudy> _caseStudies;
  @override
  List<CaseStudy> get caseStudies {
    if (_caseStudies is EqualUnmodifiableListView) return _caseStudies;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_caseStudies);
  }

  final List<ProcessStep> _processSteps;
  @override
  List<ProcessStep> get processSteps {
    if (_processSteps is EqualUnmodifiableListView) return _processSteps;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_processSteps);
  }

  @override
  final PrimaryCta spotlight;
  final List<ProjectGalleryItem> _galleryProjects;
  @override
  List<ProjectGalleryItem> get galleryProjects {
    if (_galleryProjects is EqualUnmodifiableListView) return _galleryProjects;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_galleryProjects);
  }

  final List<ReviewItem> _reviews;
  @override
  List<ReviewItem> get reviews {
    if (_reviews is EqualUnmodifiableListView) return _reviews;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_reviews);
  }

  @override
  @JsonKey()
  final bool isContactDialogVisible;
  @override
  final ContactIntent? contactIntent;
  @override
  @JsonKey()
  final LeadFormData formData;
  @override
  @JsonKey()
  final FormSubmissionStatus formStatus;
  @override
  final String? formErrorMessage;
  @override
  @JsonKey()
  final bool isUrgencyBannerVisible;
  @override
  @JsonKey()
  final ProjectCategory selectedProjectCategory;

  @override
  String toString() {
    return 'LandingState(navItems: $navItems, hero: $hero, services: $services, footer: $footer, caseStudies: $caseStudies, processSteps: $processSteps, spotlight: $spotlight, galleryProjects: $galleryProjects, reviews: $reviews, isContactDialogVisible: $isContactDialogVisible, contactIntent: $contactIntent, formData: $formData, formStatus: $formStatus, formErrorMessage: $formErrorMessage, isUrgencyBannerVisible: $isUrgencyBannerVisible, selectedProjectCategory: $selectedProjectCategory)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LandingStateImpl &&
            const DeepCollectionEquality().equals(other._navItems, _navItems) &&
            (identical(other.hero, hero) || other.hero == hero) &&
            const DeepCollectionEquality().equals(other._services, _services) &&
            (identical(other.footer, footer) || other.footer == footer) &&
            const DeepCollectionEquality().equals(
              other._caseStudies,
              _caseStudies,
            ) &&
            const DeepCollectionEquality().equals(
              other._processSteps,
              _processSteps,
            ) &&
            (identical(other.spotlight, spotlight) ||
                other.spotlight == spotlight) &&
            const DeepCollectionEquality().equals(
              other._galleryProjects,
              _galleryProjects,
            ) &&
            const DeepCollectionEquality().equals(other._reviews, _reviews) &&
            (identical(other.isContactDialogVisible, isContactDialogVisible) ||
                other.isContactDialogVisible == isContactDialogVisible) &&
            (identical(other.contactIntent, contactIntent) ||
                other.contactIntent == contactIntent) &&
            (identical(other.formData, formData) ||
                other.formData == formData) &&
            (identical(other.formStatus, formStatus) ||
                other.formStatus == formStatus) &&
            (identical(other.formErrorMessage, formErrorMessage) ||
                other.formErrorMessage == formErrorMessage) &&
            (identical(other.isUrgencyBannerVisible, isUrgencyBannerVisible) ||
                other.isUrgencyBannerVisible == isUrgencyBannerVisible) &&
            (identical(
                  other.selectedProjectCategory,
                  selectedProjectCategory,
                ) ||
                other.selectedProjectCategory == selectedProjectCategory));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_navItems),
    hero,
    const DeepCollectionEquality().hash(_services),
    footer,
    const DeepCollectionEquality().hash(_caseStudies),
    const DeepCollectionEquality().hash(_processSteps),
    spotlight,
    const DeepCollectionEquality().hash(_galleryProjects),
    const DeepCollectionEquality().hash(_reviews),
    isContactDialogVisible,
    contactIntent,
    formData,
    formStatus,
    formErrorMessage,
    isUrgencyBannerVisible,
    selectedProjectCategory,
  );

  /// Create a copy of LandingState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LandingStateImplCopyWith<_$LandingStateImpl> get copyWith =>
      __$$LandingStateImplCopyWithImpl<_$LandingStateImpl>(this, _$identity);
}

abstract class _LandingState implements LandingState {
  const factory _LandingState({
    required final List<String> navItems,
    required final HeroSection hero,
    required final List<ServiceItem> services,
    required final FooterContent footer,
    required final List<CaseStudy> caseStudies,
    required final List<ProcessStep> processSteps,
    required final PrimaryCta spotlight,
    required final List<ProjectGalleryItem> galleryProjects,
    required final List<ReviewItem> reviews,
    final bool isContactDialogVisible,
    final ContactIntent? contactIntent,
    final LeadFormData formData,
    final FormSubmissionStatus formStatus,
    final String? formErrorMessage,
    final bool isUrgencyBannerVisible,
    final ProjectCategory selectedProjectCategory,
  }) = _$LandingStateImpl;

  @override
  List<String> get navItems;
  @override
  HeroSection get hero;
  @override
  List<ServiceItem> get services;
  @override
  FooterContent get footer;
  @override
  List<CaseStudy> get caseStudies;
  @override
  List<ProcessStep> get processSteps;
  @override
  PrimaryCta get spotlight;
  @override
  List<ProjectGalleryItem> get galleryProjects;
  @override
  List<ReviewItem> get reviews;
  @override
  bool get isContactDialogVisible;
  @override
  ContactIntent? get contactIntent;
  @override
  LeadFormData get formData;
  @override
  FormSubmissionStatus get formStatus;
  @override
  String? get formErrorMessage;
  @override
  bool get isUrgencyBannerVisible;
  @override
  ProjectCategory get selectedProjectCategory;

  /// Create a copy of LandingState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LandingStateImplCopyWith<_$LandingStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$HeroSection {
  String get badge => throw _privateConstructorUsedError;
  String get headline => throw _privateConstructorUsedError;
  String get subHeadline => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  List<MetricInfo> get metrics => throw _privateConstructorUsedError;
  List<ShowcaseItem> get showcaseItems => throw _privateConstructorUsedError;
  List<String> get trustedBy => throw _privateConstructorUsedError;

  /// Create a copy of HeroSection
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HeroSectionCopyWith<HeroSection> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HeroSectionCopyWith<$Res> {
  factory $HeroSectionCopyWith(
    HeroSection value,
    $Res Function(HeroSection) then,
  ) = _$HeroSectionCopyWithImpl<$Res, HeroSection>;
  @useResult
  $Res call({
    String badge,
    String headline,
    String subHeadline,
    String description,
    List<MetricInfo> metrics,
    List<ShowcaseItem> showcaseItems,
    List<String> trustedBy,
  });
}

/// @nodoc
class _$HeroSectionCopyWithImpl<$Res, $Val extends HeroSection>
    implements $HeroSectionCopyWith<$Res> {
  _$HeroSectionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HeroSection
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? badge = null,
    Object? headline = null,
    Object? subHeadline = null,
    Object? description = null,
    Object? metrics = null,
    Object? showcaseItems = null,
    Object? trustedBy = null,
  }) {
    return _then(
      _value.copyWith(
            badge:
                null == badge
                    ? _value.badge
                    : badge // ignore: cast_nullable_to_non_nullable
                        as String,
            headline:
                null == headline
                    ? _value.headline
                    : headline // ignore: cast_nullable_to_non_nullable
                        as String,
            subHeadline:
                null == subHeadline
                    ? _value.subHeadline
                    : subHeadline // ignore: cast_nullable_to_non_nullable
                        as String,
            description:
                null == description
                    ? _value.description
                    : description // ignore: cast_nullable_to_non_nullable
                        as String,
            metrics:
                null == metrics
                    ? _value.metrics
                    : metrics // ignore: cast_nullable_to_non_nullable
                        as List<MetricInfo>,
            showcaseItems:
                null == showcaseItems
                    ? _value.showcaseItems
                    : showcaseItems // ignore: cast_nullable_to_non_nullable
                        as List<ShowcaseItem>,
            trustedBy:
                null == trustedBy
                    ? _value.trustedBy
                    : trustedBy // ignore: cast_nullable_to_non_nullable
                        as List<String>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$HeroSectionImplCopyWith<$Res>
    implements $HeroSectionCopyWith<$Res> {
  factory _$$HeroSectionImplCopyWith(
    _$HeroSectionImpl value,
    $Res Function(_$HeroSectionImpl) then,
  ) = __$$HeroSectionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String badge,
    String headline,
    String subHeadline,
    String description,
    List<MetricInfo> metrics,
    List<ShowcaseItem> showcaseItems,
    List<String> trustedBy,
  });
}

/// @nodoc
class __$$HeroSectionImplCopyWithImpl<$Res>
    extends _$HeroSectionCopyWithImpl<$Res, _$HeroSectionImpl>
    implements _$$HeroSectionImplCopyWith<$Res> {
  __$$HeroSectionImplCopyWithImpl(
    _$HeroSectionImpl _value,
    $Res Function(_$HeroSectionImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of HeroSection
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? badge = null,
    Object? headline = null,
    Object? subHeadline = null,
    Object? description = null,
    Object? metrics = null,
    Object? showcaseItems = null,
    Object? trustedBy = null,
  }) {
    return _then(
      _$HeroSectionImpl(
        badge:
            null == badge
                ? _value.badge
                : badge // ignore: cast_nullable_to_non_nullable
                    as String,
        headline:
            null == headline
                ? _value.headline
                : headline // ignore: cast_nullable_to_non_nullable
                    as String,
        subHeadline:
            null == subHeadline
                ? _value.subHeadline
                : subHeadline // ignore: cast_nullable_to_non_nullable
                    as String,
        description:
            null == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                    as String,
        metrics:
            null == metrics
                ? _value._metrics
                : metrics // ignore: cast_nullable_to_non_nullable
                    as List<MetricInfo>,
        showcaseItems:
            null == showcaseItems
                ? _value._showcaseItems
                : showcaseItems // ignore: cast_nullable_to_non_nullable
                    as List<ShowcaseItem>,
        trustedBy:
            null == trustedBy
                ? _value._trustedBy
                : trustedBy // ignore: cast_nullable_to_non_nullable
                    as List<String>,
      ),
    );
  }
}

/// @nodoc

class _$HeroSectionImpl implements _HeroSection {
  const _$HeroSectionImpl({
    required this.badge,
    required this.headline,
    required this.subHeadline,
    required this.description,
    required final List<MetricInfo> metrics,
    required final List<ShowcaseItem> showcaseItems,
    required final List<String> trustedBy,
  }) : _metrics = metrics,
       _showcaseItems = showcaseItems,
       _trustedBy = trustedBy;

  @override
  final String badge;
  @override
  final String headline;
  @override
  final String subHeadline;
  @override
  final String description;
  final List<MetricInfo> _metrics;
  @override
  List<MetricInfo> get metrics {
    if (_metrics is EqualUnmodifiableListView) return _metrics;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_metrics);
  }

  final List<ShowcaseItem> _showcaseItems;
  @override
  List<ShowcaseItem> get showcaseItems {
    if (_showcaseItems is EqualUnmodifiableListView) return _showcaseItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_showcaseItems);
  }

  final List<String> _trustedBy;
  @override
  List<String> get trustedBy {
    if (_trustedBy is EqualUnmodifiableListView) return _trustedBy;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_trustedBy);
  }

  @override
  String toString() {
    return 'HeroSection(badge: $badge, headline: $headline, subHeadline: $subHeadline, description: $description, metrics: $metrics, showcaseItems: $showcaseItems, trustedBy: $trustedBy)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HeroSectionImpl &&
            (identical(other.badge, badge) || other.badge == badge) &&
            (identical(other.headline, headline) ||
                other.headline == headline) &&
            (identical(other.subHeadline, subHeadline) ||
                other.subHeadline == subHeadline) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(other._metrics, _metrics) &&
            const DeepCollectionEquality().equals(
              other._showcaseItems,
              _showcaseItems,
            ) &&
            const DeepCollectionEquality().equals(
              other._trustedBy,
              _trustedBy,
            ));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    badge,
    headline,
    subHeadline,
    description,
    const DeepCollectionEquality().hash(_metrics),
    const DeepCollectionEquality().hash(_showcaseItems),
    const DeepCollectionEquality().hash(_trustedBy),
  );

  /// Create a copy of HeroSection
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HeroSectionImplCopyWith<_$HeroSectionImpl> get copyWith =>
      __$$HeroSectionImplCopyWithImpl<_$HeroSectionImpl>(this, _$identity);
}

abstract class _HeroSection implements HeroSection {
  const factory _HeroSection({
    required final String badge,
    required final String headline,
    required final String subHeadline,
    required final String description,
    required final List<MetricInfo> metrics,
    required final List<ShowcaseItem> showcaseItems,
    required final List<String> trustedBy,
  }) = _$HeroSectionImpl;

  @override
  String get badge;
  @override
  String get headline;
  @override
  String get subHeadline;
  @override
  String get description;
  @override
  List<MetricInfo> get metrics;
  @override
  List<ShowcaseItem> get showcaseItems;
  @override
  List<String> get trustedBy;

  /// Create a copy of HeroSection
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HeroSectionImplCopyWith<_$HeroSectionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$MetricInfo {
  String get value => throw _privateConstructorUsedError;
  String get label => throw _privateConstructorUsedError;

  /// Create a copy of MetricInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MetricInfoCopyWith<MetricInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MetricInfoCopyWith<$Res> {
  factory $MetricInfoCopyWith(
    MetricInfo value,
    $Res Function(MetricInfo) then,
  ) = _$MetricInfoCopyWithImpl<$Res, MetricInfo>;
  @useResult
  $Res call({String value, String label});
}

/// @nodoc
class _$MetricInfoCopyWithImpl<$Res, $Val extends MetricInfo>
    implements $MetricInfoCopyWith<$Res> {
  _$MetricInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MetricInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? value = null, Object? label = null}) {
    return _then(
      _value.copyWith(
            value:
                null == value
                    ? _value.value
                    : value // ignore: cast_nullable_to_non_nullable
                        as String,
            label:
                null == label
                    ? _value.label
                    : label // ignore: cast_nullable_to_non_nullable
                        as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$MetricInfoImplCopyWith<$Res>
    implements $MetricInfoCopyWith<$Res> {
  factory _$$MetricInfoImplCopyWith(
    _$MetricInfoImpl value,
    $Res Function(_$MetricInfoImpl) then,
  ) = __$$MetricInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String value, String label});
}

/// @nodoc
class __$$MetricInfoImplCopyWithImpl<$Res>
    extends _$MetricInfoCopyWithImpl<$Res, _$MetricInfoImpl>
    implements _$$MetricInfoImplCopyWith<$Res> {
  __$$MetricInfoImplCopyWithImpl(
    _$MetricInfoImpl _value,
    $Res Function(_$MetricInfoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MetricInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? value = null, Object? label = null}) {
    return _then(
      _$MetricInfoImpl(
        value:
            null == value
                ? _value.value
                : value // ignore: cast_nullable_to_non_nullable
                    as String,
        label:
            null == label
                ? _value.label
                : label // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc

class _$MetricInfoImpl implements _MetricInfo {
  const _$MetricInfoImpl({required this.value, required this.label});

  @override
  final String value;
  @override
  final String label;

  @override
  String toString() {
    return 'MetricInfo(value: $value, label: $label)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MetricInfoImpl &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.label, label) || other.label == label));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value, label);

  /// Create a copy of MetricInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MetricInfoImplCopyWith<_$MetricInfoImpl> get copyWith =>
      __$$MetricInfoImplCopyWithImpl<_$MetricInfoImpl>(this, _$identity);
}

abstract class _MetricInfo implements MetricInfo {
  const factory _MetricInfo({
    required final String value,
    required final String label,
  }) = _$MetricInfoImpl;

  @override
  String get value;
  @override
  String get label;

  /// Create a copy of MetricInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MetricInfoImplCopyWith<_$MetricInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ShowcaseItem {
  String get title => throw _privateConstructorUsedError;
  String get subtitle => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;

  /// Create a copy of ShowcaseItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ShowcaseItemCopyWith<ShowcaseItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShowcaseItemCopyWith<$Res> {
  factory $ShowcaseItemCopyWith(
    ShowcaseItem value,
    $Res Function(ShowcaseItem) then,
  ) = _$ShowcaseItemCopyWithImpl<$Res, ShowcaseItem>;
  @useResult
  $Res call({String title, String subtitle, String description});
}

/// @nodoc
class _$ShowcaseItemCopyWithImpl<$Res, $Val extends ShowcaseItem>
    implements $ShowcaseItemCopyWith<$Res> {
  _$ShowcaseItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ShowcaseItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? subtitle = null,
    Object? description = null,
  }) {
    return _then(
      _value.copyWith(
            title:
                null == title
                    ? _value.title
                    : title // ignore: cast_nullable_to_non_nullable
                        as String,
            subtitle:
                null == subtitle
                    ? _value.subtitle
                    : subtitle // ignore: cast_nullable_to_non_nullable
                        as String,
            description:
                null == description
                    ? _value.description
                    : description // ignore: cast_nullable_to_non_nullable
                        as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ShowcaseItemImplCopyWith<$Res>
    implements $ShowcaseItemCopyWith<$Res> {
  factory _$$ShowcaseItemImplCopyWith(
    _$ShowcaseItemImpl value,
    $Res Function(_$ShowcaseItemImpl) then,
  ) = __$$ShowcaseItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title, String subtitle, String description});
}

/// @nodoc
class __$$ShowcaseItemImplCopyWithImpl<$Res>
    extends _$ShowcaseItemCopyWithImpl<$Res, _$ShowcaseItemImpl>
    implements _$$ShowcaseItemImplCopyWith<$Res> {
  __$$ShowcaseItemImplCopyWithImpl(
    _$ShowcaseItemImpl _value,
    $Res Function(_$ShowcaseItemImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ShowcaseItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? subtitle = null,
    Object? description = null,
  }) {
    return _then(
      _$ShowcaseItemImpl(
        title:
            null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                    as String,
        subtitle:
            null == subtitle
                ? _value.subtitle
                : subtitle // ignore: cast_nullable_to_non_nullable
                    as String,
        description:
            null == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc

class _$ShowcaseItemImpl implements _ShowcaseItem {
  const _$ShowcaseItemImpl({
    required this.title,
    required this.subtitle,
    required this.description,
  });

  @override
  final String title;
  @override
  final String subtitle;
  @override
  final String description;

  @override
  String toString() {
    return 'ShowcaseItem(title: $title, subtitle: $subtitle, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShowcaseItemImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.subtitle, subtitle) ||
                other.subtitle == subtitle) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @override
  int get hashCode => Object.hash(runtimeType, title, subtitle, description);

  /// Create a copy of ShowcaseItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ShowcaseItemImplCopyWith<_$ShowcaseItemImpl> get copyWith =>
      __$$ShowcaseItemImplCopyWithImpl<_$ShowcaseItemImpl>(this, _$identity);
}

abstract class _ShowcaseItem implements ShowcaseItem {
  const factory _ShowcaseItem({
    required final String title,
    required final String subtitle,
    required final String description,
  }) = _$ShowcaseItemImpl;

  @override
  String get title;
  @override
  String get subtitle;
  @override
  String get description;

  /// Create a copy of ShowcaseItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ShowcaseItemImplCopyWith<_$ShowcaseItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ServiceItem {
  IconData get icon => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get subtitle => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  List<String> get points => throw _privateConstructorUsedError;

  /// Create a copy of ServiceItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ServiceItemCopyWith<ServiceItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServiceItemCopyWith<$Res> {
  factory $ServiceItemCopyWith(
    ServiceItem value,
    $Res Function(ServiceItem) then,
  ) = _$ServiceItemCopyWithImpl<$Res, ServiceItem>;
  @useResult
  $Res call({
    IconData icon,
    String title,
    String subtitle,
    String description,
    List<String> points,
  });
}

/// @nodoc
class _$ServiceItemCopyWithImpl<$Res, $Val extends ServiceItem>
    implements $ServiceItemCopyWith<$Res> {
  _$ServiceItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ServiceItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? icon = null,
    Object? title = null,
    Object? subtitle = null,
    Object? description = null,
    Object? points = null,
  }) {
    return _then(
      _value.copyWith(
            icon:
                null == icon
                    ? _value.icon
                    : icon // ignore: cast_nullable_to_non_nullable
                        as IconData,
            title:
                null == title
                    ? _value.title
                    : title // ignore: cast_nullable_to_non_nullable
                        as String,
            subtitle:
                null == subtitle
                    ? _value.subtitle
                    : subtitle // ignore: cast_nullable_to_non_nullable
                        as String,
            description:
                null == description
                    ? _value.description
                    : description // ignore: cast_nullable_to_non_nullable
                        as String,
            points:
                null == points
                    ? _value.points
                    : points // ignore: cast_nullable_to_non_nullable
                        as List<String>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ServiceItemImplCopyWith<$Res>
    implements $ServiceItemCopyWith<$Res> {
  factory _$$ServiceItemImplCopyWith(
    _$ServiceItemImpl value,
    $Res Function(_$ServiceItemImpl) then,
  ) = __$$ServiceItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    IconData icon,
    String title,
    String subtitle,
    String description,
    List<String> points,
  });
}

/// @nodoc
class __$$ServiceItemImplCopyWithImpl<$Res>
    extends _$ServiceItemCopyWithImpl<$Res, _$ServiceItemImpl>
    implements _$$ServiceItemImplCopyWith<$Res> {
  __$$ServiceItemImplCopyWithImpl(
    _$ServiceItemImpl _value,
    $Res Function(_$ServiceItemImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ServiceItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? icon = null,
    Object? title = null,
    Object? subtitle = null,
    Object? description = null,
    Object? points = null,
  }) {
    return _then(
      _$ServiceItemImpl(
        icon:
            null == icon
                ? _value.icon
                : icon // ignore: cast_nullable_to_non_nullable
                    as IconData,
        title:
            null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                    as String,
        subtitle:
            null == subtitle
                ? _value.subtitle
                : subtitle // ignore: cast_nullable_to_non_nullable
                    as String,
        description:
            null == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                    as String,
        points:
            null == points
                ? _value._points
                : points // ignore: cast_nullable_to_non_nullable
                    as List<String>,
      ),
    );
  }
}

/// @nodoc

class _$ServiceItemImpl implements _ServiceItem {
  const _$ServiceItemImpl({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.description,
    required final List<String> points,
  }) : _points = points;

  @override
  final IconData icon;
  @override
  final String title;
  @override
  final String subtitle;
  @override
  final String description;
  final List<String> _points;
  @override
  List<String> get points {
    if (_points is EqualUnmodifiableListView) return _points;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_points);
  }

  @override
  String toString() {
    return 'ServiceItem(icon: $icon, title: $title, subtitle: $subtitle, description: $description, points: $points)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServiceItemImpl &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.subtitle, subtitle) ||
                other.subtitle == subtitle) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(other._points, _points));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    icon,
    title,
    subtitle,
    description,
    const DeepCollectionEquality().hash(_points),
  );

  /// Create a copy of ServiceItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ServiceItemImplCopyWith<_$ServiceItemImpl> get copyWith =>
      __$$ServiceItemImplCopyWithImpl<_$ServiceItemImpl>(this, _$identity);
}

abstract class _ServiceItem implements ServiceItem {
  const factory _ServiceItem({
    required final IconData icon,
    required final String title,
    required final String subtitle,
    required final String description,
    required final List<String> points,
  }) = _$ServiceItemImpl;

  @override
  IconData get icon;
  @override
  String get title;
  @override
  String get subtitle;
  @override
  String get description;
  @override
  List<String> get points;

  /// Create a copy of ServiceItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ServiceItemImplCopyWith<_$ServiceItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CaseStudy {
  String get company => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get result => throw _privateConstructorUsedError;
  List<String> get highlights => throw _privateConstructorUsedError;
  DetailedMetrics? get detailedMetrics => throw _privateConstructorUsedError;

  /// Create a copy of CaseStudy
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CaseStudyCopyWith<CaseStudy> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CaseStudyCopyWith<$Res> {
  factory $CaseStudyCopyWith(CaseStudy value, $Res Function(CaseStudy) then) =
      _$CaseStudyCopyWithImpl<$Res, CaseStudy>;
  @useResult
  $Res call({
    String company,
    String title,
    String description,
    String result,
    List<String> highlights,
    DetailedMetrics? detailedMetrics,
  });

  $DetailedMetricsCopyWith<$Res>? get detailedMetrics;
}

/// @nodoc
class _$CaseStudyCopyWithImpl<$Res, $Val extends CaseStudy>
    implements $CaseStudyCopyWith<$Res> {
  _$CaseStudyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CaseStudy
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? company = null,
    Object? title = null,
    Object? description = null,
    Object? result = null,
    Object? highlights = null,
    Object? detailedMetrics = freezed,
  }) {
    return _then(
      _value.copyWith(
            company:
                null == company
                    ? _value.company
                    : company // ignore: cast_nullable_to_non_nullable
                        as String,
            title:
                null == title
                    ? _value.title
                    : title // ignore: cast_nullable_to_non_nullable
                        as String,
            description:
                null == description
                    ? _value.description
                    : description // ignore: cast_nullable_to_non_nullable
                        as String,
            result:
                null == result
                    ? _value.result
                    : result // ignore: cast_nullable_to_non_nullable
                        as String,
            highlights:
                null == highlights
                    ? _value.highlights
                    : highlights // ignore: cast_nullable_to_non_nullable
                        as List<String>,
            detailedMetrics:
                freezed == detailedMetrics
                    ? _value.detailedMetrics
                    : detailedMetrics // ignore: cast_nullable_to_non_nullable
                        as DetailedMetrics?,
          )
          as $Val,
    );
  }

  /// Create a copy of CaseStudy
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DetailedMetricsCopyWith<$Res>? get detailedMetrics {
    if (_value.detailedMetrics == null) {
      return null;
    }

    return $DetailedMetricsCopyWith<$Res>(_value.detailedMetrics!, (value) {
      return _then(_value.copyWith(detailedMetrics: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CaseStudyImplCopyWith<$Res>
    implements $CaseStudyCopyWith<$Res> {
  factory _$$CaseStudyImplCopyWith(
    _$CaseStudyImpl value,
    $Res Function(_$CaseStudyImpl) then,
  ) = __$$CaseStudyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String company,
    String title,
    String description,
    String result,
    List<String> highlights,
    DetailedMetrics? detailedMetrics,
  });

  @override
  $DetailedMetricsCopyWith<$Res>? get detailedMetrics;
}

/// @nodoc
class __$$CaseStudyImplCopyWithImpl<$Res>
    extends _$CaseStudyCopyWithImpl<$Res, _$CaseStudyImpl>
    implements _$$CaseStudyImplCopyWith<$Res> {
  __$$CaseStudyImplCopyWithImpl(
    _$CaseStudyImpl _value,
    $Res Function(_$CaseStudyImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CaseStudy
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? company = null,
    Object? title = null,
    Object? description = null,
    Object? result = null,
    Object? highlights = null,
    Object? detailedMetrics = freezed,
  }) {
    return _then(
      _$CaseStudyImpl(
        company:
            null == company
                ? _value.company
                : company // ignore: cast_nullable_to_non_nullable
                    as String,
        title:
            null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                    as String,
        description:
            null == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                    as String,
        result:
            null == result
                ? _value.result
                : result // ignore: cast_nullable_to_non_nullable
                    as String,
        highlights:
            null == highlights
                ? _value._highlights
                : highlights // ignore: cast_nullable_to_non_nullable
                    as List<String>,
        detailedMetrics:
            freezed == detailedMetrics
                ? _value.detailedMetrics
                : detailedMetrics // ignore: cast_nullable_to_non_nullable
                    as DetailedMetrics?,
      ),
    );
  }
}

/// @nodoc

class _$CaseStudyImpl implements _CaseStudy {
  const _$CaseStudyImpl({
    required this.company,
    required this.title,
    required this.description,
    required this.result,
    required final List<String> highlights,
    this.detailedMetrics,
  }) : _highlights = highlights;

  @override
  final String company;
  @override
  final String title;
  @override
  final String description;
  @override
  final String result;
  final List<String> _highlights;
  @override
  List<String> get highlights {
    if (_highlights is EqualUnmodifiableListView) return _highlights;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_highlights);
  }

  @override
  final DetailedMetrics? detailedMetrics;

  @override
  String toString() {
    return 'CaseStudy(company: $company, title: $title, description: $description, result: $result, highlights: $highlights, detailedMetrics: $detailedMetrics)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CaseStudyImpl &&
            (identical(other.company, company) || other.company == company) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.result, result) || other.result == result) &&
            const DeepCollectionEquality().equals(
              other._highlights,
              _highlights,
            ) &&
            (identical(other.detailedMetrics, detailedMetrics) ||
                other.detailedMetrics == detailedMetrics));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    company,
    title,
    description,
    result,
    const DeepCollectionEquality().hash(_highlights),
    detailedMetrics,
  );

  /// Create a copy of CaseStudy
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CaseStudyImplCopyWith<_$CaseStudyImpl> get copyWith =>
      __$$CaseStudyImplCopyWithImpl<_$CaseStudyImpl>(this, _$identity);
}

abstract class _CaseStudy implements CaseStudy {
  const factory _CaseStudy({
    required final String company,
    required final String title,
    required final String description,
    required final String result,
    required final List<String> highlights,
    final DetailedMetrics? detailedMetrics,
  }) = _$CaseStudyImpl;

  @override
  String get company;
  @override
  String get title;
  @override
  String get description;
  @override
  String get result;
  @override
  List<String> get highlights;
  @override
  DetailedMetrics? get detailedMetrics;

  /// Create a copy of CaseStudy
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CaseStudyImplCopyWith<_$CaseStudyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DetailedMetrics {
  String get downloads => throw _privateConstructorUsedError;
  String get retention => throw _privateConstructorUsedError;
  String get revenue => throw _privateConstructorUsedError;
  String get conversionRate => throw _privateConstructorUsedError;

  /// Create a copy of DetailedMetrics
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DetailedMetricsCopyWith<DetailedMetrics> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DetailedMetricsCopyWith<$Res> {
  factory $DetailedMetricsCopyWith(
    DetailedMetrics value,
    $Res Function(DetailedMetrics) then,
  ) = _$DetailedMetricsCopyWithImpl<$Res, DetailedMetrics>;
  @useResult
  $Res call({
    String downloads,
    String retention,
    String revenue,
    String conversionRate,
  });
}

/// @nodoc
class _$DetailedMetricsCopyWithImpl<$Res, $Val extends DetailedMetrics>
    implements $DetailedMetricsCopyWith<$Res> {
  _$DetailedMetricsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DetailedMetrics
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? downloads = null,
    Object? retention = null,
    Object? revenue = null,
    Object? conversionRate = null,
  }) {
    return _then(
      _value.copyWith(
            downloads:
                null == downloads
                    ? _value.downloads
                    : downloads // ignore: cast_nullable_to_non_nullable
                        as String,
            retention:
                null == retention
                    ? _value.retention
                    : retention // ignore: cast_nullable_to_non_nullable
                        as String,
            revenue:
                null == revenue
                    ? _value.revenue
                    : revenue // ignore: cast_nullable_to_non_nullable
                        as String,
            conversionRate:
                null == conversionRate
                    ? _value.conversionRate
                    : conversionRate // ignore: cast_nullable_to_non_nullable
                        as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DetailedMetricsImplCopyWith<$Res>
    implements $DetailedMetricsCopyWith<$Res> {
  factory _$$DetailedMetricsImplCopyWith(
    _$DetailedMetricsImpl value,
    $Res Function(_$DetailedMetricsImpl) then,
  ) = __$$DetailedMetricsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String downloads,
    String retention,
    String revenue,
    String conversionRate,
  });
}

/// @nodoc
class __$$DetailedMetricsImplCopyWithImpl<$Res>
    extends _$DetailedMetricsCopyWithImpl<$Res, _$DetailedMetricsImpl>
    implements _$$DetailedMetricsImplCopyWith<$Res> {
  __$$DetailedMetricsImplCopyWithImpl(
    _$DetailedMetricsImpl _value,
    $Res Function(_$DetailedMetricsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DetailedMetrics
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? downloads = null,
    Object? retention = null,
    Object? revenue = null,
    Object? conversionRate = null,
  }) {
    return _then(
      _$DetailedMetricsImpl(
        downloads:
            null == downloads
                ? _value.downloads
                : downloads // ignore: cast_nullable_to_non_nullable
                    as String,
        retention:
            null == retention
                ? _value.retention
                : retention // ignore: cast_nullable_to_non_nullable
                    as String,
        revenue:
            null == revenue
                ? _value.revenue
                : revenue // ignore: cast_nullable_to_non_nullable
                    as String,
        conversionRate:
            null == conversionRate
                ? _value.conversionRate
                : conversionRate // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc

class _$DetailedMetricsImpl implements _DetailedMetrics {
  const _$DetailedMetricsImpl({
    required this.downloads,
    required this.retention,
    required this.revenue,
    required this.conversionRate,
  });

  @override
  final String downloads;
  @override
  final String retention;
  @override
  final String revenue;
  @override
  final String conversionRate;

  @override
  String toString() {
    return 'DetailedMetrics(downloads: $downloads, retention: $retention, revenue: $revenue, conversionRate: $conversionRate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DetailedMetricsImpl &&
            (identical(other.downloads, downloads) ||
                other.downloads == downloads) &&
            (identical(other.retention, retention) ||
                other.retention == retention) &&
            (identical(other.revenue, revenue) || other.revenue == revenue) &&
            (identical(other.conversionRate, conversionRate) ||
                other.conversionRate == conversionRate));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, downloads, retention, revenue, conversionRate);

  /// Create a copy of DetailedMetrics
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DetailedMetricsImplCopyWith<_$DetailedMetricsImpl> get copyWith =>
      __$$DetailedMetricsImplCopyWithImpl<_$DetailedMetricsImpl>(
        this,
        _$identity,
      );
}

abstract class _DetailedMetrics implements DetailedMetrics {
  const factory _DetailedMetrics({
    required final String downloads,
    required final String retention,
    required final String revenue,
    required final String conversionRate,
  }) = _$DetailedMetricsImpl;

  @override
  String get downloads;
  @override
  String get retention;
  @override
  String get revenue;
  @override
  String get conversionRate;

  /// Create a copy of DetailedMetrics
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DetailedMetricsImplCopyWith<_$DetailedMetricsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ProcessStep {
  int get order => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get duration => throw _privateConstructorUsedError;

  /// Create a copy of ProcessStep
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProcessStepCopyWith<ProcessStep> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProcessStepCopyWith<$Res> {
  factory $ProcessStepCopyWith(
    ProcessStep value,
    $Res Function(ProcessStep) then,
  ) = _$ProcessStepCopyWithImpl<$Res, ProcessStep>;
  @useResult
  $Res call({int order, String title, String description, String duration});
}

/// @nodoc
class _$ProcessStepCopyWithImpl<$Res, $Val extends ProcessStep>
    implements $ProcessStepCopyWith<$Res> {
  _$ProcessStepCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProcessStep
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? order = null,
    Object? title = null,
    Object? description = null,
    Object? duration = null,
  }) {
    return _then(
      _value.copyWith(
            order:
                null == order
                    ? _value.order
                    : order // ignore: cast_nullable_to_non_nullable
                        as int,
            title:
                null == title
                    ? _value.title
                    : title // ignore: cast_nullable_to_non_nullable
                        as String,
            description:
                null == description
                    ? _value.description
                    : description // ignore: cast_nullable_to_non_nullable
                        as String,
            duration:
                null == duration
                    ? _value.duration
                    : duration // ignore: cast_nullable_to_non_nullable
                        as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ProcessStepImplCopyWith<$Res>
    implements $ProcessStepCopyWith<$Res> {
  factory _$$ProcessStepImplCopyWith(
    _$ProcessStepImpl value,
    $Res Function(_$ProcessStepImpl) then,
  ) = __$$ProcessStepImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int order, String title, String description, String duration});
}

/// @nodoc
class __$$ProcessStepImplCopyWithImpl<$Res>
    extends _$ProcessStepCopyWithImpl<$Res, _$ProcessStepImpl>
    implements _$$ProcessStepImplCopyWith<$Res> {
  __$$ProcessStepImplCopyWithImpl(
    _$ProcessStepImpl _value,
    $Res Function(_$ProcessStepImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ProcessStep
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? order = null,
    Object? title = null,
    Object? description = null,
    Object? duration = null,
  }) {
    return _then(
      _$ProcessStepImpl(
        order:
            null == order
                ? _value.order
                : order // ignore: cast_nullable_to_non_nullable
                    as int,
        title:
            null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                    as String,
        description:
            null == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                    as String,
        duration:
            null == duration
                ? _value.duration
                : duration // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc

class _$ProcessStepImpl implements _ProcessStep {
  const _$ProcessStepImpl({
    required this.order,
    required this.title,
    required this.description,
    required this.duration,
  });

  @override
  final int order;
  @override
  final String title;
  @override
  final String description;
  @override
  final String duration;

  @override
  String toString() {
    return 'ProcessStep(order: $order, title: $title, description: $description, duration: $duration)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProcessStepImpl &&
            (identical(other.order, order) || other.order == order) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.duration, duration) ||
                other.duration == duration));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, order, title, description, duration);

  /// Create a copy of ProcessStep
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProcessStepImplCopyWith<_$ProcessStepImpl> get copyWith =>
      __$$ProcessStepImplCopyWithImpl<_$ProcessStepImpl>(this, _$identity);
}

abstract class _ProcessStep implements ProcessStep {
  const factory _ProcessStep({
    required final int order,
    required final String title,
    required final String description,
    required final String duration,
  }) = _$ProcessStepImpl;

  @override
  int get order;
  @override
  String get title;
  @override
  String get description;
  @override
  String get duration;

  /// Create a copy of ProcessStep
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProcessStepImplCopyWith<_$ProcessStepImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$PrimaryCta {
  String get eyebrow => throw _privateConstructorUsedError;
  String get headline => throw _privateConstructorUsedError;
  String get body => throw _privateConstructorUsedError;
  String get primaryLabel => throw _privateConstructorUsedError;
  String get secondaryLabel => throw _privateConstructorUsedError;

  /// Create a copy of PrimaryCta
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PrimaryCtaCopyWith<PrimaryCta> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PrimaryCtaCopyWith<$Res> {
  factory $PrimaryCtaCopyWith(
    PrimaryCta value,
    $Res Function(PrimaryCta) then,
  ) = _$PrimaryCtaCopyWithImpl<$Res, PrimaryCta>;
  @useResult
  $Res call({
    String eyebrow,
    String headline,
    String body,
    String primaryLabel,
    String secondaryLabel,
  });
}

/// @nodoc
class _$PrimaryCtaCopyWithImpl<$Res, $Val extends PrimaryCta>
    implements $PrimaryCtaCopyWith<$Res> {
  _$PrimaryCtaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PrimaryCta
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eyebrow = null,
    Object? headline = null,
    Object? body = null,
    Object? primaryLabel = null,
    Object? secondaryLabel = null,
  }) {
    return _then(
      _value.copyWith(
            eyebrow:
                null == eyebrow
                    ? _value.eyebrow
                    : eyebrow // ignore: cast_nullable_to_non_nullable
                        as String,
            headline:
                null == headline
                    ? _value.headline
                    : headline // ignore: cast_nullable_to_non_nullable
                        as String,
            body:
                null == body
                    ? _value.body
                    : body // ignore: cast_nullable_to_non_nullable
                        as String,
            primaryLabel:
                null == primaryLabel
                    ? _value.primaryLabel
                    : primaryLabel // ignore: cast_nullable_to_non_nullable
                        as String,
            secondaryLabel:
                null == secondaryLabel
                    ? _value.secondaryLabel
                    : secondaryLabel // ignore: cast_nullable_to_non_nullable
                        as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PrimaryCtaImplCopyWith<$Res>
    implements $PrimaryCtaCopyWith<$Res> {
  factory _$$PrimaryCtaImplCopyWith(
    _$PrimaryCtaImpl value,
    $Res Function(_$PrimaryCtaImpl) then,
  ) = __$$PrimaryCtaImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String eyebrow,
    String headline,
    String body,
    String primaryLabel,
    String secondaryLabel,
  });
}

/// @nodoc
class __$$PrimaryCtaImplCopyWithImpl<$Res>
    extends _$PrimaryCtaCopyWithImpl<$Res, _$PrimaryCtaImpl>
    implements _$$PrimaryCtaImplCopyWith<$Res> {
  __$$PrimaryCtaImplCopyWithImpl(
    _$PrimaryCtaImpl _value,
    $Res Function(_$PrimaryCtaImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PrimaryCta
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eyebrow = null,
    Object? headline = null,
    Object? body = null,
    Object? primaryLabel = null,
    Object? secondaryLabel = null,
  }) {
    return _then(
      _$PrimaryCtaImpl(
        eyebrow:
            null == eyebrow
                ? _value.eyebrow
                : eyebrow // ignore: cast_nullable_to_non_nullable
                    as String,
        headline:
            null == headline
                ? _value.headline
                : headline // ignore: cast_nullable_to_non_nullable
                    as String,
        body:
            null == body
                ? _value.body
                : body // ignore: cast_nullable_to_non_nullable
                    as String,
        primaryLabel:
            null == primaryLabel
                ? _value.primaryLabel
                : primaryLabel // ignore: cast_nullable_to_non_nullable
                    as String,
        secondaryLabel:
            null == secondaryLabel
                ? _value.secondaryLabel
                : secondaryLabel // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc

class _$PrimaryCtaImpl implements _PrimaryCta {
  const _$PrimaryCtaImpl({
    required this.eyebrow,
    required this.headline,
    required this.body,
    required this.primaryLabel,
    required this.secondaryLabel,
  });

  @override
  final String eyebrow;
  @override
  final String headline;
  @override
  final String body;
  @override
  final String primaryLabel;
  @override
  final String secondaryLabel;

  @override
  String toString() {
    return 'PrimaryCta(eyebrow: $eyebrow, headline: $headline, body: $body, primaryLabel: $primaryLabel, secondaryLabel: $secondaryLabel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PrimaryCtaImpl &&
            (identical(other.eyebrow, eyebrow) || other.eyebrow == eyebrow) &&
            (identical(other.headline, headline) ||
                other.headline == headline) &&
            (identical(other.body, body) || other.body == body) &&
            (identical(other.primaryLabel, primaryLabel) ||
                other.primaryLabel == primaryLabel) &&
            (identical(other.secondaryLabel, secondaryLabel) ||
                other.secondaryLabel == secondaryLabel));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    eyebrow,
    headline,
    body,
    primaryLabel,
    secondaryLabel,
  );

  /// Create a copy of PrimaryCta
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PrimaryCtaImplCopyWith<_$PrimaryCtaImpl> get copyWith =>
      __$$PrimaryCtaImplCopyWithImpl<_$PrimaryCtaImpl>(this, _$identity);
}

abstract class _PrimaryCta implements PrimaryCta {
  const factory _PrimaryCta({
    required final String eyebrow,
    required final String headline,
    required final String body,
    required final String primaryLabel,
    required final String secondaryLabel,
  }) = _$PrimaryCtaImpl;

  @override
  String get eyebrow;
  @override
  String get headline;
  @override
  String get body;
  @override
  String get primaryLabel;
  @override
  String get secondaryLabel;

  /// Create a copy of PrimaryCta
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PrimaryCtaImplCopyWith<_$PrimaryCtaImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$FooterContent {
  String get headline => throw _privateConstructorUsedError;
  String get body => throw _privateConstructorUsedError;
  List<ContactInfo> get contacts => throw _privateConstructorUsedError;

  /// Create a copy of FooterContent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FooterContentCopyWith<FooterContent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FooterContentCopyWith<$Res> {
  factory $FooterContentCopyWith(
    FooterContent value,
    $Res Function(FooterContent) then,
  ) = _$FooterContentCopyWithImpl<$Res, FooterContent>;
  @useResult
  $Res call({String headline, String body, List<ContactInfo> contacts});
}

/// @nodoc
class _$FooterContentCopyWithImpl<$Res, $Val extends FooterContent>
    implements $FooterContentCopyWith<$Res> {
  _$FooterContentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FooterContent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? headline = null,
    Object? body = null,
    Object? contacts = null,
  }) {
    return _then(
      _value.copyWith(
            headline:
                null == headline
                    ? _value.headline
                    : headline // ignore: cast_nullable_to_non_nullable
                        as String,
            body:
                null == body
                    ? _value.body
                    : body // ignore: cast_nullable_to_non_nullable
                        as String,
            contacts:
                null == contacts
                    ? _value.contacts
                    : contacts // ignore: cast_nullable_to_non_nullable
                        as List<ContactInfo>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$FooterContentImplCopyWith<$Res>
    implements $FooterContentCopyWith<$Res> {
  factory _$$FooterContentImplCopyWith(
    _$FooterContentImpl value,
    $Res Function(_$FooterContentImpl) then,
  ) = __$$FooterContentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String headline, String body, List<ContactInfo> contacts});
}

/// @nodoc
class __$$FooterContentImplCopyWithImpl<$Res>
    extends _$FooterContentCopyWithImpl<$Res, _$FooterContentImpl>
    implements _$$FooterContentImplCopyWith<$Res> {
  __$$FooterContentImplCopyWithImpl(
    _$FooterContentImpl _value,
    $Res Function(_$FooterContentImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of FooterContent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? headline = null,
    Object? body = null,
    Object? contacts = null,
  }) {
    return _then(
      _$FooterContentImpl(
        headline:
            null == headline
                ? _value.headline
                : headline // ignore: cast_nullable_to_non_nullable
                    as String,
        body:
            null == body
                ? _value.body
                : body // ignore: cast_nullable_to_non_nullable
                    as String,
        contacts:
            null == contacts
                ? _value._contacts
                : contacts // ignore: cast_nullable_to_non_nullable
                    as List<ContactInfo>,
      ),
    );
  }
}

/// @nodoc

class _$FooterContentImpl implements _FooterContent {
  const _$FooterContentImpl({
    required this.headline,
    required this.body,
    required final List<ContactInfo> contacts,
  }) : _contacts = contacts;

  @override
  final String headline;
  @override
  final String body;
  final List<ContactInfo> _contacts;
  @override
  List<ContactInfo> get contacts {
    if (_contacts is EqualUnmodifiableListView) return _contacts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_contacts);
  }

  @override
  String toString() {
    return 'FooterContent(headline: $headline, body: $body, contacts: $contacts)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FooterContentImpl &&
            (identical(other.headline, headline) ||
                other.headline == headline) &&
            (identical(other.body, body) || other.body == body) &&
            const DeepCollectionEquality().equals(other._contacts, _contacts));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    headline,
    body,
    const DeepCollectionEquality().hash(_contacts),
  );

  /// Create a copy of FooterContent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FooterContentImplCopyWith<_$FooterContentImpl> get copyWith =>
      __$$FooterContentImplCopyWithImpl<_$FooterContentImpl>(this, _$identity);
}

abstract class _FooterContent implements FooterContent {
  const factory _FooterContent({
    required final String headline,
    required final String body,
    required final List<ContactInfo> contacts,
  }) = _$FooterContentImpl;

  @override
  String get headline;
  @override
  String get body;
  @override
  List<ContactInfo> get contacts;

  /// Create a copy of FooterContent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FooterContentImplCopyWith<_$FooterContentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ContactInfo {
  IconData get icon => throw _privateConstructorUsedError;
  String get label => throw _privateConstructorUsedError;

  /// Create a copy of ContactInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ContactInfoCopyWith<ContactInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContactInfoCopyWith<$Res> {
  factory $ContactInfoCopyWith(
    ContactInfo value,
    $Res Function(ContactInfo) then,
  ) = _$ContactInfoCopyWithImpl<$Res, ContactInfo>;
  @useResult
  $Res call({IconData icon, String label});
}

/// @nodoc
class _$ContactInfoCopyWithImpl<$Res, $Val extends ContactInfo>
    implements $ContactInfoCopyWith<$Res> {
  _$ContactInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ContactInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? icon = null, Object? label = null}) {
    return _then(
      _value.copyWith(
            icon:
                null == icon
                    ? _value.icon
                    : icon // ignore: cast_nullable_to_non_nullable
                        as IconData,
            label:
                null == label
                    ? _value.label
                    : label // ignore: cast_nullable_to_non_nullable
                        as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ContactInfoImplCopyWith<$Res>
    implements $ContactInfoCopyWith<$Res> {
  factory _$$ContactInfoImplCopyWith(
    _$ContactInfoImpl value,
    $Res Function(_$ContactInfoImpl) then,
  ) = __$$ContactInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({IconData icon, String label});
}

/// @nodoc
class __$$ContactInfoImplCopyWithImpl<$Res>
    extends _$ContactInfoCopyWithImpl<$Res, _$ContactInfoImpl>
    implements _$$ContactInfoImplCopyWith<$Res> {
  __$$ContactInfoImplCopyWithImpl(
    _$ContactInfoImpl _value,
    $Res Function(_$ContactInfoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ContactInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? icon = null, Object? label = null}) {
    return _then(
      _$ContactInfoImpl(
        icon:
            null == icon
                ? _value.icon
                : icon // ignore: cast_nullable_to_non_nullable
                    as IconData,
        label:
            null == label
                ? _value.label
                : label // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc

class _$ContactInfoImpl implements _ContactInfo {
  const _$ContactInfoImpl({required this.icon, required this.label});

  @override
  final IconData icon;
  @override
  final String label;

  @override
  String toString() {
    return 'ContactInfo(icon: $icon, label: $label)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ContactInfoImpl &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.label, label) || other.label == label));
  }

  @override
  int get hashCode => Object.hash(runtimeType, icon, label);

  /// Create a copy of ContactInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ContactInfoImplCopyWith<_$ContactInfoImpl> get copyWith =>
      __$$ContactInfoImplCopyWithImpl<_$ContactInfoImpl>(this, _$identity);
}

abstract class _ContactInfo implements ContactInfo {
  const factory _ContactInfo({
    required final IconData icon,
    required final String label,
  }) = _$ContactInfoImpl;

  @override
  IconData get icon;
  @override
  String get label;

  /// Create a copy of ContactInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ContactInfoImplCopyWith<_$ContactInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$LeadFormData {
  String get name => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get company => throw _privateConstructorUsedError;
  String get projectDescription => throw _privateConstructorUsedError;
  String get budget => throw _privateConstructorUsedError;
  String get timeline => throw _privateConstructorUsedError;

  /// Create a copy of LeadFormData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LeadFormDataCopyWith<LeadFormData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LeadFormDataCopyWith<$Res> {
  factory $LeadFormDataCopyWith(
    LeadFormData value,
    $Res Function(LeadFormData) then,
  ) = _$LeadFormDataCopyWithImpl<$Res, LeadFormData>;
  @useResult
  $Res call({
    String name,
    String email,
    String company,
    String projectDescription,
    String budget,
    String timeline,
  });
}

/// @nodoc
class _$LeadFormDataCopyWithImpl<$Res, $Val extends LeadFormData>
    implements $LeadFormDataCopyWith<$Res> {
  _$LeadFormDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LeadFormData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? email = null,
    Object? company = null,
    Object? projectDescription = null,
    Object? budget = null,
    Object? timeline = null,
  }) {
    return _then(
      _value.copyWith(
            name:
                null == name
                    ? _value.name
                    : name // ignore: cast_nullable_to_non_nullable
                        as String,
            email:
                null == email
                    ? _value.email
                    : email // ignore: cast_nullable_to_non_nullable
                        as String,
            company:
                null == company
                    ? _value.company
                    : company // ignore: cast_nullable_to_non_nullable
                        as String,
            projectDescription:
                null == projectDescription
                    ? _value.projectDescription
                    : projectDescription // ignore: cast_nullable_to_non_nullable
                        as String,
            budget:
                null == budget
                    ? _value.budget
                    : budget // ignore: cast_nullable_to_non_nullable
                        as String,
            timeline:
                null == timeline
                    ? _value.timeline
                    : timeline // ignore: cast_nullable_to_non_nullable
                        as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$LeadFormDataImplCopyWith<$Res>
    implements $LeadFormDataCopyWith<$Res> {
  factory _$$LeadFormDataImplCopyWith(
    _$LeadFormDataImpl value,
    $Res Function(_$LeadFormDataImpl) then,
  ) = __$$LeadFormDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String name,
    String email,
    String company,
    String projectDescription,
    String budget,
    String timeline,
  });
}

/// @nodoc
class __$$LeadFormDataImplCopyWithImpl<$Res>
    extends _$LeadFormDataCopyWithImpl<$Res, _$LeadFormDataImpl>
    implements _$$LeadFormDataImplCopyWith<$Res> {
  __$$LeadFormDataImplCopyWithImpl(
    _$LeadFormDataImpl _value,
    $Res Function(_$LeadFormDataImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LeadFormData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? email = null,
    Object? company = null,
    Object? projectDescription = null,
    Object? budget = null,
    Object? timeline = null,
  }) {
    return _then(
      _$LeadFormDataImpl(
        name:
            null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                    as String,
        email:
            null == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                    as String,
        company:
            null == company
                ? _value.company
                : company // ignore: cast_nullable_to_non_nullable
                    as String,
        projectDescription:
            null == projectDescription
                ? _value.projectDescription
                : projectDescription // ignore: cast_nullable_to_non_nullable
                    as String,
        budget:
            null == budget
                ? _value.budget
                : budget // ignore: cast_nullable_to_non_nullable
                    as String,
        timeline:
            null == timeline
                ? _value.timeline
                : timeline // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc

class _$LeadFormDataImpl implements _LeadFormData {
  const _$LeadFormDataImpl({
    this.name = '',
    this.email = '',
    this.company = '',
    this.projectDescription = '',
    this.budget = '',
    this.timeline = '',
  });

  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final String email;
  @override
  @JsonKey()
  final String company;
  @override
  @JsonKey()
  final String projectDescription;
  @override
  @JsonKey()
  final String budget;
  @override
  @JsonKey()
  final String timeline;

  @override
  String toString() {
    return 'LeadFormData(name: $name, email: $email, company: $company, projectDescription: $projectDescription, budget: $budget, timeline: $timeline)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LeadFormDataImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.company, company) || other.company == company) &&
            (identical(other.projectDescription, projectDescription) ||
                other.projectDescription == projectDescription) &&
            (identical(other.budget, budget) || other.budget == budget) &&
            (identical(other.timeline, timeline) ||
                other.timeline == timeline));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    name,
    email,
    company,
    projectDescription,
    budget,
    timeline,
  );

  /// Create a copy of LeadFormData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LeadFormDataImplCopyWith<_$LeadFormDataImpl> get copyWith =>
      __$$LeadFormDataImplCopyWithImpl<_$LeadFormDataImpl>(this, _$identity);
}

abstract class _LeadFormData implements LeadFormData {
  const factory _LeadFormData({
    final String name,
    final String email,
    final String company,
    final String projectDescription,
    final String budget,
    final String timeline,
  }) = _$LeadFormDataImpl;

  @override
  String get name;
  @override
  String get email;
  @override
  String get company;
  @override
  String get projectDescription;
  @override
  String get budget;
  @override
  String get timeline;

  /// Create a copy of LeadFormData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LeadFormDataImplCopyWith<_$LeadFormDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ProjectGalleryItem {
  String get name => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;
  ProjectCategory get categoryType => throw _privateConstructorUsedError;
  String? get appStoreUrl => throw _privateConstructorUsedError;
  String? get playStoreUrl => throw _privateConstructorUsedError;

  /// Create a copy of ProjectGalleryItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProjectGalleryItemCopyWith<ProjectGalleryItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProjectGalleryItemCopyWith<$Res> {
  factory $ProjectGalleryItemCopyWith(
    ProjectGalleryItem value,
    $Res Function(ProjectGalleryItem) then,
  ) = _$ProjectGalleryItemCopyWithImpl<$Res, ProjectGalleryItem>;
  @useResult
  $Res call({
    String name,
    String category,
    String description,
    String imageUrl,
    ProjectCategory categoryType,
    String? appStoreUrl,
    String? playStoreUrl,
  });
}

/// @nodoc
class _$ProjectGalleryItemCopyWithImpl<$Res, $Val extends ProjectGalleryItem>
    implements $ProjectGalleryItemCopyWith<$Res> {
  _$ProjectGalleryItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProjectGalleryItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? category = null,
    Object? description = null,
    Object? imageUrl = null,
    Object? categoryType = null,
    Object? appStoreUrl = freezed,
    Object? playStoreUrl = freezed,
  }) {
    return _then(
      _value.copyWith(
            name:
                null == name
                    ? _value.name
                    : name // ignore: cast_nullable_to_non_nullable
                        as String,
            category:
                null == category
                    ? _value.category
                    : category // ignore: cast_nullable_to_non_nullable
                        as String,
            description:
                null == description
                    ? _value.description
                    : description // ignore: cast_nullable_to_non_nullable
                        as String,
            imageUrl:
                null == imageUrl
                    ? _value.imageUrl
                    : imageUrl // ignore: cast_nullable_to_non_nullable
                        as String,
            categoryType:
                null == categoryType
                    ? _value.categoryType
                    : categoryType // ignore: cast_nullable_to_non_nullable
                        as ProjectCategory,
            appStoreUrl:
                freezed == appStoreUrl
                    ? _value.appStoreUrl
                    : appStoreUrl // ignore: cast_nullable_to_non_nullable
                        as String?,
            playStoreUrl:
                freezed == playStoreUrl
                    ? _value.playStoreUrl
                    : playStoreUrl // ignore: cast_nullable_to_non_nullable
                        as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ProjectGalleryItemImplCopyWith<$Res>
    implements $ProjectGalleryItemCopyWith<$Res> {
  factory _$$ProjectGalleryItemImplCopyWith(
    _$ProjectGalleryItemImpl value,
    $Res Function(_$ProjectGalleryItemImpl) then,
  ) = __$$ProjectGalleryItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String name,
    String category,
    String description,
    String imageUrl,
    ProjectCategory categoryType,
    String? appStoreUrl,
    String? playStoreUrl,
  });
}

/// @nodoc
class __$$ProjectGalleryItemImplCopyWithImpl<$Res>
    extends _$ProjectGalleryItemCopyWithImpl<$Res, _$ProjectGalleryItemImpl>
    implements _$$ProjectGalleryItemImplCopyWith<$Res> {
  __$$ProjectGalleryItemImplCopyWithImpl(
    _$ProjectGalleryItemImpl _value,
    $Res Function(_$ProjectGalleryItemImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ProjectGalleryItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? category = null,
    Object? description = null,
    Object? imageUrl = null,
    Object? categoryType = null,
    Object? appStoreUrl = freezed,
    Object? playStoreUrl = freezed,
  }) {
    return _then(
      _$ProjectGalleryItemImpl(
        name:
            null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                    as String,
        category:
            null == category
                ? _value.category
                : category // ignore: cast_nullable_to_non_nullable
                    as String,
        description:
            null == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                    as String,
        imageUrl:
            null == imageUrl
                ? _value.imageUrl
                : imageUrl // ignore: cast_nullable_to_non_nullable
                    as String,
        categoryType:
            null == categoryType
                ? _value.categoryType
                : categoryType // ignore: cast_nullable_to_non_nullable
                    as ProjectCategory,
        appStoreUrl:
            freezed == appStoreUrl
                ? _value.appStoreUrl
                : appStoreUrl // ignore: cast_nullable_to_non_nullable
                    as String?,
        playStoreUrl:
            freezed == playStoreUrl
                ? _value.playStoreUrl
                : playStoreUrl // ignore: cast_nullable_to_non_nullable
                    as String?,
      ),
    );
  }
}

/// @nodoc

class _$ProjectGalleryItemImpl implements _ProjectGalleryItem {
  const _$ProjectGalleryItemImpl({
    required this.name,
    required this.category,
    required this.description,
    required this.imageUrl,
    required this.categoryType,
    this.appStoreUrl,
    this.playStoreUrl,
  });

  @override
  final String name;
  @override
  final String category;
  @override
  final String description;
  @override
  final String imageUrl;
  @override
  final ProjectCategory categoryType;
  @override
  final String? appStoreUrl;
  @override
  final String? playStoreUrl;

  @override
  String toString() {
    return 'ProjectGalleryItem(name: $name, category: $category, description: $description, imageUrl: $imageUrl, categoryType: $categoryType, appStoreUrl: $appStoreUrl, playStoreUrl: $playStoreUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProjectGalleryItemImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.categoryType, categoryType) ||
                other.categoryType == categoryType) &&
            (identical(other.appStoreUrl, appStoreUrl) ||
                other.appStoreUrl == appStoreUrl) &&
            (identical(other.playStoreUrl, playStoreUrl) ||
                other.playStoreUrl == playStoreUrl));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    name,
    category,
    description,
    imageUrl,
    categoryType,
    appStoreUrl,
    playStoreUrl,
  );

  /// Create a copy of ProjectGalleryItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProjectGalleryItemImplCopyWith<_$ProjectGalleryItemImpl> get copyWith =>
      __$$ProjectGalleryItemImplCopyWithImpl<_$ProjectGalleryItemImpl>(
        this,
        _$identity,
      );
}

abstract class _ProjectGalleryItem implements ProjectGalleryItem {
  const factory _ProjectGalleryItem({
    required final String name,
    required final String category,
    required final String description,
    required final String imageUrl,
    required final ProjectCategory categoryType,
    final String? appStoreUrl,
    final String? playStoreUrl,
  }) = _$ProjectGalleryItemImpl;

  @override
  String get name;
  @override
  String get category;
  @override
  String get description;
  @override
  String get imageUrl;
  @override
  ProjectCategory get categoryType;
  @override
  String? get appStoreUrl;
  @override
  String? get playStoreUrl;

  /// Create a copy of ProjectGalleryItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProjectGalleryItemImplCopyWith<_$ProjectGalleryItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ReviewItem {
  String get clientName => throw _privateConstructorUsedError;
  String get clientCompany => throw _privateConstructorUsedError;
  String get clientRole => throw _privateConstructorUsedError;
  double get rating => throw _privateConstructorUsedError;
  String get review => throw _privateConstructorUsedError;
  String get projectType => throw _privateConstructorUsedError;
  String? get avatarUrl => throw _privateConstructorUsedError;

  /// Create a copy of ReviewItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReviewItemCopyWith<ReviewItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReviewItemCopyWith<$Res> {
  factory $ReviewItemCopyWith(
    ReviewItem value,
    $Res Function(ReviewItem) then,
  ) = _$ReviewItemCopyWithImpl<$Res, ReviewItem>;
  @useResult
  $Res call({
    String clientName,
    String clientCompany,
    String clientRole,
    double rating,
    String review,
    String projectType,
    String? avatarUrl,
  });
}

/// @nodoc
class _$ReviewItemCopyWithImpl<$Res, $Val extends ReviewItem>
    implements $ReviewItemCopyWith<$Res> {
  _$ReviewItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReviewItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? clientName = null,
    Object? clientCompany = null,
    Object? clientRole = null,
    Object? rating = null,
    Object? review = null,
    Object? projectType = null,
    Object? avatarUrl = freezed,
  }) {
    return _then(
      _value.copyWith(
            clientName:
                null == clientName
                    ? _value.clientName
                    : clientName // ignore: cast_nullable_to_non_nullable
                        as String,
            clientCompany:
                null == clientCompany
                    ? _value.clientCompany
                    : clientCompany // ignore: cast_nullable_to_non_nullable
                        as String,
            clientRole:
                null == clientRole
                    ? _value.clientRole
                    : clientRole // ignore: cast_nullable_to_non_nullable
                        as String,
            rating:
                null == rating
                    ? _value.rating
                    : rating // ignore: cast_nullable_to_non_nullable
                        as double,
            review:
                null == review
                    ? _value.review
                    : review // ignore: cast_nullable_to_non_nullable
                        as String,
            projectType:
                null == projectType
                    ? _value.projectType
                    : projectType // ignore: cast_nullable_to_non_nullable
                        as String,
            avatarUrl:
                freezed == avatarUrl
                    ? _value.avatarUrl
                    : avatarUrl // ignore: cast_nullable_to_non_nullable
                        as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ReviewItemImplCopyWith<$Res>
    implements $ReviewItemCopyWith<$Res> {
  factory _$$ReviewItemImplCopyWith(
    _$ReviewItemImpl value,
    $Res Function(_$ReviewItemImpl) then,
  ) = __$$ReviewItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String clientName,
    String clientCompany,
    String clientRole,
    double rating,
    String review,
    String projectType,
    String? avatarUrl,
  });
}

/// @nodoc
class __$$ReviewItemImplCopyWithImpl<$Res>
    extends _$ReviewItemCopyWithImpl<$Res, _$ReviewItemImpl>
    implements _$$ReviewItemImplCopyWith<$Res> {
  __$$ReviewItemImplCopyWithImpl(
    _$ReviewItemImpl _value,
    $Res Function(_$ReviewItemImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ReviewItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? clientName = null,
    Object? clientCompany = null,
    Object? clientRole = null,
    Object? rating = null,
    Object? review = null,
    Object? projectType = null,
    Object? avatarUrl = freezed,
  }) {
    return _then(
      _$ReviewItemImpl(
        clientName:
            null == clientName
                ? _value.clientName
                : clientName // ignore: cast_nullable_to_non_nullable
                    as String,
        clientCompany:
            null == clientCompany
                ? _value.clientCompany
                : clientCompany // ignore: cast_nullable_to_non_nullable
                    as String,
        clientRole:
            null == clientRole
                ? _value.clientRole
                : clientRole // ignore: cast_nullable_to_non_nullable
                    as String,
        rating:
            null == rating
                ? _value.rating
                : rating // ignore: cast_nullable_to_non_nullable
                    as double,
        review:
            null == review
                ? _value.review
                : review // ignore: cast_nullable_to_non_nullable
                    as String,
        projectType:
            null == projectType
                ? _value.projectType
                : projectType // ignore: cast_nullable_to_non_nullable
                    as String,
        avatarUrl:
            freezed == avatarUrl
                ? _value.avatarUrl
                : avatarUrl // ignore: cast_nullable_to_non_nullable
                    as String?,
      ),
    );
  }
}

/// @nodoc

class _$ReviewItemImpl implements _ReviewItem {
  const _$ReviewItemImpl({
    required this.clientName,
    required this.clientCompany,
    required this.clientRole,
    required this.rating,
    required this.review,
    required this.projectType,
    this.avatarUrl,
  });

  @override
  final String clientName;
  @override
  final String clientCompany;
  @override
  final String clientRole;
  @override
  final double rating;
  @override
  final String review;
  @override
  final String projectType;
  @override
  final String? avatarUrl;

  @override
  String toString() {
    return 'ReviewItem(clientName: $clientName, clientCompany: $clientCompany, clientRole: $clientRole, rating: $rating, review: $review, projectType: $projectType, avatarUrl: $avatarUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReviewItemImpl &&
            (identical(other.clientName, clientName) ||
                other.clientName == clientName) &&
            (identical(other.clientCompany, clientCompany) ||
                other.clientCompany == clientCompany) &&
            (identical(other.clientRole, clientRole) ||
                other.clientRole == clientRole) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.review, review) || other.review == review) &&
            (identical(other.projectType, projectType) ||
                other.projectType == projectType) &&
            (identical(other.avatarUrl, avatarUrl) ||
                other.avatarUrl == avatarUrl));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    clientName,
    clientCompany,
    clientRole,
    rating,
    review,
    projectType,
    avatarUrl,
  );

  /// Create a copy of ReviewItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReviewItemImplCopyWith<_$ReviewItemImpl> get copyWith =>
      __$$ReviewItemImplCopyWithImpl<_$ReviewItemImpl>(this, _$identity);
}

abstract class _ReviewItem implements ReviewItem {
  const factory _ReviewItem({
    required final String clientName,
    required final String clientCompany,
    required final String clientRole,
    required final double rating,
    required final String review,
    required final String projectType,
    final String? avatarUrl,
  }) = _$ReviewItemImpl;

  @override
  String get clientName;
  @override
  String get clientCompany;
  @override
  String get clientRole;
  @override
  double get rating;
  @override
  String get review;
  @override
  String get projectType;
  @override
  String? get avatarUrl;

  /// Create a copy of ReviewItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReviewItemImplCopyWith<_$ReviewItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
