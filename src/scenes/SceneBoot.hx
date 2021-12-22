package scenes;

import h2d.Bitmap;

class SceneBoot extends Scene {
  public var logo: Bitmap;
  public var logoFinished: Bool;
  public var baseVersionText: h2d.Text;
  public var platformText: h2d.Text;

  public override function init() {
    super.init();
    addLogo();
    #if debug
    addDebugInfo();
    #end
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

  private function addDebugInfo() {
    var font = hxd.res.DefaultFont.get();
    font.resizeTo(20);

    baseVersionText = new h2d.Text(font, this);
    baseVersionText.text = Utils.getVersion();
    baseVersionText.setPosition(width - baseVersionText.textWidth, height - baseVersionText.textHeight);

    platformText = new h2d.Text(font, this);
    platformText.text = Utils.getPlatform();
    platformText.setPosition(0, height - platformText.textHeight);
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
