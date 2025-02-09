import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';

abstract class BaseController extends GetxController {
  final viewState = Rx<Either<Failure, Success>>(Right(UIState.idle));

  void consumeState(Stream<Either<Failure, Success>> newStateStream) async {
    newStateStream.listen(
      (state) => onData(state),
      onError: (error) => onError(error),
      onDone: () => onDone()
    );
  }

  void dispatchState(Either<Failure, Success> newState) {
    viewState.value = newState;
  }

  void getState(Future<Either<Failure, Success>> newStateStream) async {
    final state = await newStateStream;
    state.fold(
      (failure) => onError(failure),
      (success) => onData(state)
    );
  }

  void onData(Either<Failure, Success> newState) {
    viewState.value = newState;
  }

  void onError(dynamic error);

  void onDone();
}