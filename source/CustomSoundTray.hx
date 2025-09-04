package;

import flixel.FlxBasic;
import flixel.FlxG;

class CustomSoundTray extends FlxBasic {
    public var tray:CustomSoundTray;

    public function new() {
        super();
    }

    override public function update(elapsed:Float):Void {
        super.update(elapsed);

        if (tray == null) {
            tray = new CustomSoundTray(20, 20);
        }

        // check for volume changes
        if (FlxG.keys.justPressed.PLUS 
            || FlxG.keys.justPressed.MINUS 
            || FlxG.keys.justPressed.ZERO) {
            tray.updateVolumeDisplay();
            _timer = 2; // show for 2 seconds (optional fade timer)
        }
    }

    override public function draw():Void {
        if (tray != null) {
            tray.draw(); // draw AFTER state, always on top
        }
    }

    private var _timer:Float = 0;

    override public function postUpdate(elapsed:Float):Void {
        if (_timer > 0) {
            _timer -= elapsed;
            tray.visible = true;
        } else {
            tray.visible = false;
        }
    }
}
