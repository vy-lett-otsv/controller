import 'package:flutter/material.dart';
import 'package:https/viewmodels/home_view_model.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final HomeViewModel _homeViewModel = HomeViewModel();

  @override
  void initState() {
    _homeViewModel.onInitView(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _homeViewModel,
      child: Consumer<HomeViewModel>(
        builder: (_, viewModel, __) {
          return Scaffold(
            body: viewModel.labels.isEmpty
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.separated(
                    itemBuilder: (BuildContext context, int index) {
                      return Text(viewModel.labels[index].name);
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const Divider(color: Colors.black26);
                    },
                    itemCount: viewModel.labels.length),
          );
        },
      ),
    );
  }
}
