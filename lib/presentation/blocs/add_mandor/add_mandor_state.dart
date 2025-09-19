import 'package:epms_tech/domain/entities/gang_allotment.dart';
import 'package:epms_tech/domain/entities/user_assignment.dart';
import 'package:equatable/equatable.dart';

abstract class AddMandorState extends Equatable {
  final List<GangAllotment> mandorSelected;

  const AddMandorState({this.mandorSelected = const []});

  @override
  List<Object?> get props => [mandorSelected];
}
// equatable = BANDING 2 OBJECT =bila ada data baru yang sama (sumber dari child) maka data di parent tidak akan terupadate
// props => [] ; parent menyediakan kerangka kosong []
// JANGAN HAPUS

// 1. WAJIB PERTAMA Saat belum ada aksi JANGAN HAPUS
class AddMandorInitial extends AddMandorState {}

// 2. Saat proses GET DATA JANGAN HAPUS
class AddMandorLoading extends AddMandorState {}

// 3. saat data berhasil di dapat JANGAN HAPUS
class AddMandorLoaded extends AddMandorState {
  final List<UserAssignment> listMandor; // list mandor sorted
  final List<GangAllotment> gangAllotment; // init gang allotment

  const AddMandorLoaded({
    required this.listMandor,
    required this.gangAllotment,
    required super.mandorSelected,
  });
  @override
  List<Object?> get props => [listMandor, mandorSelected];
}

class MandorPickerSet extends AddMandorState {
  final List<UserAssignment> listMandor;
  final List<String?> mandorPickerList;

  const MandorPickerSet({
    required this.listMandor,
    required this.mandorPickerList,
    required super.mandorSelected,
  });

  @override
  List<Object?> get props => [listMandor, mandorPickerList, mandorSelected];
}

class IconSearchClickedState extends AddMandorState {
  //
  final bool showPopup;
  final int index;

  const IconSearchClickedState({required this.showPopup, required this.index});

  @override
  List<Object?> get props => [showPopup, index];
}

class ShowMandorSearchModal extends AddMandorState {
  final int index;
  const ShowMandorSearchModal({required this.index});
}

class AddMandorSubmitting extends AddMandorState {}

class AddMandorSuccess extends AddMandorState {}

// 4. Misal saat Get error JANGAN HAPUS
class AddMandorError extends AddMandorState {
  final String message;
  const AddMandorError(this.message);

  @override
  List<Object?> get props => [message];
}

class AddMandorBySearched extends AddMandorState {
  final int index;
  final String name;

  const AddMandorBySearched({
    required this.index,
    required this.name,
  });

  @override
  List<Object?> get props => [index, name];
}
