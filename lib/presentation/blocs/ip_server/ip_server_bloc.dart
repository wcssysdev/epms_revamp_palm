import 'package:epms_tech/core/constants/ip_server_constants.dart';
import 'package:epms_tech/presentation/blocs/ip_server/ip_server_event.dart';
import 'package:epms_tech/presentation/blocs/ip_server/ip_server_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class IpServerBloc extends Bloc<IpServerEvent, IpServerState>{
  IpServerBloc()
    : super(IpServerState(servers: IpServerConstants.listIp)) {
      
      on<LoadIpServerList>((event, emit) {
        emit(state.copyWith(servers: IpServerConstants.listIp));
      });

      on<SelectIpServer>((event, emit) {
        emit(state.copyWith(selected: event.selectedServer));
      });
    }

}