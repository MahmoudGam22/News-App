// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/shared/components/components.dart';
import 'package:news/shared/cubit/cubit.dart';
import 'package:news/shared/cubit/states.dart';

class Search_Screen extends StatelessWidget {
  var searchcontroller = TextEditingController();
    @override
  Widget build(BuildContext context) {
    return BlocConsumer<Newscubit,Newsstates>(
      listener: (context, state) {
      },
      builder:(context, state) { 
        var list = Newscubit.get(context).search;
        return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: defaultff(
                  controller: searchcontroller,
                  kType: TextInputType.text,
                  validate: (value)
                  {
                    if(value!.isEmpty)
                    {
                      return('search must not be empty');
                    }
                    return null;
                  },
                  onChanged: (value){
    Newscubit.get(context).getsearch(value);
                  },
                  label: 'search',
                  prefix: Icon(Icons.search)),
            ),
         Expanded (child: articlebuilder(list, context,isserach: true,)),
          ],
        ),
      );
  },
    );
  }
}
