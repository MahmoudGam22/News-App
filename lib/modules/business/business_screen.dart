// ignore_for_file: unused_import

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/shared/components/components.dart';
import 'package:news/shared/cubit/cubit.dart';
import 'package:news/shared/cubit/states.dart';

class BusinessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<Newscubit,Newsstates>(
      listener: (context, state) {},
      builder:(context,state){
        var list=Newscubit.get(context).business;
        
        return articlebuilder(list,context);
  }
    );
  }
}
