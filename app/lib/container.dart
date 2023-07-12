import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:note_app/container.config.dart';

final locator = GetIt.instance;

@InjectableInit()
void configureDependencies() => locator.init();
