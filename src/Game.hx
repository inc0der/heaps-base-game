import core.Scene;
import scenes.Boot;

class Game extends hxd.App {
  public static var instance(get, null): Game;

  public var scene: Scene;

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
    #if (hl && !debug)
    Res.initLocal();
    #else
    Res.initEmbed();
    #end
    changeScene(new scenes.Boot());
  }

  public function changeScene(scene: Scene): Void {
    this.scene = scene;
    this.scene.game = instance;

    setScene(scene);
    scene.init();
  }

  private override function onResize(): Void {
    super.onResize();
    if (scene != null) {
      scene.onResize();
    }
  }

  override function update(dt: Float): Void {
    if (scene != null) {
      scene.update(dt);
    }
  }
}
