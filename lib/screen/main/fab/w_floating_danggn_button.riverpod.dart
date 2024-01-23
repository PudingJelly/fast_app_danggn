import 'package:flutter_riverpod/flutter_riverpod.dart';

class FloatingButtonState {
  bool isExpanded;
  bool isSmall;

  // FloatingButtonState()
  //     : isExpanded = false,
  //       isSmall = false;

  FloatingButtonState(this.isExpanded, this.isSmall);
}

final floatingButtonStateProvider =
    StateNotifierProvider<FloatingButtonStateNotifier, FloatingButtonState>(
  (ref) => FloatingButtonStateNotifier(
    FloatingButtonState(false, false),
  ),
);

class FloatingButtonStateNotifier extends StateNotifier<FloatingButtonState> {
  FloatingButtonStateNotifier(super.state);

  @override
  bool updateShouldNotify(FloatingButtonState old, FloatingButtonState current) {
    return true;
  }

  void onTapButton() {
    state = FloatingButtonState(!state.isExpanded, true);
      // ..isExpanded = !state.isExpanded
      // ..isSmall = true;
  }

  void changeButtonSize(bool isSmall) {
    // state = state..isSmall = isSmall;
    state = FloatingButtonState(state.isExpanded, isSmall);
  }
}
