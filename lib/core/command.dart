import 'package:flutter/foundation.dart';
import 'result.dart';

typedef CommandAction<TParam, TResult> = Future<Result<TResult>> Function(TParam param);

class Command<TParam, TResult> extends ChangeNotifier {
  final CommandAction<TParam, TResult> _action;

  Command(this._action);

  bool _isExecuting = false;

  bool get isExecuting => _isExecuting;

  Result<TResult>? _result;
  Result<TResult>? get result => _result;

  Future<void> execute(TParam param) async {
    if (_isExecuting) return;

    _isExecuting = true;
    _result = null;
    notifyListeners();

    try {
      _result = await _action(param);
    } catch (e) {
      _result = Failure(e is Exception ? e : Exception(e.toString()));
    } finally {
      _isExecuting = false;
      notifyListeners();
    }
  }

  void clearResult() {
    _result = null;
    notifyListeners();
  }
}

class Command0<TResult> extends Command<void, TResult> {
  Command0(Future<Result<TResult>> Function() action)
      : super((_) => action());

  Future<void> execute0() => execute(null);
}
