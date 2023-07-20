import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:note_app/container.config.dart';
import 'package:note_app/ui/utils/utils.dart';

import 'adapter/adapter.dart';

final locator = GetIt.instance;

@InjectableInit()
Future<void> configureDependencies() async {
  await locator.init();
  locator<HttpClientPort>().requestInterceptors.add(
        locator<RequestTokenInterceptor>(),
      );
  locator<HttpClientPort>().responseInterceptors.add(
        locator<RefreshTokenInterceptor>(),
      );
}
