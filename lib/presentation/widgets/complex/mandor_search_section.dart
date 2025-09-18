import 'package:epms_tech/presentation/blocs/add_mandor/add_mandor_bloc.dart';
import 'package:epms_tech/presentation/blocs/add_mandor/add_mandor_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MandorSearchSection extends StatelessWidget {
  final int index;

  const MandorSearchSection({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddMandorBloc, AddMandorState>(
      builder: (context, state) {
        return Column(children: [

          ],
        );
      },
    );
  }
}
/* 
showModalBottomSheet(
  context: context,
  isScrollControlled: true,
  builder: (context) {
    return DraggableScrollableSheet(
      expand: false,
      builder: (_, controller) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Cari Mandor...",
                  prefixIcon: Icon(Icons.search),
                ),
                onChanged: (query) {
                  // filter list pakai BLoC atau setState
                },
              ),
            ),
            Expanded(
              child: ListView.builder(
                controller: controller,
                itemCount: mandorList.length,
                itemBuilder: (_, index) {
                  return ListTile(
                    title: Text(mandorList[index].mandorEmployeeName),
                    onTap: () {
                      Navigator.pop(context, mandorList[index]);
                    },
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  },
);


*/