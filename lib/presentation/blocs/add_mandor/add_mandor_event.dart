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

class UpdateMandorPicker extends AddMandorEvent {
  final int index;
  final String? selectedName;

  UpdateMandorPicker({
    required this.index,
    required this.selectedName,
  });

  @override
  List<Object?> get props => [index, selectedName];
}

class DeleteMandorSelected extends AddMandorEvent{
  final int index;
  DeleteMandorSelected({required this.index});

  @override
  List<Object?> get props => [index];
}

class UpdateMandor extends AddMandorEvent {
  final int index;
  final String mandorName;
  UpdateMandor(this.index, this.mandorName);
}

class SubmitMandorSelection extends AddMandorEvent{}