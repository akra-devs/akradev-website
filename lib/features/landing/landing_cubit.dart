import 'package:flutter_bloc/flutter_bloc.dart';

import 'landing_state.dart';

class LandingCubit extends Cubit<LandingState> {
  LandingCubit() : super(LandingState.initial());

  void requestProjectInquiry() {
    emit(
      state.copyWith(
        isContactDialogVisible: true,
        contactIntent: ContactIntent.projectInquiry,
      ),
    );
  }

  void requestPortfolio() {
    emit(
      state.copyWith(
        isContactDialogVisible: true,
        contactIntent: ContactIntent.portfolio,
      ),
    );
  }

  void dismissContactDialog() {
    if (state.isContactDialogVisible || state.contactIntent != null) {
      emit(
        state.copyWith(
          isContactDialogVisible: false,
          contactIntent: null,
          formData: const LeadFormData(),
          formStatus: FormSubmissionStatus.idle,
          formErrorMessage: null,
        ),
      );
    }
  }

  void updateFormField({
    String? name,
    String? email,
    String? company,
    String? projectDescription,
    String? budget,
    String? timeline,
  }) {
    emit(
      state.copyWith(
        formData: state.formData.copyWith(
          name: name ?? state.formData.name,
          email: email ?? state.formData.email,
          company: company ?? state.formData.company,
          projectDescription: projectDescription ?? state.formData.projectDescription,
          budget: budget ?? state.formData.budget,
          timeline: timeline ?? state.formData.timeline,
        ),
      ),
    );
  }

  bool _validateEmail(String email) {
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(email);
  }

  Future<void> submitLeadForm() async {
    // Validation
    if (state.formData.name.trim().isEmpty) {
      emit(state.copyWith(
        formStatus: FormSubmissionStatus.error,
        formErrorMessage: '이름을 입력해주세요.',
      ));
      return;
    }

    if (state.formData.email.trim().isEmpty) {
      emit(state.copyWith(
        formStatus: FormSubmissionStatus.error,
        formErrorMessage: '이메일을 입력해주세요.',
      ));
      return;
    }

    if (!_validateEmail(state.formData.email)) {
      emit(state.copyWith(
        formStatus: FormSubmissionStatus.error,
        formErrorMessage: '올바른 이메일 형식을 입력해주세요.',
      ));
      return;
    }

    if (state.formData.projectDescription.trim().isEmpty) {
      emit(state.copyWith(
        formStatus: FormSubmissionStatus.error,
        formErrorMessage: '프로젝트 설명을 입력해주세요.',
      ));
      return;
    }

    // Submit
    emit(state.copyWith(
      formStatus: FormSubmissionStatus.submitting,
      formErrorMessage: null,
    ));

    try {
      // TODO: Implement actual API call
      // Example: await _apiService.submitLead(state.formData);

      // Simulate network delay
      await Future.delayed(const Duration(seconds: 2));

      emit(state.copyWith(
        formStatus: FormSubmissionStatus.success,
      ));
    } catch (e) {
      emit(state.copyWith(
        formStatus: FormSubmissionStatus.error,
        formErrorMessage: '제출 중 오류가 발생했습니다. 다시 시도해주세요.',
      ));
    }
  }
}
