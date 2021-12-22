import sys.io.File;
import haxe.Json;
import hxd.System;

typedef Config = {
  name: String,
  icon: String,
  indexHtml: String,
  buildDir: String,
  version: String
}

class Utils {
  public static function getConfig(): Config {
    var configContents = File.getContent('./config.json');
    var config = Json.parse(configContents);

    return config;
  }

  public static function getVersion(): String {
    var config: Config = getConfig();
    return config.version;
  }

  public static function getPlatform(): String {
    var platform = System.platform;

    switch (platform) {
      case IOS:
        return "IOS";
      case Android:
        return "Android";
      case WebGL:
        return "Web";
      case PC:
        return "Desktop";
      case _:
        return "Other";
    }
  }
}
