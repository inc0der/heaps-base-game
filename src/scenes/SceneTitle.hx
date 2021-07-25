package scenes;

class SceneTitle extends Scene {
  public override function init() {
    trace('Menu Init');
    addHelloWorldText();
  }

  public function addHelloWorldText() {
    var font = hxd.res.DefaultFont.get();
    font.resizeTo(24);
    var tf = new h2d.Text(font, this);
    tf.setPosition(width / 2 - tf.textWidth / 2, height / 2 - tf.textHeight);
    tf.text = "Hello World !";
  }

  public override function update(dt: Float) {}

  public override function dispose() {}
}
