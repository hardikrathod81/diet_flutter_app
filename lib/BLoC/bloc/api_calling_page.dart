import 'package:diet_app/BLoC/bloc/bloc/api_calling_bloc.dart';
import 'package:diet_app/widgets/app_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ApiCallingPage extends StatelessWidget {
  const ApiCallingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<ApiCallingBloc, ApiCallingState>(
          builder: (context, state) {
            if (state is ApiCallingLoadingState) {
              return const Center(child: CircularProgressIndicator.adaptive());
            } else if (state is ApiCallingLoadedState) {
              return RefreshIndicator(
                onRefresh: () async {
                  BlocProvider.of<ApiCallingBloc>(context)
                      .add(RefreshLoded() as ApiCallingEvent);
                },
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: state.postmodel.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              const TextWidget(text: 'id ='),
                              TextWidget(
                                  text: state.postmodel[index].id.toString()),
                            ],
                          ),
                          Row(
                            children: [
                              const TextWidget(text: 'userid ='),
                              TextWidget(
                                  text:
                                      state.postmodel[index].userId.toString()),
                            ],
                          ),
                          Row(
                            children: [
                              const TextWidget(text: 'title ='),
                              Flexible(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextWidget(
                                      text: state.postmodel[index].title
                                          .toString()),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              );
            } else if (state is ApiCallingErrorState) {
              return Center(child: Text("Error: ${state.error}"));
            } else {
              return const Center(child: Text("Check Code"));
            }
          },
        ),
      ),
    );
  }
}
