import 'package:epms_tech/domain/entities/gang_allotment.dart';
import 'package:epms_tech/domain/entities/user_assignment.dart';
import 'package:equatable/equatable.dart';


abstract class AddMandorState extends Equatable {
  @override
  List<Object?> get props => [];
}
// kelas dasar / parent tapi tidak bisa langsung create object  JANGAN HAPUS
// equatable = BANDING 2 OBJECT =bila ada data baru yang sama (sumber dari child) maka data di parent tidak akan terupadate
// props => [] ; parent menyediakan kerangka kosong []
// kondisi = Initial, Loading, success/ data, error
// JANGAN HAPUS

// 1. WAJIB PERTAMA Saat belum ada aksi JANGAN HAPUS
class AddMandorInitial extends AddMandorState {}

// 2. Saat proses GET DATA JANGAN HAPUS
class AddMandorLoading extends AddMandorState{}

// 3. saat data berhasil di dapat JANGAN HAPUS
class AddMandorLoaded extends AddMandorState{
  final List<UserAssignment> listMandor;// list mandor sorted
  final List<GangAllotment> gangAllotment; // init gang allotment

  AddMandorLoaded({
    required this.listMandor,
    required this.gangAllotment,
  });

  @override 
  List<Object?> get props => [listMandor];
}

class MandorPickerSet extends AddMandorState {
  final List<UserAssignment> listMandor;
  final List<String?> mandorPickerList;

  MandorPickerSet({
    required this.listMandor,
    required this.mandorPickerList,
  });

  @override
  List<Object?> get props => [listMandor, mandorPickerList];
}

class AddMandorSubmitting extends AddMandorState{}

class AddMandorSuccess extends AddMandorState{}

// 4. Misal saat Get error JANGAN HAPUS
class AddMandorError extends AddMandorState {
  final String message;
  AddMandorError(this.message);

  @override
  List<Object?> get props => [message];
}
