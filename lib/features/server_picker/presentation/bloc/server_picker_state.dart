import 'package:equatable/equatable.dart';
import 'package:vpn_server_picker/features/server_picker/data/mock_servers.dart';
import 'server_picker_event.dart';

class ServerPickerState extends Equatable {
  final ServerTab tab;
  final String query;
  final List<ServerItem> servers;
  final String selectedServerId;

  const ServerPickerState({
    required this.tab,
    required this.query,
    required this.servers,
    required this.selectedServerId,
  });

  factory ServerPickerState.initial() => const ServerPickerState(
    tab: ServerTab.all,
    query: '',
    servers: mockServers,
    selectedServerId: 'de-berlin-1',
  );

  ServerPickerState copyWith({
    ServerTab? tab,
    String? query,
    List<ServerItem>? servers,
    String? selectedServerId,
  }) {
    return ServerPickerState(
      tab: tab ?? this.tab,
      query: query ?? this.query,
      servers: servers ?? this.servers,
      selectedServerId: selectedServerId ?? this.selectedServerId,
    );
  }

  List<ServerItem> get filtered {
    final q = query.trim().toLowerCase();

    Iterable<ServerItem> items = servers;

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
  List<Object?> get props => [tab, query, servers, selectedServerId];
}
