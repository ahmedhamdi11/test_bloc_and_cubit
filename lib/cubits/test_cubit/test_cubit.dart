import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'test_state.dart';

class TestCubit extends Cubit<TestState> {
  TestCubit() : super(TestInitial());

  Future<void> getData() async {
    // emit the loading state before starting the request
    emit(RequestLoading());

    try {
      // get the data from the api
      Response res = await Dio().get("https://reqres.in/api/users/2");

      // if the request completed successfully emit the success state
      emit(RequestSuccess(res.data));
    } catch (e) {
      // if any error happened while sending the get request catch the
      // error and emit the failure state
      emit(RequestFailure(e.toString()));
    }
  }
}
