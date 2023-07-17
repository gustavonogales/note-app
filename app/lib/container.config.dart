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
import 'package:note_app/domain/ports/note_service_port.dart' as _i11;
import 'package:note_app/domain/ports/user_service_port.dart' as _i13;
import 'package:note_app/domain/services/note_service.dart' as _i12;
import 'package:note_app/domain/services/user_service.dart' as _i14;
import 'package:note_app/primary/ui/shared/stores/global_store.dart' as _i7;
import 'package:note_app/primary/ui/shared/stores/theme_store.dart' as _i5;
import 'package:note_app/secondary/http_client/http_client_adapter.dart'
    as _i10;
import 'package:note_app/secondary/http_client/interceptors/request_token_interceptor.dart'
    as _i8;
import 'package:note_app/secondary/http_client/ports/http_client_port.dart'
    as _i9;
import 'package:note_app/secondary/secondary.dart' as _i6;
import 'package:note_app/secondary/storage/ports/storage_port.dart' as _i3;
import 'package:note_app/secondary/storage/shared_preferences_storage_adapter.dart'
    as _i4;

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
    await gh.factoryAsync<_i3.StoragePort>(
      () {
        final i = _i4.SharedPreferencesStorageAdapter();
        return i.init().then((_) => i);
      },
      preResolve: true,
    );
    gh.singleton<_i5.ThemeStore>(_i5.ThemeStore(gh<_i6.StoragePort>()));
    gh.singleton<_i7.GlobalStore>(_i7.GlobalStore(gh<_i5.ThemeStore>()));
    gh.factory<_i8.RequestTokenInterceptor>(
        () => _i8.RequestTokenInterceptor(gh<_i3.StoragePort>()));
    gh.singleton<_i9.HttpClientPort>(
        _i10.HttpClientAdapter(gh<_i8.RequestTokenInterceptor>()));
    gh.singleton<_i11.NoteServicePort>(
        _i12.NoteService(gh<_i6.HttpClientPort>()));
    gh.singleton<_i13.UserServicePort>(_i14.UserService(
      gh<_i6.HttpClientPort>(),
      gh<_i6.StoragePort>(),
    ));
    return this;
  }
}
