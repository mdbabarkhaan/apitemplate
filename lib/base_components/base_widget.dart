import 'package:flutter/material.dart';
import 'package:apitemplate/api_services/api_response.dart';
import 'package:apitemplate/base_components/Issue_widget.dart';

class BaseWidget extends StatelessWidget {
  final ApiResponse state;
  final Function? onRefresh;
  final Widget Function(BuildContext) builder;
  const BaseWidget({Key? key, required this.builder, required this.state, this.onRefresh })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (state.status == Status.loading) {
      return const Center(child: CircularProgressIndicator());
    } else if (state.status == Status.error) {
      return  Center(child: IssueWidget(onRefresh: ()=>onRefresh!()));
    } else if (state.status == Status.noInternet || state.status==Status.timeout ) {
      return const Center(child: Text('No Internet'));
    } else if (state.status == Status.unAuthorised) {
      return const Center(child: Text('Un authorized'));
    } else if (state.status == Status.completed) {
      return Builder(builder: builder);
    } else {
      return Container();
    }
  }
}
