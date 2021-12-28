import hxd.System;
import haxe.Json;

typedef Config = {
  name: String,
  version: String,
  enableConsole: Bool
}

class Utils {
  public static function getSystemData(): Config {
    var data = Res.data.system.entry.getText();
    var systemData: Config = Json.parse(data);
    return systemData;
  }

  public static function getVersion(): String {
    var data = getSystemData();
    return data.version;
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

  public static function isConsleEnabled(): Bool {
    var data = getSystemData();
    return data.enableConsole;
  }
}
