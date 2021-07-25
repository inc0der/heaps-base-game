package scenes;

class Scene extends h2d.Scene {
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
}
