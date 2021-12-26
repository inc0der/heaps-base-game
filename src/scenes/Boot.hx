package scenes;

import core.Scene;
import h2d.Bitmap;

class Boot extends Scene {
  public var logo: Bitmap;
  public var logoFinished: Bool;
  public var baseVersionText: h2d.Text;
  public var platformText: h2d.Text;
  public var gameNameText: h2d.Text;
  public var bootSound: hxd.res.Sound;

  public override function init() {
    super.init();
    playBootSound();
    addLogo();
    addDebugInfo();
  }

  function playBootSound() {
    var sound = Res.audio.se.boot;
    sound.play();
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
    #if debug
    var data = Utils.getSystemData();
    var font = hxd.res.DefaultFont.get();
    font.resizeTo(20);

    platformText = new h2d.Text(font, this);
    platformText.text = Utils.getPlatform();
    platformText.setPosition(0, height - platformText.textHeight);

    gameNameText = new h2d.Text(font, this);
    gameNameText.text = data.name;
    gameNameText.setPosition(width / 2 - gameNameText.textWidth / 2, height - gameNameText.textHeight);

    baseVersionText = new h2d.Text(font, this);
    baseVersionText.text = data.version;
    baseVersionText.setPosition(width - baseVersionText.textWidth, height - baseVersionText.textHeight);
    #end
  }

  override function onResize() {
    var size = logo.getSize();

    logo.y = height / 2 - size.height / 2;
    logo.x = width / 2 - size.width / 2;
    baseVersionText.setPosition(width - baseVersionText.textWidth, height - baseVersionText.textHeight);
    gameNameText.setPosition(width / 2 - gameNameText.textWidth / 2, height - gameNameText.textHeight);
    platformText.setPosition(0, height - platformText.textHeight);
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
      game.changeScene(new scenes.Title());
    }
  }

  public override function dispose() {}
}
