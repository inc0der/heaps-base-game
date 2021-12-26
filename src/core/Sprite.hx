package core;

import hxd.Event;
import h2d.Interactive;
import h2d.Object;
import h2d.Bitmap;
import h2d.Tile;

class Sprite extends Object {
  public var bitmap(default, set): Bitmap;
  public var tile(default, set): Tile;

  public var interaction: Interactive;

  public function new(x: Float, y: Float, ?tile: Tile, ?isInteractive: Bool, ?parent: Object) {
    super(parent);
    this.x = x;
    this.y = y;
    if (tile != null) {
      this.tile = tile;
    }
    if (isInteractive) {
      var bitmapRect = bitmap.getSize();
      interaction = new Interactive(bitmapRect.width, bitmapRect.height, this);
      interaction.onClick = onClick;
      interaction.onOver = onOver;
      interaction.onOut = onOut;
    }
  }

  public function set_bitmap(bitmap: Bitmap) {
    this.bitmap = bitmap;
    return this.bitmap;
  }

  public function set_tile(tile: Tile) {
    this.tile = tile;
    this.bitmap = new Bitmap(tile, this);
    if (interaction != null) {
      interaction.width = this.bitmap.getSize().width;
      interaction.height = this.bitmap.getSize().height;
    }
    return this.tile;
  }

  public function onClick(event: Event) {}

  public function onOver(event: Event) {}

  public function onOut(event: Event) {}
}
