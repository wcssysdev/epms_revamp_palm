import 'package:epms_tech/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DropdownPickerSection<T> extends StatelessWidget {
  final String? label;
  final String? hint;
  final T? value;
  final List<T> items;
  final String Function(T) itemLabel;
  final ValueChanged<T?> onChanged;
  final String? Function(T?)? validator;
  final bool isExpanded;
  final bool enabled;
  final bool isLoading;
  final Widget? prefixIcon;
  final EdgeInsets contentPadding;

  @override
  const DropdownPickerSection({
    super.key,
    required this.items,
    required this.itemLabel,
    required this.onChanged,
    this.value,
    this.label,
    this.hint,
    this.validator,
    this.isExpanded = true,
    this.enabled = false,
    this.isLoading = false,
    this.prefixIcon,
    this.contentPadding = const EdgeInsets.symmetric(
      horizontal: 12,
      vertical: 12,
    ),
  });

  @override
  Widget build(BuildContext context) {
    final effectiveItems =
        isLoading
            ? <DropdownMenuItem<T>>[]
            : items
                .map(
                  (el) => DropdownMenuItem<T>(
                    value: el,
                    child: Text(itemLabel(el)),
                  ),
                )
                .toList();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: DropdownButtonFormField<T>(
        value: value,
        items: effectiveItems,
        onChanged: (enabled && !isLoading) ? onChanged : null,
        isExpanded: isExpanded,
        validator: validator,
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          prefixIcon: prefixIcon,
          contentPadding: contentPadding,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          suffixIcon:
              isLoading
                  ? Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    ),
                  )
                  : null,
        ),
      ),
    );
  }
}
