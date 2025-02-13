import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_training/core/networking/dio_base_client.dart';
import 'package:flutter_training/features/common/auth_cubit_states.dart';
import 'package:flutter_training/main.dart';

class LoginCubit extends Cubit<AuthStates> {
  LoginCubit() : super(AuthIntialState());
  final baseClient = DioBaseClient();

  // Login User Method
  Future<void> login({required Map<String, dynamic> data}) async {
    emit(LoginLoadingState());
    try {
      // post request with dio
      Response response = await baseClient.dio.post(
        "token?grant_type=password",
        data: data,
      );



      emit(LoginSuccessState());
    } on DioException catch (e) {
      emit(
        LoginErrorState(
          errMsg: e.response?.data['msg'] ?? e.message ?? e.error.toString(),
        ),
      );
    } catch (e) {
      emit(
        LoginErrorState(
          errMsg: e.toString(),
        ),
      );
    }
  }

  bool isHidden = true;

  // ============================================== change password visibility method ================================================================
  void changePasswordVisibility() {
    isHidden = !isHidden;
    emit(PasswordVisibilyChanged());
  }
}
