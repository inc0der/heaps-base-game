package core;

import hxd.Direction;
import h2d.Interactive;
import hxd.Event;

class TouchInput {
  private var startX: Float = 0.0;
  private var startY: Float = 0.0;

  private var startTime: Float = 0.0;
  private var elapsedTime: Float = 0.0;
  private var distX: Float = 0.0;
  private var distY: Float = 0.0;
  private var onReleaseEvent: Event;

  public var holdTime: Int = 100;
  public var threshold: Int = 100;
  public var restraint: Int = 150;
  public var swipeDir: Direction;

  private var interactive: Interactive;

  public function new(scene: Scene) {
    interactive = new Interactive(scene.width, scene.height, scene);
    interactive.onMove = onMove;
    interactive.onRelease = onRelease;
    interactive.onPush = onStart;
  }

  public function onStart(event: Event) {
    distX = 0;
    distY = 0;
    elapsedTime = 0;
    startTime = Date.now().getTime();
    startX = event.relX;
    startY = event.relY;
  }

  public function onMove(event: Event) {}

  public function onRelease(event: Event) {
    distX = event.relX - startX;
    distY = event.relY - startY;
    elapsedTime = Date.now().getTime() - startTime;
    if (elapsedTime <= holdTime) {
      if (Math.abs(distX) >= threshold && Math.abs(distY) <= restraint) {
        swipeDir = distX > 0 ? Right : Left;
      }
      if (Math.abs(distY) >= threshold && Math.abs(distX) <= restraint) {
        swipeDir = distY > 0 ? Down : Up;
      }
    }
  }
}
