import 'package:epms_tech/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class DropdownSearchRow extends StatelessWidget {
  final List<String> items;
  final String? value;
  final ValueChanged<String?> onChanged;
  final VoidCallback onSearch;
  final VoidCallback? onDelete;
  final bool showDelete;

  const DropdownSearchRow({
    super.key,
    required this.items,
    required this.value,
    required this.onChanged,
    required this.onSearch,
    this.onDelete,
    this.showDelete = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: DropdownButtonFormField<String>(
            value: items.contains(value) ? value : null,
            isExpanded: true,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 10,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            items:
                items.map((e) {
                  return DropdownMenuItem<String>(value: e, child: Text(e));
                }).toList(),
            onChanged: onChanged,
          ),
        ),

        SizedBox(width: 8),
        IconButton(
          onPressed: onSearch,
          icon: Icon(Icons.search, color: AppColors.primary),
        ),
        if (showDelete && onDelete != null)
          IconButton(
            onPressed: onDelete,
            icon: Icon(Icons.close, color: AppColors.red),
          ),
      ],
    );
  }
}
