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
import 'package:note_app/adapter/http_client/http_client_adapter.dart' as _i5;
import 'package:note_app/adapter/http_client/ports/http_client_port.dart'
    as _i4;
import 'package:note_app/adapter/storage/ports/storage_port.dart' as _i12;
import 'package:note_app/adapter/storage/shared_preferences_storage_adapter.dart'
    as _i13;
import 'package:note_app/domain/domain.dart' as _i10;
import 'package:note_app/domain/ports/note_service_port.dart' as _i6;
import 'package:note_app/domain/ports/theme_service_port.dart' as _i14;
import 'package:note_app/domain/ports/user_service_port.dart' as _i17;
import 'package:note_app/domain/services/note_service.dart' as _i7;
import 'package:note_app/domain/services/theme_service.dart' as _i15;
import 'package:note_app/domain/services/user_service.dart' as _i18;
import 'package:note_app/environment.dart' as _i3;
import 'package:note_app/ui/stores/note_store.dart' as _i9;
import 'package:note_app/ui/stores/root_store.dart' as _i21;
import 'package:note_app/ui/stores/theme_store.dart' as _i16;
import 'package:note_app/ui/stores/user_store.dart' as _i19;
import 'package:note_app/ui/utils/interceptors/refresh_token_interceptor.dart'
    as _i11;
import 'package:note_app/ui/utils/interceptors/request_token_interceptor.dart'
    as _i20;

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
    gh.singleton<_i4.HttpClientPort>(
        _i5.HttpClientAdapter(gh<_i3.AppEnvironment>()));
    gh.singleton<_i6.NoteServicePort>(
        _i7.NoteService(gh<_i8.HttpClientPort>()));
    gh.singleton<_i9.NoteStore>(_i9.NoteStore(gh<_i10.NoteServicePort>()));
    gh.lazySingleton<_i11.RefreshTokenInterceptor>(
        () => _i11.RefreshTokenInterceptor());
    await gh.factoryAsync<_i12.StoragePort>(
      () {
        final i = _i13.SharedPreferencesStorageAdapter();
        return i.init().then((_) => i);
      },
      preResolve: true,
    );
    gh.singleton<_i14.ThemeServicePort>(
        _i15.ThemeService(gh<_i8.StoragePort>()));
    gh.singleton<_i16.ThemeStore>(_i16.ThemeStore(gh<_i10.ThemeServicePort>()));
    gh.singleton<_i17.UserServicePort>(_i18.UserService(
      gh<_i8.HttpClientPort>(),
      gh<_i8.StoragePort>(),
    ));
    gh.singleton<_i19.UserStore>(_i19.UserStore(gh<_i10.UserServicePort>()));
    gh.lazySingleton<_i20.RequestTokenInterceptor>(
        () => _i20.RequestTokenInterceptor(gh<_i12.StoragePort>()));
    gh.singleton<_i21.RootStore>(_i21.RootStore(
      gh<_i10.UserServicePort>(),
      gh<_i10.NoteServicePort>(),
      gh<_i10.ThemeServicePort>(),
    ));
    return this;
  }
}
