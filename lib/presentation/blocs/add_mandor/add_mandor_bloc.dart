import 'package:epms_tech/domain/entities/gang_allotment.dart';
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
    on<LoadMandorScreenData>(_onLoadMandorScreenData);
  }

  Future<void> _onLoadMandorScreenData(
    LoadMandorScreenData event,
    Emitter<AddMandorState> emit,
  ) async {
    try {
      emit(AddMandorLoading());
      final listMandor = await masterDataRepository.getUserAssignment();
      final List<GangAllotment> initGangAllotment = [
        GangAllotment(
          gangAllotmentId: DateTime.now().millisecondsSinceEpoch.toString(),
          gangAllotmentMandorEmployeeCode: '',
          gangAllotmentMandorEmployeeName: '',
        ),
      ];

      emit(AddMandorLoaded(listMandor: listMandor, gangAllotment: initGangAllotment));
    } catch (e) {
      print('Error ${e.toString()}');
      emit(AddMandorError(e.toString()));
    }
  }
}
