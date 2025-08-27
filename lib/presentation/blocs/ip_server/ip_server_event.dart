abstract class IpServerEvent {}

class LoadIpServerList extends IpServerEvent{}

class SelectIpServer extends IpServerEvent{
  final Map<String, String> selectedServer;
  SelectIpServer(this.selectedServer);
}