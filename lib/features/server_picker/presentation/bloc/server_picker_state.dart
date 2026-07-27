import 'package:equatable/equatable.dart';
import 'package:vpn_server_picker/core/error/failure.dart';
import 'package:vpn_server_picker/features/server_picker/domain/entities/server.dart';
import 'server_picker_event.dart';

class ServerPickerState extends Equatable {
  final ServerTab tab;
  final String query;
  final List<Server> servers;
  final String selectedServerId;
  final bool isLoading;
  final Failure? failure;

  const ServerPickerState({
    required this.tab,
    required this.query,
    required this.servers,
    required this.selectedServerId,
    required this.isLoading,
    required this.failure,
  });

  factory ServerPickerState.initial() => const ServerPickerState(
    tab: ServerTab.all,
    query: '',
    servers: <Server>[],
    selectedServerId: '',
    isLoading: false,
    failure: null,
  );

  ServerPickerState copyWith({
    ServerTab? tab,
    String? query,
    List<Server>? servers,
    String? selectedServerId,
    bool? isLoading,
    Failure? failure,
    bool clearFailure = false,
  }) {
    return ServerPickerState(
      tab: tab ?? this.tab,
      query: query ?? this.query,
      servers: servers ?? this.servers,
      selectedServerId: selectedServerId ?? this.selectedServerId,
      isLoading: isLoading ?? this.isLoading,
      failure: clearFailure ? null : failure ?? this.failure,
    );
  }

  List<Server> get filtered {
    final q = query.trim().toLowerCase();

    Iterable<Server> items = servers;

    switch (tab) {
      case ServerTab.all:
        break;
      case ServerTab.mine:
        items = items.where((s) => s.isMine);
        break;
      case ServerTab.favorites:
        items = items.where((s) => s.isFavorite);
        break;
    }

    if (q.isNotEmpty) {
      items = items.where((s) => s.name.toLowerCase().contains(q));
    }

    return items.toList(growable: false);
  }

  @override
  List<Object?> get props => [
    tab,
    query,
    servers,
    selectedServerId,
    isLoading,
    failure,
  ];
}
