import 'package:flutter/material.dart';

class NoNetworkCard extends StatelessWidget {
  const NoNetworkCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('No Internet Connection!'));
  }
}
