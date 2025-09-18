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
    on<UpdateMandorPicker>(_onUpdateMandorPicker);
    on<DeleteMandorSelected>(_onDeleteMandorSelected);
    on<IconSearchClicked>(_onIconSearchClicked);
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
      final parentState = state;

      emit(
        AddMandorLoaded(
          listMandor: mandorSorted,
          gangAllotment: initGangAllotment,
          mandorSelected: parentState.mandorSelected,
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
      final parentState = state;
      pickers.add(defaultValue);
      emit(
        MandorPickerSet(
          listMandor: currentState.listMandor,
          mandorPickerList: pickers,
          mandorSelected: parentState.mandorSelected,
        ),
      );
    } else if (state is AddMandorLoaded) {
      final currentState = state as AddMandorLoaded;
      final parentState = state;

      final picker = [
        currentState.listMandor.isNotEmpty
            ? currentState.listMandor.first.employeeName
            : null,
      ];
      emit(
        MandorPickerSet(
          listMandor: currentState.listMandor,
          mandorPickerList: picker,
          mandorSelected: parentState.mandorSelected,
        ),
      );
    }
  }

  Future<void> _onUpdateMandorPicker(
    UpdateMandorPicker event,
    Emitter<AddMandorState> emit,
  ) async {
    if (state is MandorPickerSet) {
      final currentState = state as MandorPickerSet;

      final updatedPickers = List<String?>.from(currentState.mandorPickerList);
      updatedPickers[event.index] = event.selectedName;
      final selectedMandor = currentState.listMandor.firstWhere(
        (e) => e.mandorEmployeeName == event.selectedName,
        orElse:
            () => UserAssignment(
              mandorId: 0,
              profileName: '',
              mandorEmployeeCode: '',
              mandorEmployeeName: '',
              employeeCode: '',
              employeeName: '',
            ),
      );

      late final gangAllotment = GangAllotment(
        gangAllotmentId: DateTime.now().microsecondsSinceEpoch.toString(),
        gangAllotmentMandorEmployeeCode: selectedMandor.mandorEmployeeCode,
        gangAllotmentMandorEmployeeName: selectedMandor.mandorEmployeeName,
      );

      final mandorSelectedList = List<GangAllotment>.from(
        currentState.mandorSelected,
      );
      if (mandorSelectedList.isNotEmpty &&
          (event.index < mandorSelectedList.length)) {
        final alreadyExist = mandorSelectedList.any(
          (item) =>
              item.gangAllotmentMandorEmployeeCode ==
              gangAllotment.gangAllotmentMandorEmployeeCode,
        );
        if (alreadyExist) {
          final String message =
              '${gangAllotment.gangAllotmentMandorEmployeeName} is already existed';

          updatedPickers.removeAt(event.index);
          mandorSelectedList.removeAt(event.index);

          emit(AddMandorError(message));
          emit(
            MandorPickerSet(
              listMandor: currentState.listMandor,
              mandorPickerList: updatedPickers,
              mandorSelected: mandorSelectedList,
            ),
          );
        } else {
          mandorSelectedList[event.index] = gangAllotment;
          emit(
            MandorPickerSet(
              listMandor: currentState.listMandor,
              mandorPickerList: updatedPickers,
              mandorSelected: mandorSelectedList,
            ),
          );
        }
      } else {
        final alreadyExist = mandorSelectedList.any(
          (item) =>
              item.gangAllotmentMandorEmployeeCode ==
              gangAllotment.gangAllotmentMandorEmployeeCode,
        );
        if (alreadyExist && mandorSelectedList.isNotEmpty) {
          updatedPickers.removeAt(event.index);
          final String message =
              '${gangAllotment.gangAllotmentMandorEmployeeName} already existed';

          emit(AddMandorError(message));
          emit(
            MandorPickerSet(
              listMandor: currentState.listMandor,
              mandorPickerList: updatedPickers,
              mandorSelected: mandorSelectedList,
            ),
          );
        } else {
          mandorSelectedList.add(gangAllotment);
          emit(
            MandorPickerSet(
              listMandor: currentState.listMandor,
              mandorPickerList: updatedPickers,
              mandorSelected: mandorSelectedList,
            ),
          );
        }
      }
    }
  }

  Future<void> _onDeleteMandorSelected(
    DeleteMandorSelected event,
    Emitter<AddMandorState> emit,
  ) async {
    final currentState = state as MandorPickerSet;
    final parentState = state;
    final updatedMandorPickerList = List<String?>.from(
      currentState.mandorPickerList,
    );
    final updatedMandorSelected = parentState.mandorSelected;

    updatedMandorPickerList.removeAt(event.index);
    updatedMandorSelected.removeAt(event.index);

    emit(
      MandorPickerSet(
        listMandor: currentState.listMandor,
        mandorPickerList: updatedMandorPickerList,
        mandorSelected: updatedMandorSelected,
      ),
    );
  }

  _onIconSearchClicked(IconSearchClicked event, Emitter<AddMandorState> emit) {
    final currentState = state as MandorPickerSet;
    print('index picker =${event.index}');
    emit(IconSearchClickedState(showPopup: true, index: event.index));
    emit(
      MandorPickerSet(
        listMandor: currentState.listMandor,
        mandorPickerList: currentState.mandorPickerList,
        mandorSelected: currentState.mandorSelected,
      ),
    );
  }
}
