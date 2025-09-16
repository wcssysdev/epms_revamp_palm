import 'package:equatable/equatable.dart';

abstract class AddMandorEvent extends Equatable{
  @override
  List<Object?> get props => [];
}

class LoadMandorList extends AddMandorEvent {
  // saat screen pertama kali di buka
  // syarat nya => 
  // 1. main.dart -> daftarkan BLoC ini pada BlocProvider
  // 2. AddMandorScreen -> void initState() { context.read<AddMandorBloc>().add(LoadMandorList())}
  // JANGAN HAPUS
}

class ClickAddButton extends AddMandorEvent {
  // menambahkan ui list picker
  // trigger list UI Picker
}

class AddMandor extends AddMandorEvent{}

class RemoveMandor extends AddMandorEvent{
  final int index;
  RemoveMandor(this.index);
}

class UpdateMandor extends AddMandorEvent {
  final int index;
  final String mandorName;
  UpdateMandor(this.index, this.mandorName);
}

class SubmitMandorSelection extends AddMandorEvent{}