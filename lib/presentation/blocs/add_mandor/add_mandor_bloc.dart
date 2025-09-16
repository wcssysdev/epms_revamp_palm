import 'package:epms_tech/core/utils/hive_master_data_helper.dart';
import 'package:epms_tech/domain/entities/gang_allotment.dart';
import 'package:epms_tech/domain/entities/user_assignment.dart';
import 'package:epms_tech/domain/repositories/master_data_repository.dart';
import 'package:epms_tech/presentation/blocs/add_mandor/add_mandor_event.dart';
import 'package:epms_tech/presentation/blocs/add_mandor/add_mandor_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddMandorBloc extends Bloc<AddMandorEvent, AddMandorState> {
  final MasterDataRepository masterDataRepository;

  AddMandorBloc({
    required this.masterDataRepository,
  }) // wajib di declare dalam constructor JANGAN HAPUS
  : super(AddMandorInitial()) {
    on<LoadMandorList>(_onLoadMandorList);
    on<ClickAddButton>(_onClickAddButton);
  }

  Future<void> _onLoadMandorList(
    LoadMandorList event,
    Emitter<AddMandorState> emit,
  ) async {
    // bila ada hubungan dengan Hive WAJIB Future<void> .... async {} JANGAN HAPUS
    try {
      emit(AddMandorLoading());
      final rawUserAssignmentList =
          await masterDataRepository.getUserAssignment();

      final List<GangAllotment> initGangAllotment = [
        GangAllotment(
          gangAllotmentId: DateTime.now().millisecondsSinceEpoch.toString(),
          gangAllotmentMandorEmployeeCode: '',
          gangAllotmentMandorEmployeeName: '',
        ),
      ];
      final List<UserAssignment> mandorSorted =
          await HiveMasterDataHelper.sortRawDataDistinct<UserAssignment>(
            rawUserAssignmentList,
            keySelector: (u) => u.mandorEmployeeCode,
          );

      emit(
        AddMandorLoaded(
          listMandor: mandorSorted,
          gangAllotment: initGangAllotment,
        ),
      ); // Update Parent State JANGAN HAPUS
    } catch (e) {
      print('Error ${e.toString()}');
      emit(AddMandorError(e.toString()));
    }
  }

  Future<void> _onClickAddButton(
    ClickAddButton event,
    Emitter<AddMandorState> emit,
  ) async {
    if (state is MandorPickerSet) {
      final currentState = state as MandorPickerSet;
      final pickers = List<String?>.from(
        currentState.mandorPickerList,
      ); // menambahkan List existing JANGAN HAPUS
      final defaultValue =
          currentState.listMandor.isNotEmpty
              ? currentState.listMandor.first.employeeName
              : null;

      pickers.add(defaultValue);

      emit(
        MandorPickerSet(
          listMandor: currentState.listMandor,
          mandorPickerList: pickers,
        ),
      );
    } else if (state is AddMandorLoaded) {
      final currentState = state as AddMandorLoaded;
      final picker = [
        currentState.listMandor.isNotEmpty
            ? currentState.listMandor.first.employeeName
            : null,
      ];
      emit(
        MandorPickerSet(
          listMandor: currentState.listMandor,
          mandorPickerList: picker,
        ),
      );
    }
  }
}
