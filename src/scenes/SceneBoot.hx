package scenes;

import h2d.Bitmap;

class SceneBoot extends Scene {
  public var logo: Bitmap;
  public var logoFinished: Bool;

  public override function init() {
    super.init();
    addLogo();
  }

  public function addLogo() {
    var tile = Res.img.ltn_logo.toTile();
    logo = new Bitmap(tile);
    logo.scaleX = 0.4;
    logo.scaleY = 0.4;

    var size = logo.getSize();
    logo.y = height / 2 - size.height / 2;
    logo.x = width / 2 - size.width / 2;

    addChild(logo);
  }

  override function onResize() {
    var size = logo.getSize();

    logo.y = height / 2 - size.height / 2;
    logo.x = width / 2 - size.width / 2;
  }

  override public function onKeyDown(event) {}

  override public function onClick(event) {
    logo.alpha = 0;
  }

  public override function update(dt: Float) {
    super.update(dt);
    if (logo != null) {
      if (logo.alpha > 0) {
        logo.alpha -= 0.15 * dt;
      }
      if (logo.alpha <= 0) {
        logoFinished = true;
      }
    }

    if (logoFinished) {
      game.changeScene(new SceneTitle());
    }
  }

  public override function dispose() {}
}
