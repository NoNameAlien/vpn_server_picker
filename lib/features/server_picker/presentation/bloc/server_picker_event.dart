import 'package:equatable/equatable.dart';

enum ServerTab { all, mine, favorites }

sealed class ServerPickerEvent extends Equatable {
  const ServerPickerEvent();
  @override
  List<Object?> get props => [];
}

class ServerTabChanged extends ServerPickerEvent {
  final ServerTab tab;
  const ServerTabChanged(this.tab);
  @override
  List<Object?> get props => [tab];
}

class ServerSearchChanged extends ServerPickerEvent {
  final String query;
  const ServerSearchChanged(this.query);
  @override
  List<Object?> get props => [query];
}

class ServerFavoriteToggled extends ServerPickerEvent {
  final String serverId;
  const ServerFavoriteToggled(this.serverId);
  @override
  List<Object?> get props => [serverId];
}

class ServerSelected extends ServerPickerEvent {
  final String serverId;
  const ServerSelected(this.serverId);

  @override
  List<Object?> get props => [serverId];
}
