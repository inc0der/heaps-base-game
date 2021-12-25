package entities;

import core.Sprite;
import hxd.Event;
import h2d.Tile;

class Player extends Sprite {
  public var graphic: Tile;
  public var speed: Int;

  public function new(x, y, ?parent) {
    graphic = Res.img.player.toTile();
    super(x, y, graphic, true, parent);

    speed = 5;
  }

  public override function onKeyDown(event: Event) {
    if (event.keyCode == 87 || event.keyCode == 38) {
      this.y -= speed;
    }

    if (event.keyCode == 83 || event.keyCode == 40) {
      this.y += speed;
    }

    if (event.keyCode == 65 || event.keyCode == 37) {
      this.x -= speed;
    }

    if (event.keyCode == 68 || event.keyCode == 39) {
      this.x += speed;
    }
  }
}
