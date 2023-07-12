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
import 'package:note_app/domain/ports/note_service_port.dart' as _i9;
import 'package:note_app/domain/ports/user_service_port.dart' as _i12;
import 'package:note_app/domain/services/note_service.dart' as _i10;
import 'package:note_app/domain/services/user_service.dart' as _i13;
import 'package:note_app/primary/ui/shared/stores/global_store.dart' as _i3;
import 'package:note_app/secondary/http_client/http_client_adapter.dart' as _i8;
import 'package:note_app/secondary/http_client/interceptors/request_token_interceptor.dart'
    as _i6;
import 'package:note_app/secondary/http_client/ports/http_client_port.dart'
    as _i7;
import 'package:note_app/secondary/secondary.dart' as _i11;
import 'package:note_app/secondary/storage/ports/storage_port.dart' as _i4;
import 'package:note_app/secondary/storage/shared_preferences_storage_adapter.dart'
    as _i5;

extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i3.GlobalStore>(_i3.GlobalStore());
    gh.singleton<_i4.StoragePort>(_i5.SharedPreferencesStorageAdapter());
    gh.factory<_i6.RequestTokenInterceptor>(
        () => _i6.RequestTokenInterceptor(gh<_i4.StoragePort>()));
    gh.singleton<_i7.HttpClientPort>(
        _i8.HttpClientAdapter(gh<_i6.RequestTokenInterceptor>()));
    gh.singleton<_i9.NoteServicePort>(
        _i10.NoteService(gh<_i11.HttpClientPort>()));
    gh.singleton<_i12.UserServicePort>(_i13.UserService(
      gh<_i11.HttpClientPort>(),
      gh<_i11.StoragePort>(),
    ));
    return this;
  }
}
