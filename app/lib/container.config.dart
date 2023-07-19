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
import 'package:note_app/adapter/adapter.dart' as _i8;
import 'package:note_app/adapter/http_client/http_client_adapter.dart' as _i11;
import 'package:note_app/adapter/http_client/interceptors/refresh_token_interceptor.dart'
    as _i4;
import 'package:note_app/adapter/http_client/interceptors/request_token_interceptor.dart'
    as _i9;
import 'package:note_app/adapter/http_client/ports/http_client_port.dart'
    as _i10;
import 'package:note_app/adapter/storage/ports/storage_port.dart' as _i5;
import 'package:note_app/adapter/storage/shared_preferences_storage_adapter.dart'
    as _i6;
import 'package:note_app/domain/domain.dart' as _i17;
import 'package:note_app/domain/ports/note_service_port.dart' as _i12;
import 'package:note_app/domain/ports/user_service_port.dart' as _i14;
import 'package:note_app/domain/services/note_service.dart' as _i13;
import 'package:note_app/domain/services/user_service.dart' as _i15;
import 'package:note_app/environment.dart' as _i3;
import 'package:note_app/ui/shared/stores/auth_store.dart' as _i16;
import 'package:note_app/ui/shared/stores/global_store.dart' as _i18;
import 'package:note_app/ui/shared/stores/theme_store.dart' as _i7;

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
    gh.factory<_i4.RefreshTokenInterceptor>(
        () => _i4.RefreshTokenInterceptor());
    await gh.factoryAsync<_i5.StoragePort>(
      () {
        final i = _i6.SharedPreferencesStorageAdapter();
        return i.init().then((_) => i);
      },
      preResolve: true,
    );
    gh.singleton<_i7.ThemeStore>(_i7.ThemeStore(gh<_i8.StoragePort>()));
    gh.factory<_i9.RequestTokenInterceptor>(
        () => _i9.RequestTokenInterceptor(gh<_i5.StoragePort>()));
    gh.singleton<_i10.HttpClientPort>(_i11.HttpClientAdapter(
      gh<_i3.AppEnvironment>(),
      gh<_i9.RequestTokenInterceptor>(),
      gh<_i4.RefreshTokenInterceptor>(),
    ));
    gh.singleton<_i12.NoteServicePort>(
        _i13.NoteService(gh<_i8.HttpClientPort>()));
    gh.singleton<_i14.UserServicePort>(_i15.UserService(
      gh<_i8.HttpClientPort>(),
      gh<_i8.StoragePort>(),
    ));
    gh.singleton<_i16.AuthStore>(_i16.AuthStore(gh<_i17.UserServicePort>()));
    gh.singleton<_i18.GlobalStore>(_i18.GlobalStore(
      gh<_i7.ThemeStore>(),
      gh<_i16.AuthStore>(),
    ));
    return this;
  }
}
