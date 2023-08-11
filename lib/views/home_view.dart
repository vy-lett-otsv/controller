import 'package:flutter/material.dart';
import 'package:https/data/label_entity.dart';
import 'package:https/services/navigation_services.dart';
import 'package:https/viewmodels/home_view_model.dart';
import 'package:https/views/time_view.dart';
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
    _homeViewModel.onInit();
    super.initState();
  }

  @override
  void dispose() {
    _homeViewModel.dispose();
    super.dispose();
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
                  : Column(
                      children: [
                        Expanded(
                          child: ListView.separated(
                              itemBuilder: (BuildContext context, int index) {
                                print(viewModel.labels[index].id);
                                print(viewModel.labels[index].toJson());
                                return Text(viewModel.labels[index].name);
                              },
                              separatorBuilder:
                                  (BuildContext context, int index) {
                                return const Divider(color: Colors.black26);
                              },
                              itemCount: viewModel.labels.length),
                        ),
                        TextField(
                          controller: viewModel.textEditingController,
                          focusNode: viewModel.focusNode,
                        ),
                        ElevatedButton(
                            onPressed: () {
                              viewModel.onSetText();
                            },
                            child: const Text('Display text change')),
                        Text(viewModel.text),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ElevatedButton(
                                onPressed: () {
                                  LabelEntity label = LabelEntity(
                                      id: '1', name: 'the', color: '#1FD76D');
                                  viewModel.createLabels(label);
                                  viewModel.fetchProductLabel();
                                },
                                child: const Text("Create")),
                            ElevatedButton(
                                onPressed: () {
                                  LabelEntity label = LabelEntity(
                                      id: '1',
                                      name: 'update',
                                      color: '#1FD76D');
                                  viewModel.updateLabels(label, '648923983c4c470017770923');viewModel.fetchProductLabel();
                                },
                                child: const Text("Update")),
                            ElevatedButton(
                                onPressed: () {
                                  viewModel
                                      .deleteLabels('648923983c4c470017770923');
                                  viewModel.fetchProductLabel();
                                },
                                child: const Text("Delete")),
                          ],
                        ),
                        ElevatedButton(
                            onPressed: () {
                              NavigationServices.instance
                                  .navigateToPermissionScreen(context);
                            },
                            child: const Text("Handle Permissions")),
                        ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => const TimeView()));
                            },
                            child: const Text("TimeView")),
                      ],
                    ));
        },
      ),
    );
  }
}
