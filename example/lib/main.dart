import 'dart:io';

import 'package:innosetup/innosetup.dart';
import 'package:version/version.dart';

void main() {
  // --------------------------------------------------------------------------
  // Simple Usage
  // --------------------------------------------------------------------------
  InnoSetup(
    app: InnoSetupApp(
      name: 'Test App',
      executable: 'test_app.exe',
      version: Version.parse('0.1.0'),
      publisher: 'author',
      urls: InnoSetupAppUrls(
        homeUrl: Uri.parse('https://example.com/'),
      ),
    ),
    files: InnoSetupFiles(
      executable: File('build/windows/runner/test_app.exe'),
      location: Directory('build/windows/runner'),
    ),
    name: const InnoSetupName('windows_installer'),
    location: InnoSetupInstallerDirectory(
      Directory('build/windows'),
    ),
    icon: InnoSetupIcon(
      File('assets/icon.ico'),
    ),
  ).make();

  // --------------------------------------------------------------------------
  // Complex Usage
  // --------------------------------------------------------------------------
  InnoSetup(
    name: const InnoSetupName(
      'windows_installer',
    ),
    app: InnoSetupApp(
      id: 'Test-App-123',
      name: 'Test App',
      executable: 'test_app.exe',
      version: Version.parse('0.1.0'),
      publisher: 'author',
      urls: InnoSetupAppUrls(
        homeUrl: Uri.parse('https://example.com/home'),
        publisherUrl: Uri.parse('https://example.com/author'),
        supportUrl: Uri.parse('https://example.com/support'),
        updatesUrl: Uri.parse('https://example.com/updates'),
      ),
      wizardStyle: InnoSetupWizardStyle.modern,
    ),
    files: InnoSetupFiles(
      executable: File('build/windows/runner/test_app.exe'),
      location: Directory('build/windows/runner'),
    ),
    location: InnoSetupInstallerDirectory(
      Directory('build/windows'),
    ),
    icon: InnoSetupIcon(
      File('assets/icon.ico'),
    ),
    privileges: InnoSetupPrivileges(
      required: InnoSetupPrivilegeRequired.lowest,
      overrideByCommandline: true,
      overrideByDialog: true,
    ),
    runAfterInstall: false,
    desktopIcon: true,
    compression: InnoSetupCompression.level(
      'lzma2',
      InnoSetupCompressionLevel.ultra64,
      solid: true,
    ),
    languages: InnoSetupLanguages().all,
    license: InnoSetupLicense(
      File('LICENSE'),
    ),
  ).make();
}
