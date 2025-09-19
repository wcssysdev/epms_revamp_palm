import 'package:epms_tech/core/theme/app_text_style.dart';
import 'package:epms_tech/presentation/widgets/app_bar_section.dart';
import 'package:flutter/material.dart';

class SearchDataScreen extends StatefulWidget {
  const SearchDataScreen({
    super.key,
  });

  @override
  State<SearchDataScreen> createState() => _SearchDataScreenState();
}

class _SearchDataScreenState extends State<SearchDataScreen> {
  late int index = 0;
  late String title = '';
  late String initBLoC = '';
  late TextEditingController textController;
  late ValueChanged<String> onChangedText;

  void _defaultOnChanged(String value) {
    // nothing (noop)
    print('dika ----$initBLoC');
    print('dika ----$textController');
  }

  
  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
    onChangedText = _defaultOnChanged;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args = ModalRoute.of(context)?.settings.arguments as Map?;
    index = args != null && args['index'] != null ? args['index'] as int : 0;
    title = args != null && args['title'] != null ? args['title'] as String : '';
    initBLoC = args != null && args['initBLoC'] != null ? args['initBLoC'] : 'add_mandor';
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarSection(lable: 'Search Data'),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: AppTextStyles.screenTitle24),
            TextField(
              controller: textController,
              onChanged: onChangedText,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                icon: Icon(Icons.supervised_user_circle),
                labelText: 'Enter $title',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
