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
        ),
      );
    }
  }
}
