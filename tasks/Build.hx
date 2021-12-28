package tasks;

import tasks.Config;
#if sys
import sys.io.File;
import sys.FileSystem;
import haxe.Json;
import haxe.io.Path;

using StringTools;

class Build {
  static public function main() {
    try {
      var args = Sys.args();
      var configContents = File.getContent('./config.json');
      var config: Config = Json.parse(configContents);

      var buildDir = '${config.buildDir}';

      var htmlBuildDir = '${buildDir}/html5';
      var windowsBuildDir = '${buildDir}/html5';

      if (args.contains('--windows')) {
        // Windows only target for directx
      }

      if (args.contains('--desktop')) {
        // Linux & Windows target
      }

      if (args.contains('--web')) {
        buildWeb(config, htmlBuildDir);
        buildPackageJson(config, htmlBuildDir);
      }
      buildSystemData(config);
    } catch (error) {
      trace(error.message);
    }
  }

  public static function buildWeb(config: Config, htmlBuildDir) {
    var iconName = Path.withoutDirectory(config.icon);
    var indexHtml = File.getContent('${config.indexHtml}');
    var content = indexHtml.replace('{config.name}', config.name).replace('{config.icon}', iconName);

    File.saveContent('${htmlBuildDir}/index.html', content);
    File.copy(config.icon, '${htmlBuildDir}/${iconName}');
  }

  public static function buildPackageJson(config, htmlBuildDir) {
    var configName = config.name.toLowerCase();
    var iconName = Path.withoutDirectory(config.icon);
    var packageName = StringTools.replace(configName, ' ', '-');

    var packageJson = {
      main: "index.html",
      name: packageName,
      icon: iconName,
      title: config.name,
      window: {
        icon: iconName
      }
    };

    var content: String = Json.stringify(packageJson, null, '\t');
    File.saveContent('${htmlBuildDir}/package.json', content);
  }

  public static function buildSystemData(config) {
    var systemData = {
      name: config.name,
      version: config.version,
      enableConsole: config.enableConsole
    };

    var content: String = Json.stringify(systemData);
    File.saveContent('res/data/system.json', content);
  }
}
#end
