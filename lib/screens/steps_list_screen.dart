import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:kearun/blocs/steps/steps_list_bloc.dart';
import 'package:kearun/blocs/steps/steps_list_event.dart';
import 'package:kearun/blocs/steps/steps_list_state.dart';
import 'package:kearun/models/steps.dart';
import 'package:kearun/repositories/sqlite_steps_list_repository.dart';

class StepsListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final stepsListBloc = StepsListBloc(stepsListRepository: SqliteStepsListRepository());
    stepsListBloc.dispatch(StepsListLoad());

    return Scaffold(
      appBar: AppBar(
        title: Text('StepsList!'),
        backgroundColor: Colors.pinkAccent,
      ),
      body: BlocBuilder<StepsListBloc, StepsListState>(
        bloc: stepsListBloc,
        builder: (context, state) {
          if (state is StepsListLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is StepsListLoaded) {
            return StreamBuilder(
              stream: state.stepsList,
              builder: (BuildContext context, AsyncSnapshot<List<Steps>> snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator()
                  );
                }
                if (snapshot.hasError) {
                  return Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text('Failure')
                      ],
                    )
                  );
                }
                return ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                    final steps = snapshot.data[index];
                    return Card(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          ListTile(
                            title: Text(steps.steps.toString())
                          )
                        ],
                      )
                    );
                  },
                  itemCount: snapshot.data.length,
                );
              },
            );
          }
          if (state is StepsListFailure) {
            return Center(
              child: Text('Error')
            );
          }
          return Container();
        },
      )
    );
  }
}