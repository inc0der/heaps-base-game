package entities;

import h2d.RenderContext;
import hxd.Key;
import core.Sprite;
import h2d.Tile;

class Player extends Sprite {
  public var graphic: Tile;
  public var SPEED: Int = 5;

  public function new(x, y, ?parent) {
    graphic = Res.img.player.toTile();
    super(x, y, graphic, true, parent);
  }

  public override function sync(ctx: RenderContext) {
    super.sync(ctx);
    var tmod = hxd.Timer.tmod;
    if (Key.isDown(Key.W)) {
      y -= SPEED * tmod;
    }
    if (Key.isDown(Key.S)) {
      y += SPEED * tmod;
    }
    if (Key.isDown(Key.A)) {
      x -= SPEED * tmod;
    }
    if (Key.isDown(Key.D)) {
      x += SPEED * tmod;
    }
  }
}
