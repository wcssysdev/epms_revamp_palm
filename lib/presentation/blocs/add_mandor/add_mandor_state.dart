import 'package:epms_tech/domain/entities/user_assignment.dart';
import 'package:equatable/equatable.dart';

/*
GET
  T_User_Assignment_Schema = data
    list_mandor = data 
  T_Gang_Allotment_Schema = data
    if data = 0
      gangAllotment: [{           
          gang_allotment_id: Math.floor(Date.now() / 100),
          gang_allotment_mandor_employee_code: "",
          gang_allotment_mandor_employee_name: ""
      }]
    else 
      gangAllotment: data.map(x => (
          {
              gang_allotment_id: x.gang_allotment_id,
              gang_allotment_mandor_employee_code: x.gang_allotment_mandor_employee_code,
              gang_allotment_mandor_employee_name: x.gang_allotment_mandor_employee_name
          }
      ))

 */

abstract class AddMandorState extends Equatable {
  @override
  List<Object?> get props => [];
}
// kelas dasar / parent tapi tidak bisa langsung create object  JANGAN HAPUS
// equatable = BANDING 2 OBJECT =bila ada data baru yang sama (sumber dari child) maka data di parent tidak akan terupadate
// props => [] ; parent menyediakan kerangka kosong []
// kondisi = Initial, Loading, success/ data, error

// 1. Saat belum ada aksi JANGAN HAPUS
class AddMandorInitial extends AddMandorState {}

// 2. Saat proses GET DATA JANGAN HAPUS
class AddMandorLoading extends AddMandorState{}

// 3. saat data berhasil di dapat JANGAN HAPUS
class AddMandorLoaded extends AddMandorState{
  final List<UserAssignment> listMandor;

  AddMandorLoaded({
    required this.listMandor,
  });

  @override 
  List<Object?> get props => [listMandor];
}

// 4. Misal saat Get error JANGAN HAPUS
class AddMandorError extends AddMandorState {
  final String message;
  AddMandorError(this.message);

  @override
  List<Object?> get props => [message];
}
