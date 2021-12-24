package entities;

import hxd.Event;
import h2d.Tile;

class Player extends Sprite {
  public var graphic: Tile;

  public function new(x, y, ?parent) {
    graphic = Res.img.player.toTile();
    super(x, y, graphic, true, parent);
  }

  public override function onKeyDown(event: Event) {
    trace('DOWN keyCode: ${event.keyCode}, charCode: ${event.charCode}');
  }

  public override function onKeyUp(event: Event) {
    trace('UP keyCode: ${event.keyCode}, charCode: ${event.charCode}');
  }
}
