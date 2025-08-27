import 'package:epms_tech/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DropdownPickerSection extends StatelessWidget{
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
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      
    );
  }
}

/*
import 'package:flutter/material.dart';

/// Reusable dropdown picker
class AppDropdown<T> extends StatelessWidget {
  final String? label;                       // Label di atas field
  final String? hint;                        // Hint di dalam field
  final T? value;                            // Nilai terpilih
  final List<T> items;                       // Sumber data
  final String Function(T) itemLabel;        // Cara menampilkan teks item
  final ValueChanged<T?> onChanged;          // Callback saat berubah
  final String? Function(T?)? validator;     // Validator untuk Form
  final bool isExpanded;                     // Lebarkan konten
  final bool enabled;                        // Enable/disable field
  final bool isLoading;                      // Tampilkan loading state
  final Widget? prefixIcon;                  // Icon di kiri
  final EdgeInsets contentPadding;           // Padding konten

  const AppDropdown({
    Key? key,
    required this.items,
    required this.itemLabel,
    required this.onChanged,
    this.value,
    this.label,
    this.hint,
    this.validator,
    this.isExpanded = true,
    this.enabled = true,
    this.isLoading = false,
    this.prefixIcon,
    this.contentPadding = const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final effectiveItems = isLoading
        ? <DropdownMenuItem<T>>[]
        : items
            .map((e) => DropdownMenuItem<T>(
                  value: e,
                  child: Text(itemLabel(e)),
                ))
            .toList();

    return DropdownButtonFormField<T>(
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
        suffixIcon: isLoading
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
    );
  }
}

 */

/*
class ExamplePage extends StatefulWidget {
  const ExamplePage({Key? key}) : super(key: key);

  @override
  State<ExamplePage> createState() => _ExamplePageState();
}

class _ExamplePageState extends State<ExamplePage> {
  final _formKey = GlobalKey<FormState>();

  // Misal: list unit/bagian
  final units = const ['Estate', 'Mill', 'Workshop', 'HR'];

  String? selectedUnit;
  bool loadingUnits = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dropdown Picker Example')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              AppDropdown<String>(
                label: 'Business Unit',
                hint: 'Pilih unit',
                items: units,
                value: selectedUnit,
                isLoading: loadingUnits,
                itemLabel: (s) => s, // cara menampilkan teks item
                prefixIcon: const Icon(Icons.apartment),
                validator: (v) => v == null ? 'Wajib dipilih' : null,
                onChanged: (v) => setState(() => selectedUnit = v),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // submit
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Unit: $selectedUnit')),
                    );
                  }
                },
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

 */