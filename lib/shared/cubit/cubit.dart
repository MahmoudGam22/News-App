import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/modules/business/business_screen.dart';
import 'package:news/modules/science/scienc_screen.dart';
import 'package:news/modules/sports/sport_screen.dart';
import 'package:news/shared/cubit/states.dart';
import 'package:news/shared/network/local/cashe_helper.dart';
import 'package:news/shared/network/remote/dio_helper.dart';

class Newscubit extends Cubit<Newsstates> {
  Newscubit() : super(Newsinitialstate());
  static Newscubit get(context) => BlocProvider.of(context);
  int currentidex = 0;
  bool isDark = true;
  List<BottomNavigationBarItem> bottomitems = [
    BottomNavigationBarItem(
      icon: Icon(Icons.business),
      label: 'Business',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.sports),
      label: 'Sports',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.science_outlined),
      label: 'Science',
    ),
  ];
  List<Widget> screens = [
    BusinessScreen(),
    SportScreen(),
    ScienceScreen(),
  ];
  void changebottomNavbar(int index) {
    currentidex = index;
    if (index == 1) {
      getsport();
    }
    if (index == 2) getscience();
    emit(NewsbottomNav());
  }

  void changeapptheme({bool? fromshared}) {
    if (fromshared != null) {
      isDark = fromshared;
      emit(Themechangeapp());
    } else {
      isDark = !isDark;
      Cashe_Helper.putbool(key: 'isDark', value: isDark).then((value) {
        emit(Themechangeapp());
      });
    }
  }
  List<dynamic> search = [];
   void getsearch(String value) {
    emit(Newssearchloadingstate());
    search=[];
   DioHelper.GetData(url: 'v2/everything', query: {
        'q': '$value',
        'apiKey': '131154b9d1204b14913eee758ed6d3ea'
      }).then((value) {
        search = value.data['articles'];
        emit(Newsgetsearchsuccessstate());
      }).catchError((error) {
        print(error.toString());
        emit(Newsgetsearcherrorstate(error));
      });
  }
  List<dynamic> business = [];
  void getBusiness() {
    emit(Newsbussinessloadingstate());
    DioHelper.GetData(url: 'v2/top-headlines', query: {
      'country': 'us',
      'category': 'business',
      'apiKey': '131154b9d1204b14913eee758ed6d3ea'
    }).then((value) {
      business = value.data['articles'];
      print(business[0]['title']);
      emit(Newsgetbusinesssuccessstate());
    }).catchError((error) {
      print(error.toString());
      emit(Newsgetbusinesserrorstate(error));
    });
  }

  List<dynamic> sport = [];
  void getsport() {
    if (sport.length == 0) {
      emit(Newssportloadingstate());
      DioHelper.GetData(url: 'v2/top-headlines', query: {
        'country': 'us',
        'category': 'sports',
        'apiKey': '131154b9d1204b14913eee758ed6d3ea'
      }).then((value) {
        sport = value.data['articles'];
        emit(Newsgetsportsuccessstate());
      }).catchError((error) {
        print(error.toString());
        emit(Newsgetsporterrorstate(error));
      });
    } else {
      emit(Newsgetsportsuccessstate());
    }
  }

  List<dynamic> science = [];
  void getscience() {
    if (science.length == 0) {
      emit(Newsscienceloadingstate());
      DioHelper.GetData(url: 'v2/top-headlines', query: {
        'country': 'us',
        'category': 'science',
        'apiKey': '131154b9d1204b14913eee758ed6d3ea'
      }).then((value) {
        science = value.data['articles'];
        emit(Newsgetsciencesuccessstate());
      }).catchError((error) {
        print(error.toString());
        emit(Newsgetscienceerrorstate(error));
      });
    } else {
      emit(Newsgetsciencesuccessstate());
    }
  }
}
