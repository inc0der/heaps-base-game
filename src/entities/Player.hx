package entities;

import hxd.Key;
import h2d.RenderContext;
import core.Sprite;
import h2d.Tile;

class Player extends Sprite {
  public var graphic: Tile;
  public var speed: Int;

  public function new(x, y, ?parent) {
    graphic = Res.img.player.toTile();
    super(x, y, graphic, true, parent);

    speed = 5;
  }

  public override function sync(ctx: RenderContext) {
    super.sync(ctx);
    if (Key.isDown(Key.W)) {
      y -= speed;
    }
    if (Key.isDown(Key.S)) {
      y += speed;
    }
    if (Key.isDown(Key.A)) {
      x -= speed;
    }
    if (Key.isDown(Key.D)) {
      x += speed;
    }
  }
}
