import 'package:flutter/material.dart';
import 'package:multi_store_app/core.dart';

class EditBusiness extends StatelessWidget {
  const EditBusiness({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppBarTitle(
          title: 'EditBusiness',
        ),
        leading: const AppBarBackButton(),
      ),
    );
  }
}
