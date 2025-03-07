import 'package:core/core.dart';

class SaveEmailAddressSuccess extends UIState {

  SaveEmailAddressSuccess();

  @override
  List<Object?> get props => [];
}

class SaveEmailAddressFailure extends FeatureFailure {
  final exception;

  SaveEmailAddressFailure(this.exception);

  @override
  List<Object> get props => [exception];
}