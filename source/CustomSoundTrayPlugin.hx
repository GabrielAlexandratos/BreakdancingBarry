package;

import flixel.FlxBasic;
import flixel.FlxG;
import openfl.display.Stage;

class CustomSoundTrayPlugin extends FlxBasic {
    public var tray:CustomSoundTray;
    private var _timer:Float = 0;

    public function new() {
        super();
        tray = new CustomSoundTray(20, 20); // position it
        if (FlxG.stage != null) {
            FlxG.stage.addChild(tray);
        }
    }

    override public function update(elapsed:Float):Void {

        super.update(elapsed);

        // Update volume display every frame
        tray.updateVolumeDisplay();

        // Check for volume key presses
        if (FlxG.keys.justPressed.PLUS 
            || FlxG.keys.justPressed.MINUS 
            || FlxG.keys.justPressed.ZERO) {
            _timer = 2; // show for 2 seconds
        }

        // If ZERO pressed, set volume to 0 and update tray immediately
        if (FlxG.keys.justPressed.ZERO) {
            FlxG.sound.volume = (0);
            tray.updateVolumeDisplay();
        }

        // Visibility timer
        tray.visible = (_timer > 0);
        if (_timer > 0) _timer -= elapsed;
    }
}