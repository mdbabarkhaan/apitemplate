import 'package:apitemplate/api_modals/postmodel.dart';
import 'package:apitemplate/api_modals/reqresmodel.dart';
import 'package:flutter/material.dart';
import 'package:apitemplate/api_modals/airline_modal.dart';
import 'package:apitemplate/api_services/api_response.dart';
import 'package:apitemplate/base_components/base_widget.dart';
import 'package:apitemplate/providers/home_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      // Provider.of<HomeProvider>(context, listen: false).getAirline();
      // Provider.of<HomeProvider>(context,listen: false).getPosts();
       Provider.of<HomeProvider>(context,listen: false).getReq();
      
      
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _homePro = Provider.of<HomeProvider>(context, listen: false);
    return Scaffold(
        body: Consumer<HomeProvider>(builder: (context, pro, child) {
      return BaseWidget(
        state: pro.reqres,
        onRefresh: () => _homePro.getReq(),
        builder: (context) {
          // List<PlaceHolderModel> users = pro.postRes.data as List<PlaceHolderModel>;
          ReqResmodel users = pro.reqres.data as ReqResmodel;
          return ListView.builder(
            itemCount: users.data!.length,
            itemBuilder: (BuildContext context, int index) {
              print(users.data![index].id);
              return Text('${users.data![index].firstName}');
            },
          );
        },
      );
    }));
  }
}
