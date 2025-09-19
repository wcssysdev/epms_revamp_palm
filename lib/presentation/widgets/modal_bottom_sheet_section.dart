import 'package:epms_tech/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class ModalBottomSheetSection extends StatelessWidget {
  final int index;
  final String bottomSheetTitle;
  final String placeholderTitle;
  final TextEditingController inputTextController;
  final ValueChanged<String> onChanged;

  const ModalBottomSheetSection({
    super.key,
    required this.index,
    required this.bottomSheetTitle,
    required this.placeholderTitle,
    required this.inputTextController,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
      height: 350,
      padding: EdgeInsets.only(left: 8, right: 16, bottom: 16),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.primary, width: 2.0),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(title: Text(bottomSheetTitle)),
          TextField(
            controller: inputTextController,
            onChanged: onChanged,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              icon: Icon(Icons.supervised_user_circle),
              labelText: placeholderTitle,
            ),
          ),
          const SizedBox(height: 16),
          Container(
            alignment: Alignment.center,
            child: ElevatedButton.icon(
              icon: const Icon(Icons.save),
              label: const Text('Save and close'),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ],
      )
    ),
    );
  }
}
