package;

import flixel.FlxBasic;
import flixel.FlxG;

class CustomSoundTrayPlugin extends FlxBasic
{
    public var tray:CustomSoundTray;
    private var _timer:Float = 0;

	public function new()
	{
        super();
		// create the tray at bottom-right
		tray = new CustomSoundTray(FlxG.width - 80, FlxG.height - 620);
        if (FlxG.stage != null) {
            FlxG.stage.addChild(tray);
        }
    }

	override public function update(elapsed:Float):Void
	{
        super.update(elapsed);

		// always update the volume icon
        tray.updateVolumeDisplay();

		// detect volume key presses
        if (FlxG.keys.justPressed.PLUS 
            || FlxG.keys.justPressed.MINUS 
		|| FlxG.keys.justPressed.ZERO)
		{
			FlxG.sound.play("assets/sounds/volumeBlipSFX.mp3", 0.4);
			_timer = 1.5;
			if (tray.x > tray.targetX + 1)
			{
				tray.showTray();
			}
        }

		// mute if 0 pressed
        if (FlxG.keys.justPressed.ZERO) {
			FlxG.sound.volume = 0;
            tray.updateVolumeDisplay();
        }

		// hide tray when timer runs out
		if (_timer > 0)
		{
			_timer -= elapsed;
		}
		else
		{
			if (tray.x <= tray.targetX + 1)
			{
				tray.hideTray();
			}
		}
    }
}