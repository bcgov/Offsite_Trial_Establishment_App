import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'di.config.dart';

final GetIt getIt = GetIt.instance;

@InjectableInit(asExtension: true, initializerName: 'init')
Future<GetIt> getItInit({String? env, EnvironmentFilter? environmentFilter}) async {
  return getIt.init(environmentFilter: environmentFilter, environment: env);
}
