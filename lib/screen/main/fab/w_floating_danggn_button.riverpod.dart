import 'package:fast_app_base/screen/main/fab/w_floating_danggn_button.state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final floatingButtonStateProvider =
    StateNotifierProvider<FloatingButtonStateNotifier, FloatingButtonState>(
  (ref) => FloatingButtonStateNotifier(
    const FloatingButtonState(false, false, false),
  ),
);

class FloatingButtonStateNotifier extends StateNotifier<FloatingButtonState> {
  FloatingButtonStateNotifier(super.state);

  bool needToMakeButtonBigger = false;

  void toggleMenu() {
    final isExpanded = state.isExpanded;
    final isSmall = state.isSmall;

    // state = FloatingButtonState(!state.isExpanded, true);
    state = state.copyWith(
        isExpanded: !state.isExpanded,
        isSmall: needToMakeButtonBigger ? false : true);
    // ..isExpanded = !state.isExpanded
    // ..isSmall = true;
    if(needToMakeButtonBigger) {
      needToMakeButtonBigger = false;
    }

    if (!isSmall && !isExpanded) {
      needToMakeButtonBigger = true;
    }
  }

  void changeButtonSize(bool isSmall) {
    // state = state..isSmall = isSmall;
    state = state.copyWith(isSmall: isSmall);
  }

  @override
  bool updateShouldNotify(
      FloatingButtonState old, FloatingButtonState current) {
    return true;
  }

  void hideButton() {
    state = state.copyWith(ishided: true);
  }

  void showButton() {
    state = state.copyWith(ishided: false);
  }
}
