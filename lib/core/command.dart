import 'package:flutter/foundation.dart';
import 'result.dart';

abstract class Command<T> extends ChangeNotifier {
  bool _isExecuting = false;
  Result<T>? _result;

  bool get isExecuting => _isExecuting;
  Result<T>? get result => _result;

  bool get isSuccess => _result is Success<T>;
  bool get isFailure => _result is Failure<T>;

  T? get valueOrNull => _result?.valueOrNull;
  Object? get errorOrNull => _result?.errorOrNull;

  @protected
  Future<void> execute(Future<Result<T>> Function() action) async {
    if (_isExecuting) {
      return;
    }

    _isExecuting = true;
    _result = null;
    notifyListeners();

    _result = await action();

    _isExecuting = false;
    notifyListeners();
  }

  void clearResult() {
    _result = null;
    notifyListeners();
  }
}

class Command0<T> extends Command<T> {
  Command0(this._action);
  final Future<Result<T>> Function() _action;

  Future<void> run() => execute(_action);
}

class Command1<TArg, T> extends Command<T> {
  Command1(this._action);
  final Future<Result<T>> Function(TArg arg) _action;

  Future<void> run(TArg arg) => execute(() => _action(arg));
}