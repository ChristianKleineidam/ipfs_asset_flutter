import 'dart:async';

import 'package:build/build.dart';
import 'package:yaml/yaml.dart';

/// A minimal [Builder] that reads the `pubspec.yaml` file.
///
/// This currently only parses the pubspec and logs that it was loaded. In the
/// future it will emit a manifest describing package assets available via IPFS.
class IpfsAssetBuilder implements Builder {
  @override
  final Map<String, List<String>> buildExtensions = const {
    r'$package$': ['ipfs_asset_manifest.json']
  };

  @override
  Future<void> build(BuildStep buildStep) async {
    final pubspecId = AssetId(buildStep.inputId.package, 'pubspec.yaml');
    final pubspecContent = await buildStep.readAsString(pubspecId);
    // Parse the YAML just to verify it is valid. The resulting map is unused for
    // now but will be used when generating the manifest later.
    loadYaml(pubspecContent);

    log.info('Loaded pubspec for package ${buildStep.inputId.package}');
  }
}

/// Factory used by `build_runner` to create the builder.
Builder ipfsAssetBuilder(BuilderOptions options) => IpfsAssetBuilder();

