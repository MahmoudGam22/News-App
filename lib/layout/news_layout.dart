// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/modules/search/search_screen.dart';
import 'package:news/shared/components/components.dart';
import 'package:news/shared/cubit/cubit.dart';
import 'package:news/shared/cubit/states.dart';
import 'package:news/shared/network/remote/dio_helper.dart';

class NewsLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<Newscubit, Newsstates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = Newscubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text('News App'),
              actions: [
                IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    navigateto(context, Search_Screen());
                  },
                ),
              IconButton(
                  icon: Icon(Icons.dark_mode),
                  onPressed: () {
                    Newscubit.get(context).changeapptheme();
                  },
                ),
              ],
            ),
            body: cubit.screens[cubit.currentidex],
            bottomNavigationBar: BottomNavigationBar(
              items: cubit.bottomitems,
              currentIndex: cubit.currentidex,
              onTap: (index) {
                cubit.changebottomNavbar(index);
              },
            ),
          );
        });
  }
}
