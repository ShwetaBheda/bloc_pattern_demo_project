import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repositories/user_repository.dart';
import 'user_event.dart';
import 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository _repository;

  UserBloc(this._repository) : super(UserInitial()) {
    on<FetchUsers>((event, emit) async {
      emit(UserLoading()); // Emit loading state
      try {
        final users = await _repository.fetchUsers();
        emit(UserLoaded(users)); // Emit loaded state with data
      } catch (e) {
        emit(UserError(e.toString())); // Emit error state
      }
    });
  }
}
