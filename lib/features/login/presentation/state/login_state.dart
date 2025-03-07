import 'package:core/core.dart';
import 'package:core/presentation/state/failure.dart';
import 'package:core/presentation/state/success.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

@immutable
class LoginState extends AppState {
  LoginState(Either<Failure, Success> viewState) : super(viewState);
}

@immutable
class LoginLoadingAction extends ViewState {
  @override
  List<Object?> get props => [];
}

@immutable
class LoginInitAction extends ViewState {
  @override
  List<Object?> get props => [];
}

@immutable
class LoginMissPropertiesAction extends Failure {
  @override
  List<Object?> get props => [];
}