import 'package:flutter/material.dart';

enum ViewState { intial, loading, loaded }

class BaseViewModel extends ChangeNotifier {
  ViewState _state = ViewState.intial;
  ViewState get state => _state;

  String _error;
  String get error => _error;
  bool get hasError => _error != null;

  void setState(ViewState viewState) {
    _state = viewState;
    notifyListeners();
  }

  void setError(String message) => _error = message;

  performTryOrFailure(Function execute, [bool globalNotify = true]) async {
    if (globalNotify) setState(ViewState.loading);
    try {
      await execute();
      setError(null);
    } catch (e) {
      print(e.toString());
      setError("$e");
    } finally {
      if (globalNotify) setState(ViewState.loaded);
    }
  }
}