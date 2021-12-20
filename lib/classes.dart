import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@singleton
class RepositoryC {
  final Networking networking;

  RepositoryC(this.networking);
}

///

class ClassA {}

Future<ClassA> getA() async => ClassA();

///

abstract class Networking {}

@test
@Singleton(as: Networking)
class NetworkingMock implements Networking {}

@dev
@prod
@Singleton(as: Networking)
class NetworkingD implements Networking {
  final HttpClient client;

  NetworkingD(this.client);
}

///

@singleton
class HttpClient {
  final SharedPreferences sharedPreferences;
  // final String apiUrl;

  HttpClient(
    this.sharedPreferences,
    // @Named("apiUrl") this.apiUrl,
  );
}

///

@module
abstract class RegisterModule {
  @preResolve
  @singleton
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();

  @preResolve
  @singleton
  Future<ClassA> get a => getA();

  @Named("apiUrl")
  String get url => "https://someurl.com";
}
