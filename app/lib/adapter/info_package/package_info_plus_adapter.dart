import 'package:injectable/injectable.dart';
import 'package:note_app/adapter/info_package/ports/info_package_port.dart';
import 'package:package_info_plus/package_info_plus.dart';

@Injectable(as: InfoPackagePort)
final class PackageInfoPlusAdapter implements InfoPackagePort {
  late final PackageInfo _packageInfo;

  @PostConstruct(preResolve: true)
  Future<void> init() async {
    _packageInfo = await PackageInfo.fromPlatform();
  }

  @override
  String get appVersion => _packageInfo.version;
}
