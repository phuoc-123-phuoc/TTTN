import 'package:flutter/material.dart';
import 'package:multi_store_app/core.dart';

class MyStore extends StatelessWidget {
  const MyStore({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppBarTitle(
          title: 'My Store',
        ),
        leading: const AppBarBackButton(),
      ),
    );
  }
}
