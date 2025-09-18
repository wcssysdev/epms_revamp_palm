import 'package:epms_tech/core/theme/app_colors.dart';
import 'package:epms_tech/core/theme/app_text_style.dart';
import 'package:epms_tech/core/utils/snackbar_ui.dart';
import 'package:epms_tech/domain/entities/user_assignment.dart';
import 'package:epms_tech/presentation/blocs/add_mandor/add_mandor_bloc.dart';
import 'package:epms_tech/presentation/blocs/add_mandor/add_mandor_event.dart';
import 'package:epms_tech/presentation/blocs/add_mandor/add_mandor_state.dart';
import 'package:epms_tech/presentation/widgets/logo_section.dart';
import 'package:epms_tech/presentation/widgets/complex/mandor_picker_section.dart';
import 'package:epms_tech/presentation/widgets/outline_icon_button.dart';
import 'package:epms_tech/presentation/widgets/submit_button_section.dart';
import 'package:epms_tech/presentation/widgets/text_pressable_section.dart';
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
    context.read<AddMandorBloc>().add(LoadMandorList());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(0),
        child: Column(
          children: [
            BlocListener<AddMandorBloc, AddMandorState>(
              listener: (context, state) {
                if (state is AddMandorError) {
                  showErrorSnackbar(context, state.message);
                }
              },
              child: BlocBuilder<AddMandorBloc, AddMandorState>(
                // child
                builder: (context, state) {
                  List<UserAssignment> mandorList = [];
                  List<String?> mandorPickerList = [];
                  if (state is AddMandorLoading) {// sate
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is AddMandorLoaded) {
                    mandorList = state.listMandor;
                    mandorPickerList = [];
                    final gangAllotment = state.gangAllotment;
                  } else if (state is MandorPickerSet) {
                    mandorList = state.listMandor; // tetap bawa listMandor
                    mandorPickerList = state.mandorPickerList;
                  }

                  return Padding(
                    padding: EdgeInsetsGeometry.all(24),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          LogoSection(),
                          SizedBox(height: 16),
                          Text(
                            'Mandor Setup',
                            style: AppTextStyles.screenTitle,
                          ),
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
                            onPressed:
                                () => context.read<AddMandorBloc>().add(
                                  ClickAddButton(),
                                ),
                            borderColor: AppColors.primary,
                            outlineHeight: 40,
                          ),
                          SizedBox(height: 24),

                          MandorPickerSection(
                            mandorList: mandorList,
                            mandorPickerList: mandorPickerList,
                          ),

                          SizedBox(height: 20),
                          SubmitButtonSection(label: "SAVE", onPressed: () {}),
                          TextPressableSection(
                            label: 'cek go',
                            onPressed: () {
                              print(state.mandorSelected);
                              print(state.mandorSelected.length);
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
