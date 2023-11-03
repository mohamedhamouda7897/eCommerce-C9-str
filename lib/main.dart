import 'package:bloc/bloc.dart';
import 'package:e_commerce/core/utils/observer.dart';
import 'package:flutter/material.dart';

import 'core/utils/observer.dart';
import 'my_app.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(MyApp());
}
