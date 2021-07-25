import scenes.Scene;
import scenes.SceneTitle;
import hxd.Window;

class Game extends hxd.App {
  public static var instance(get, null): Game;

  public var width(get, null): Int;
  public var height(get, null): Int;

  public var scene(default, set): Scene;

  private function new() {
    super();
  }

  private static function get_instance(): Game {
    if (instance == null) {
      instance = new Game();
    }
    return instance;
  }

  public override function init() {
    trace('Hello World');
    changeScene(new SceneTitle());
  }

  public function get_width(): Int {
    return scene.width;
  }

  public function get_height(): Int {
    return scene.height;
  }

  public function set_scene(newScene: Scene) {
    if (scene != null) {
      scene.dispose();
    }
    scene = newScene;
    changeScene(newScene);
    scene.game = instance;
    return scene;
  }

  public function changeScene(scene: Scene): Void {
    setScene(scene);
    scene.init();
  }

  public override function update(dt: Float) {
    if (scene != null) {
      scene.update(dt);
    }
  }
}
