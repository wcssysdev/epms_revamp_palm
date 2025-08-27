class IpServerConstants {
  static const List<Map<String, String>> listIp = [
    {
        "name": "External Production",
        "ip": "https://epms.mhp.co.id:8120/api/v1"
    },
    {
        "name": 'Internal Production',
        "ip": "http://192.168.100.247:82/api/v1"
    },
    {
        "name": 'Development',
        "ip": "http://222.124.7.230:8121/api/v1"
    }
  ];
}