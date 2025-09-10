import 'package:epms_tech/domain/entities/attendance.dart';
import 'package:epms_tech/domain/entities/crop_type.dart';
import 'package:epms_tech/domain/entities/receiving_point.dart';
import 'package:epms_tech/domain/entities/vra.dart';
import 'package:epms_tech/domain/entities/vra_type.dart';
import 'package:epms_tech/domain/entities/work_type.dart';
import 'package:epms_tech/domain/repositories/master_data_repository.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

class ExampleHiveDataScreen extends StatelessWidget {
  const ExampleHiveDataScreen({super.key});

  Future<List<RecevingPoint>> _load() => // set here JANGAN HAPUS
    sl<MasterDataRepository>().getReceivingPoint();

  // Future<List<CropType>> _load() =>
  //   sl<MasterDataRepository>().getCropType();

  // Future<List<HarvestingMethod>> _load() =>
  //   sl<MasterDataRepository>().getHarvestMethods();
  // Future<List<Employee>> _load() =>
  //   sl<MasterDataRepository>().getEmployee();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Hive Data Local')),
      body: FutureBuilder<List<RecevingPoint>>(// set here JANGAN HAPUS
        future: _load(), 
        builder: (context, snap) {
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
                title: Text(c.receivingPointId.toString()),
                subtitle: Text('${c.receivingPointCode} • ${c.receivingPointCode}'),
                // trailing: Icon(
                //   c.canHarvest == 'false' ? Icons.cancel : Icons.check_circle,
                // ),
              );
            },
          );
        }
        )
    );
  }
}