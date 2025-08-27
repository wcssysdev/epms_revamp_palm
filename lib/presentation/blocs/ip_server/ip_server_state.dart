class IpServerState {
  final List<Map<String, String>> servers;
  final Map<String, String>? selected;

  IpServerState({ required this.servers, this.selected });

  IpServerState copyWith({
    List<Map<String, String>>? servers,
    Map<String, String>? selected
  }) {
    return IpServerState(servers: servers ?? this.servers, selected: selected ?? this.selected);
  }
}