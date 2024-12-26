import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prueba_flutte/data/datasources/user_datasource_impl.dart';
import 'package:prueba_flutte/data/repositories/user_repository_impl.dart';

final userRepositoryProvider = Provider((ref) {

  return UserRepositoryImpl( UserDatasourceImpl() );
});