part of 'test_cubit.dart';

sealed class TestState {}

final class TestInitial extends TestState {}

final class RequestLoading extends TestState {}

final class RequestFailure extends TestState {
  final String errMessage;

  RequestFailure(this.errMessage);
}

final class RequestSuccess extends TestState {
  final Map data;

  RequestSuccess(this.data);
}
