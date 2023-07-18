// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:note_app/domain/ports/note_service_port.dart' as _i12;
import 'package:note_app/domain/ports/user_service_port.dart' as _i14;
import 'package:note_app/domain/services/note_service.dart' as _i13;
import 'package:note_app/domain/services/user_service.dart' as _i15;
import 'package:note_app/environment.dart' as _i3;
import 'package:note_app/primary/ui/shared/stores/global_store.dart' as _i8;
import 'package:note_app/primary/ui/shared/stores/theme_store.dart' as _i6;
import 'package:note_app/secondary/http_client/http_client_adapter.dart'
    as _i11;
import 'package:note_app/secondary/http_client/interceptors/request_token_interceptor.dart'
    as _i9;
import 'package:note_app/secondary/http_client/ports/http_client_port.dart'
    as _i10;
import 'package:note_app/secondary/secondary.dart' as _i7;
import 'package:note_app/secondary/storage/ports/storage_port.dart' as _i4;
import 'package:note_app/secondary/storage/shared_preferences_storage_adapter.dart'
    as _i5;

extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    await gh.singletonAsync<_i3.AppEnvironment>(
      () {
        final i = _i3.AppEnvironment();
        return i.fromVariable().then((_) => i);
      },
      preResolve: true,
    );
    await gh.factoryAsync<_i4.StoragePort>(
      () {
        final i = _i5.SharedPreferencesStorageAdapter();
        return i.init().then((_) => i);
      },
      preResolve: true,
    );
    gh.singleton<_i6.ThemeStore>(_i6.ThemeStore(gh<_i7.StoragePort>()));
    gh.singleton<_i8.GlobalStore>(_i8.GlobalStore(gh<_i6.ThemeStore>()));
    gh.factory<_i9.RequestTokenInterceptor>(
        () => _i9.RequestTokenInterceptor(gh<_i4.StoragePort>()));
    gh.singleton<_i10.HttpClientPort>(_i11.HttpClientAdapter(
      gh<_i3.AppEnvironment>(),
      gh<_i9.RequestTokenInterceptor>(),
    ));
    gh.singleton<_i12.NoteServicePort>(
        _i13.NoteService(gh<_i7.HttpClientPort>()));
    gh.singleton<_i14.UserServicePort>(_i15.UserService(
      gh<_i7.HttpClientPort>(),
      gh<_i7.StoragePort>(),
    ));
    return this;
  }
}
