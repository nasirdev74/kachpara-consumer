import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:kachpara/domain/usecases/user_usecase.dart';

import '../../../app/user_bloc/user_bloc.dart';
import '../../../core/injector.dart';
import '../../../utils/status.dart';

part 'register_page_state.dart';
part 'register_page_cubit.freezed.dart';

@injectable
class RegisterPageCubit extends Cubit<RegisterPageState> {
  RegisterPageCubit(this._userUseCase) : super(const RegisterPageState());

  final UserUseCase _userUseCase;

  Future<void> register(String name) async {
    emit(state.copyWith(registerStatus: Status.loading));
    final user = getIt<UserBloc>().state.user;

    final result = await _userUseCase.updateUser(user!.copyWith(name: name));
    result.when(success: (data) {
      emit(state.copyWith(registerStatus: Status.success));
    }, error: (error) {
      emit(state.copyWith(registerStatus: Status.failed));
    });
  }
}
