run build runner
untuk run pertama 
--> flutter packages pub run build_runner build

untuk update existin
--> flutter pub run build_runner watch

===================================================

abstract class AddMandorEvent {}

class LoadMandorData extends AddMandorEvent {}

class AddMandorDropdown extends AddMandorEvent {
  final String mandor;
  AddMandorDropdown(this.mandor);
}

class AddMandorFromSearch extends AddMandorEvent {
  final String mandor;
  AddMandorFromSearch(this.mandor);
}

class DeleteMandor extends AddMandorEvent {
  final int index;
  DeleteMandor(this.index);
}

class SaveMandor extends AddMandorEvent {}
=================================================
abstract class AddMandorState {}

class AddMandorInitial extends AddMandorState {}

class AddMandorLoading extends AddMandorState {}

class AddMandorLoaded extends AddMandorState {
  final List<String> selectedMandor;
  AddMandorLoaded(this.selectedMandor);
}

class AddMandorError extends AddMandorState {
  final String message;
  AddMandorError(this.message);
}

class AddMandorSaved extends AddMandorState {}
============================================
class AddMandorBloc extends Bloc<AddMandorEvent, AddMandorState> {
  final MasterDataRepository repository;

  AddMandorBloc({required this.repository}) : super(AddMandorInitial()) {
    on<LoadMandorData>((event, emit) async {
      emit(AddMandorLoading());
      final data = await repository.getMandorList(); // Hive or API
      emit(AddMandorLoaded([])); // awalnya kosong
    });

    on<AddMandorDropdown>((event, emit) {
      if (state is AddMandorLoaded) {
        final current = List<String>.from((state as AddMandorLoaded).selectedMandor);
        if (!current.contains(event.mandor)) current.add(event.mandor);
        emit(AddMandorLoaded(current));
      }
    });

    on<AddMandorFromSearch>((event, emit) {
      if (state is AddMandorLoaded) {
        final current = List<String>.from((state as AddMandorLoaded).selectedMandor);
        if (!current.contains(event.mandor)) current.add(event.mandor);
        emit(AddMandorLoaded(current));
      }
    });

    on<DeleteMandor>((event, emit) {
      if (state is AddMandorLoaded) {
        final current = List<String>.from((state as AddMandorLoaded).selectedMandor);
        current.removeAt(event.index);
        emit(AddMandorLoaded(current));
      }
    });

    on<SaveMandor>((event, emit) async {
      if (state is AddMandorLoaded) {
        emit(AddMandorLoading());
        final current = (state as AddMandorLoaded).selectedMandor;
        await repository.saveMandor(current); // simpan ke Hive
        emit(AddMandorSaved());
      }
    });
  }
}
==============================================
BlocBuilder<AddMandorBloc, AddMandorState>(
  builder: (context, state) {
    final selectedMandor = state is AddMandorLoaded ? state.selectedMandor : [];

    return Column(
      children: [
        // Add Dropdown dynamically
        ...List.generate(selectedMandor.length, (index) {
          return DropdownSearchRow(
            value: selectedMandor[index],
            items: ['A','B','C','D'],
            onChanged: (val) {
              if (val != null) {
                context.read<AddMandorBloc>().add(AddMandorDropdown(val));
              }
            },
          );
        }),
        OutlineIconButton(
          icon: Text("+"),
          label: "Add Mandor",
          onPressed: () {
            context.read<AddMandorBloc>().add(AddMandorDropdown(''));
          },
        ),
        // Button Save
        ElevatedButton(
          onPressed: () {
            context.read<AddMandorBloc>().add(SaveMandor());
          },
          child: Text('Save'),
        ),
      ],
    );
  },
);
=============================================
masterdatarepository

CEK
abstract class MasterDataRepository {
  Future<List<String>> getMandorList(); // misal return list nama mandor
}

CEK
class MasterDataRepositoryImpl implements MasterDataRepository {
  final Box box; // Hive box

  MasterDataRepositoryImpl({required this.box});

  @override
  Future<List<String>> getMandorList() async {
    final data = box.get('mandorList', defaultValue: <String>[]);
    return List<String>.from(data);
  }
}
========
EVENT
class LoadMandorData extends AddMandorEvent {}

BLoC
class AddMandorBloc extends Bloc<AddMandorEvent, AddMandorState> {
  final MasterDataRepository repository;
  List<String> allMandor = []; // ini untuk items dropdown

  AddMandorBloc({required this.repository}) : super(AddMandorInitial()) {
    on<LoadMandorData>((event, emit) async {
      emit(AddMandorLoading());
      allMandor = await repository.getMandorList(); // ambil dari Hive
      emit(AddMandorLoaded([])); // initial selectedMandor kosong
    });

    // Event lain: AddMandorDropdown, DeleteMandor, SaveMandor ...
  }
}

UI
BlocBuilder<AddMandorBloc, AddMandorState>(
  builder: (context, state) {
    final bloc = context.read<AddMandorBloc>();
    final selectedMandor = state is AddMandorLoaded ? state.selectedMandor : [];

    return Column(
      children: [
        ...List.generate(selectedMandor.length, (index) {
          return DropdownSearchRow(
            value: selectedMandor[index],
            items: bloc.allMandor, // <- ini ambil dari Hive via Bloc
            onChanged: (val) {
              if (val != null) {
                context.read<AddMandorBloc>().add(AddMandorDropdown(val));
              }
            },
          );
        }),
      ],
    );
  },
);
===
=====
