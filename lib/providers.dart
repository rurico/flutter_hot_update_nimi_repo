import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'dio.dart';
import 'package_cubit.dart';

final blocProviders = [
  BlocProvider<PackageCubit>(
    create: (BuildContext context) => PackageCubit(
      Http(BaseOptions(baseUrl: 'http://localhost:port/')),
    ),
  ),
];
