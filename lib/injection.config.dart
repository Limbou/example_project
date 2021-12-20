// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i4;

import 'classes.dart' as _i3;

const String _test = 'test';
const String _dev = 'dev';
const String _prod = 'prod';
// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final registerModule = _$RegisterModule();
  await gh.singletonAsync<_i3.ClassA>(() => registerModule.a, preResolve: true);
  gh.singleton<_i3.Networking>(_i3.NetworkingMock(), registerFor: {_test});
  gh.singleton<_i3.RepositoryC>(_i3.RepositoryC(get<_i3.Networking>()));
  await gh.singletonAsync<_i4.SharedPreferences>(() => registerModule.prefs,
      preResolve: true);
  gh.factory<String>(() => registerModule.url, instanceName: 'apiUrl');
  gh.singleton<_i3.HttpClient>(_i3.HttpClient(get<_i4.SharedPreferences>()));
  gh.singleton<_i3.Networking>(_i3.NetworkingD(get<_i3.HttpClient>()),
      registerFor: {_dev, _prod});
  return get;
}

class _$RegisterModule extends _i3.RegisterModule {}
