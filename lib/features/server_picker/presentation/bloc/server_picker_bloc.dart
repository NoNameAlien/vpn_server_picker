import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vpn_server_picker/features/server_picker/domain/repositories/server_repository.dart';
import 'server_picker_event.dart';
import 'server_picker_state.dart';

class ServerPickerBloc extends Bloc<ServerPickerEvent, ServerPickerState> {
  final ServerRepository _serverRepository;

  ServerPickerBloc({required ServerRepository serverRepository})
    : _serverRepository = serverRepository,
      super(ServerPickerState.initial()) {
    on<ServerPickerStarted>(_onStarted);
    on<ServerTabChanged>((e, emit) {
      emit(state.copyWith(tab: e.tab, query: ''));
    });
    on<ServerSearchChanged>((e, emit) => emit(state.copyWith(query: e.query)));
    on<ServerFavoriteToggled>(_onFavoriteToggled);
    on<ServerSelected>(
      (e, emit) => emit(state.copyWith(selectedServerId: e.serverId)),
    );

    add(const ServerPickerStarted());
  }

  Future<void> _onStarted(
    ServerPickerStarted event,
    Emitter<ServerPickerState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, clearFailure: true));

    final result = await _serverRepository.getServers();

    result.when(
      success: (servers) {
        emit(
          state.copyWith(
            servers: servers,
            selectedServerId: servers.isNotEmpty ? servers.first.id : '',
            isLoading: false,
            clearFailure: true,
          ),
        );
      },
      failure: (failure) {
        emit(state.copyWith(isLoading: false, failure: failure));
      },
    );
  }

  void _onFavoriteToggled(
    ServerFavoriteToggled event,
    Emitter<ServerPickerState> emit,
  ) {
    final updated = state.servers
        .map((s) {
          if (s.id != event.serverId) return s;
          return s.copyWith(isFavorite: !s.isFavorite);
        })
        .toList(growable: false);

    emit(state.copyWith(servers: updated));
  }
}
