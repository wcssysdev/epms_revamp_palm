// import 'package:flutter/cupertino.dart';
import 'package:epms_tech/core/theme/app_colors.dart';
import 'package:epms_tech/core/theme/app_text_style.dart';
import 'package:epms_tech/presentation/blocs/add_mandor/add_mandor_bloc.dart';
import 'package:epms_tech/presentation/blocs/add_mandor/add_mandor_event.dart';
import 'package:epms_tech/presentation/blocs/add_mandor/add_mandor_state.dart';
import 'package:epms_tech/presentation/widgets/dropdown_search_row.dart';
import 'package:epms_tech/presentation/widgets/logo_section.dart';
import 'package:epms_tech/presentation/widgets/outline_icon_button.dart';
import 'package:epms_tech/presentation/widgets/submit_button_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddMandorScreen extends StatefulWidget {
  const AddMandorScreen({super.key});

  @override
  State<AddMandorScreen> createState() => _AddMandorScreenState();
}

class _AddMandorScreenState extends State<AddMandorScreen> {
  List<String?> selectedMandor = [];

  @override
  void initState() {
    super.initState();
    context.read<AddMandorBloc>().add(LoadMandorScreenData());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AddMandorBloc, AddMandorState>(
        builder: (context, state)  {
          if (state is AddMandorLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is AddMandorLoaded)  {
            final mandors = state.listMandor;
            print('++==+ $mandors');
            /*
            [
              {mandorId: 43898, profileName: ESTATE A, mandorEmployeeCode: 00/00EA/1114/122, mandorEmployeeName: FLORIANUS JEMADU, employeeCode: 00/00EA/0120/1130, employeeName: YOSEPH SABULON}, 
              {mandorId: 43901, profileName: ESTATE A, mandorEmployeeCode: 00/00EA/0521/1901, mandorEmployeeName: THOMAS AQUINO KELU, employeeCode: 00/00EA/0120/1135, employeeName: SERGIUS KOMI}, 
              {mandorId: 43902, profileName: ESTATE A, mandorEmployeeCode: 00/00EA/0812/162, mandorEmployeeName: URBANUS SARENG, employeeCode: 00/00EA/0120/1139, employeeName: CLEMENS KAUT KANIMU}, 
              {mandorId: 43903, profileName: ESTATE A, mandorEmployeeCode: 00/00EA/0814/199, mandorEmployeeName: SUKIRNO, employeeCode: 00/00EA/0120/1146, employeeName: DEKI KINDEM},
             */
          } else if (state is AddMandorError) {
            return Center(child: Text('Error: ${state.message}'));
          }

          return Padding(
            padding: EdgeInsetsGeometry.all(24),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  LogoSection(),
                  SizedBox(height: 16),
                  Text('Mandor Setup', style: AppTextStyles.screenTitle),
                  SizedBox(height: 24),
                  OutlineIconButton(
                    icon: Text(
                      "+",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primary,
                      ),
                    ),
                    label: "Add Mandor",
                    onPressed: () {
                      setState(() {
                        selectedMandor.add(null);
                      });
                    },
                    borderColor: AppColors.primary,
                    outlineHeight: 40,
                  ),
                  SizedBox(height: 24),
                  ...List.generate(selectedMandor.length, (index) {
                    return Padding(
                      padding: EdgeInsets.only(bottom: 16),
                      child: Row(
                        children: [
                          Expanded(
                            child: DropdownSearchRow(
                              key: ValueKey(
                                index.toString() +
                                    (selectedMandor[index] ?? ""),
                              ),
                              items: ['A', 'B', 'C', 'D', 'E'],
                              value: selectedMandor[index],
                              onChanged: (val) {
                                if (val == null) return;
                                bool isDuplicate = selectedMandor
                                    .where((e) => e != null)
                                    .contains(val);
                                if (isDuplicate &&
                                    val != selectedMandor[index]) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Mandor $val sudah dipilih!',
                                      ),
                                      backgroundColor: AppColors.red,
                                      duration: Duration(seconds: 2),
                                    ),
                                  );
                                  Future.delayed(Duration.zero, () {
                                    setState(() {
                                      selectedMandor[index] = null;
                                    });
                                  });
                                  return;
                                }
                                setState(() {
                                  selectedMandor[index] = val;
                                });
                              },
                              onSearch: () {
                                print('search mandor $selectedMandor');
                              },
                            ),
                          ),
                          if (selectedMandor[index] != null)
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  selectedMandor.removeAt(index);
                                });
                              },
                              icon: Icon(Icons.delete, color: AppColors.red),
                            ),
                        ],
                      ),
                    );
                  }),

                  SizedBox(height: 20),
                  SubmitButtonSection(label: "SAVE", onPressed: () {}),
                  selectedMandor.isEmpty
                      ? Text(
                        "Please select Mandor!",
                        style: TextStyle(color: AppColors.red),
                      )
                      : Text(
                        'Selected Mandor: ${selectedMandor.where((e) => e != null).join(",")}',
                      ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

/*
note BLoC
saat masuk screen add_mandor_screen.dart
  GET DATA
  T_User_Assignment_Schema = data
    list_mandor = data 
  T_Gang_Allotment_Schema = data   

  add_mandor_event == aktifitas user / system
  
  1. add_mandor_event.dart
  abstract parent class -> get props => []
  class untuk LoadData saat pertama kali terrender
  2. add_mandor_state

 */
