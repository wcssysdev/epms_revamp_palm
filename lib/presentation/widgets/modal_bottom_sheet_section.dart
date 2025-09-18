import 'package:epms_tech/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class ModalBottomSheetSection extends StatelessWidget {
  final int index;
  final String bottomSheetTitle;
  final String placeholderTitle;

  const ModalBottomSheetSection({
    super.key,
    required this.index,
    required this.bottomSheetTitle,
    required this.placeholderTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.primary, width: 2.0),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: ListView(
        children: <Widget>[
          ListTile(title: Text(bottomSheetTitle)),
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              icon: Icon(Icons.supervised_user_circle),
              labelText: placeholderTitle,
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: ElevatedButton.icon(
              icon: const Icon(Icons.save),
              label: const Text('Save and close'),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ],
      ),
    );
  }
}
