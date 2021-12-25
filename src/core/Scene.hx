package core;

import h2d.Interactive;

class Scene extends h2d.Scene {
  public var interaction: Interactive;
  @:isVar
  public var game(get, set): Game = Game.instance;

  public function set_game(game: Game) {
    this.game = game;
    return game;
  }

  public function get_game(): Game {
    return game;
  }

  public function init(): Void {}

  public function update(dt: Float): Void {}

  public override function dispose(): Void {}

  public function onResize() {}

  public function onClick(event: hxd.Event) {}

  public function onFocus(event: hxd.Event) {}

  public function onFocusLost(event: hxd.Event) {}

  public function onKeyDown(event: hxd.Event) {}

  public function onKeyUp(event: hxd.Event) {}
}
