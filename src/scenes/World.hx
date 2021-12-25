package scenes;

import core.Scene;
import entities.Player;

class World extends Scene {
  public var player: Player;

  public override function init() {
    player = new Player(width / 2, height / 2, this);
  }

  public override function onResize() {}

  public override function update(dt: Float) {}

  public override function dispose() {}
}
