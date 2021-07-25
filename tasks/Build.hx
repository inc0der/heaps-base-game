package tasks;

import sys.io.File;
import haxe.Json;
import haxe.io.Path;

using StringTools;

class Build {
  static public function main() {
    try {
      #if sys
      var args = Sys.args();
      var configContents = File.getContent('./config.json');
      var config = Json.parse(configContents);

      var buildDir = '${config.buildDir}';
      var htmlBuildDir = '${buildDir}/html5';
      var windowsBuildDir = '${buildDir}/html5';

      if (args.contains('--windows')) {
        // Copy windows related files here
      }

      if (args.contains('--web')) {
        // copy or create an index.html
      }

      if (args.contains('--nwjs')) {
        var configName = config.name.toLowerCase();
        var packageName = StringTools.replace(configName, ' ', '-');
        var iconName = Path.withoutDirectory(config.icon);

        var packageJson = {
          main: "index.html",
          name: packageName,
          icon: iconName,
          title: config.name
        };

        var content: String = Json.stringify(packageJson, null, '\t');
        File.saveContent('${htmlBuildDir}/package.json', content);

        File.copy(config.icon, '${htmlBuildDir}/${iconName}');
      }
      #end
    } catch (error) {
      trace(error.message);
    }
  }
}
