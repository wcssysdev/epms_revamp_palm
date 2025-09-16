import 'package:equatable/equatable.dart';

abstract class AddMandorEvent extends Equatable{
  @override
  List<Object?> get props => [];
}

class LoadMandorScreenData extends AddMandorEvent {
  // saat screen pertama kali di buka
  // syarat nya => 
  // 1. main.dart -> daftarkan BLoC ini pada BlocProvider
  // 2. AddMandorScreen -> void initState() { context.read<AddMandorBloc>().add(LoadMandorScreenData())}
  // JANGAN HAPUS
}