import 'package:flutter/material.dart';

class IssueWidget extends StatelessWidget {
  final Function onRefresh;
  const IssueWidget({Key? key,required this.onRefresh}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
      const Icon(Icons.wifi_tethering_error_rounded_outlined),
      ElevatedButton(onPressed: () => onRefresh(), child:const Text('Refresh'))
    ]);
  }
}
