import 'package:epms_tech/domain/entities/crop_type.dart';
import 'package:epms_tech/domain/repositories/master_data_repository.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

class ExampleHiveDataScreen extends StatelessWidget {
  const ExampleHiveDataScreen({super.key});

  Future<List<CropType>> _load() =>
    sl<MasterDataRepository>().getCropType();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Crop Types')),
      body: FutureBuilder<List<CropType>>(
        future: _load(), 
        builder: (context, snap) {
          print('*** $snap');
          if (snap.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          final items = snap.data ?? [];
          if (items.isEmpty) {
            return const Center(child: Text('No data'));
          }
          return ListView.separated(
            itemCount: items.length,
            separatorBuilder: (_, __) => const Divider(height: 1),
            itemBuilder: (context, i) {
              final c = items[i];
              return ListTile(
                title: Text(c.cropTypeName),
                subtitle: Text('${c.cropTypeCode} • ${c.description}'),
                trailing: Icon(
                  c.canHarvest == 'false' ? Icons.cancel : Icons.check_circle,
                ),
              );
            },
          );
        }
        )
    );
  }
}