package scenes;

import core.Scene;
import entities.Player;

class World extends Scene {
  public var player: Player;

  public override function init() {
    super.init();
    player = new Player(width / 2, height / 2, this);
  }

  public override function onResize() {}

  public override function update(dt: Float) {
    super.update(dt);
  }

  public override function dispose() {}
}
