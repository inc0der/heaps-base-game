package scenes;

import hxd.res.Sound;
import hxd.System;
import core.Scene;

class Title extends Scene {
  public var titleText: h2d.Text;
  public var playText: h2d.Text;
  public var quitText: h2d.Text;
  public var optionsText: h2d.Text;
  public var uiOk: Sound;
  public var uiSelect: Sound;

  public override function init() {
    uiSelect = Res.audio.se.ui_select;
    uiOk = Res.audio.se.ui_ok;
    addTitleText();
    addCommandButtons();
  }

  public function createTextButton(title: String, size: Int, onPress, ?onOver) {
    var font = hxd.res.DefaultFont.get().clone();
    font.resizeTo(size);

    var textButton = new h2d.Text(font, this);
    textButton.text = title;

    var interaction = new h2d.Interactive(textButton.textWidth, textButton.textHeight, textButton);
    interaction.onClick = onPress;
    interaction.onOver = onOver;
    return textButton;
  }

  public function addTitleText() {
    var font = hxd.res.DefaultFont.get().clone();
    font.resizeTo(72);

    titleText = new h2d.Text(font, this);
    titleText.text = Utils.getSystemData().name;
    titleText.setPosition(width / 2 - titleText.textWidth / 2, 20);
  }

  public function addCommandButtons() {
    playText = createTextButton("Start", 24, onPlay, onOverPlay);
    quitText = createTextButton("Quit", 24, onExit, onOverExit);
    playText.setPosition(width / 2 - playText.textWidth / 2, height / 2);
    quitText.setPosition(width / 2 - quitText.textWidth / 2, height / 2 + playText.textHeight + 10);
  }

  public function onPlay(event) {
    uiOk.play();
    game.changeScene(new scenes.World());
  }

  public function onExit(event) {
    uiOk.play();
    System.exit();
  }

  public function onOverPlay(event) {
    uiSelect.play();
  }

  public function onOverExit(event) {
    uiSelect.play();
  }

  public override function onResize() {
    titleText.setPosition(width / 2 - titleText.textWidth / 2, 20);
    playText.setPosition(width / 2 - playText.textWidth / 2, height / 2);
    quitText.setPosition(width / 2 - quitText.textWidth / 2, height / 2 + playText.textHeight + 10);
  }

  public override function update(dt: Float) {}

  public override function dispose() {}
}
