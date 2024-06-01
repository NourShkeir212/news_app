import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../layout/cubit/cubit.dart';
import '../../layout/cubit/states.dart';
import '../../shared/components/components.dart';



class BusinessScreen extends StatelessWidget {
  const BusinessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppNewsCubit, AppNewsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = AppNewsCubit.get(context);
          return handleTheConditionsToBuildTheScreen(state: state, model: cubit.businessModel);
        }
    );
  }
}


