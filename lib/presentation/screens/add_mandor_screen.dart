// import 'package:flutter/cupertino.dart';
import 'package:epms_tech/core/theme/app_colors.dart';
import 'package:epms_tech/core/theme/app_text_style.dart';
import 'package:epms_tech/domain/entities/user_assignment.dart';
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

  @override
  void initState() {
    super.initState();
    context.read<AddMandorBloc>().add(LoadMandorList());// nama event
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AddMandorBloc, AddMandorState>(
        builder: (context, state)  {
          List<UserAssignment> mandorList = [];
          List<String?> mandorPickerList = [];
          if (state is AddMandorLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is AddMandorLoaded) {
            mandorList = state.listMandor;
            final gangAllotment = state.gangAllotment;

          } else if (state is MandorPickerSet) {
            mandorPickerList = state.mandorPickerList;
          }
           else if (state is AddMandorError) {
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
                    onPressed: () => context.read<AddMandorBloc>().add(ClickAddButton()),
                    borderColor: AppColors.primary,
                    outlineHeight: 40,
                  ),

                  SizedBox(height: 24),

                  ...List.generate(mandorPickerList.length, (index) {
                    return Padding(
                      padding: EdgeInsets.only(bottom: 16),
                      child: Row(
                        children: [
                          Expanded(
                            child: DropdownSearchRow(
                              key: ValueKey(
                                index.toString() +
                                    (mandorPickerList[index] ?? ""),
                              ),
                              items: mandorList
                                    .map((e) => e.mandorEmployeeName)
                                    .toList(),
                              value: mandorPickerList[index],
                              onChanged: (val) {
                                if (val == null) return;
                                bool isDuplicate = mandorPickerList
                                    .where((e) => e != null)
                                    .contains(val);
                                if (isDuplicate &&
                                    val != mandorPickerList[index]) {
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
                                      mandorPickerList[index] = null;
                                    });
                                  });
                                  return;
                                }
                                setState(() {
                                  mandorPickerList[index] = val;
                                });
                              },
                              onSearch: () {
                                print('search mandor $mandorPickerList');
                              },
                            ),
                          ),
                          if (mandorPickerList[index] != null)
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  mandorPickerList.removeAt(index);
                                });
                              },
                              icon: Icon(Icons.delete, color: AppColors.red),
                            ),
                        ],
                      ),
                    );
                  }),

                  SizedBox(height: 20),

                  SubmitButtonSection(
                    label: "SAVE", 
                    onPressed: () {}
                    ),

                  mandorPickerList.isEmpty
                      ? Text(
                        "Please select Mandor!",
                        style: TextStyle(color: AppColors.red),
                      )
                      : Text(
                        'Selected Mandor: ${mandorPickerList.where((e) => e != null).join(",")}',
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
