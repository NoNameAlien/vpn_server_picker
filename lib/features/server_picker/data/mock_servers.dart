import 'package:vpn_server_picker/features/server_picker/domain/entities/server.dart';

const mockServers = <Server>[
  Server(
    id: 'de-berlin-1',
    name: 'Берлин',
    country: 'Германия',
    latencyMs: 120,
    isMine: true,
    isFavorite: false,
    countryCode: 'DE',
  ),
  Server(
    id: 'de-berlin-2',
    name: 'Берлин',
    country: 'Германия',
    latencyMs: 120,
    isMine: false,
    isFavorite: false,
    countryCode: 'DE',
  ),
  Server(
    id: 'de-berlin-3',
    name: 'Берлин',
    country: 'Германия',
    latencyMs: 120,
    isMine: false,
    isFavorite: true,
    countryCode: 'DE',
  ),
  Server(
    id: 'us-ny-1',
    name: 'Нью-Йорк',
    country: 'США',
    latencyMs: 180,
    isMine: false,
    isFavorite: false,
    countryCode: 'US',
  ),
];
