import 'package:flutter_bloc/flutter_bloc.dart';
import 'server_picker_event.dart';
import 'server_picker_state.dart';

class ServerPickerBloc extends Bloc<ServerPickerEvent, ServerPickerState> {
  ServerPickerBloc() : super(ServerPickerState.initial()) {
    on<ServerTabChanged>((e, emit) {
      emit(state.copyWith(tab: e.tab, query: ''));
    });
    on<ServerSearchChanged>((e, emit) => emit(state.copyWith(query: e.query)));
    on<ServerFavoriteToggled>(_onFavoriteToggled);
    on<ServerSelected>(
      (e, emit) => emit(state.copyWith(selectedServerId: e.serverId)),
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
