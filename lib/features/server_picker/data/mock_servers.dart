class ServerItem {
  final String id;
  final String name;
  final String country;
  final int latencyMs;
  final bool isMine;
  final bool isFavorite;
  final String countryCode;

  const ServerItem({
    required this.id,
    required this.name,
    required this.country,
    required this.latencyMs,
    required this.isMine,
    required this.isFavorite,
    required this.countryCode,
  });

  ServerItem copyWith({bool? isFavorite}) => ServerItem(
    id: id,
    name: name,
    country: country,
    latencyMs: latencyMs,
    isMine: isMine,
    isFavorite: isFavorite ?? this.isFavorite,
    countryCode: countryCode,
  );
}

const mockServers = <ServerItem>[
  ServerItem(
    id: 'de-berlin-1',
    name: 'Берлин',
    country: 'Германия',
    latencyMs: 120,
    isMine: true,
    isFavorite: false,
    countryCode: 'DE',
  ),
  ServerItem(
    id: 'de-berlin-2',
    name: 'Берлин',
    country: 'Германия',
    latencyMs: 120,
    isMine: false,
    isFavorite: false,
    countryCode: 'DE',
  ),
  ServerItem(
    id: 'de-berlin-3',
    name: 'Берлин',
    country: 'Германия',
    latencyMs: 120,
    isMine: false,
    isFavorite: true,
    countryCode: 'DE',
  ),
  ServerItem(
    id: 'us-ny-1',
    name: 'Нью-Йорк',
    country: 'США',
    latencyMs: 180,
    isMine: false,
    isFavorite: false,
    countryCode: 'US',
  ),
];
