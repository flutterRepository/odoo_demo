import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odoo_demo/app/cubits/app_cubit_states.dart';
import 'package:odoo_demo/app/cubits/app_cubits.dart';
import 'package:odoo_demo/presentation/core/others/nav_pages/bar_item_page.dart';
import 'package:odoo_demo/presentation/core/others/nav_pages/detail_page.dart';
import 'package:odoo_demo/presentation/core/others/welcom_page.dart';

class AppCubitLogic extends StatefulWidget {
  const AppCubitLogic({Key? key}) : super(key: key);

  @override
  _AppCubitLogicState createState() => _AppCubitLogicState();
}

class _AppCubitLogicState extends State<AppCubitLogic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AppCubits, AppCubitStates>(
        builder: (context, state) {
          if (state is WelcomeState) {
            return const WelcomePage();
          }
          if (state is LoadingState) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is LoadedState) {
            return const BarItemPage();
          }
          if (state is DetailState) {
            return const DetailPage();
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
