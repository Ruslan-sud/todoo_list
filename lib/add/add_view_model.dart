import 'package:flutter/material.dart';
import 'add_state.dart';

class AddViewModel extends ChangeNotifier {
  AddState _state = AddState.initial();

  AddState get state => _state;

  void submit(String text) {
    _state = AddState(
      isInitial: false,
      isSucceed: text.isNotEmpty,
    );

    notifyListeners();
  }

  void reset() {
    _state = AddState.initial();
    notifyListeners();
  }
}