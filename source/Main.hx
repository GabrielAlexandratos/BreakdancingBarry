package;

import CustomSoundTrayPlugin;
import flixel.FlxG;
import flixel.FlxGame;
import openfl.display.Sprite;

class Main extends Sprite {

	public function new()
	{
		super();
		
		addChild(new FlxGame(0, 0, ChartEditor, 60, 60, true));
		// add custom sound tray plugin
		FlxG.plugins.addPlugin(new CustomSoundTrayPlugin());
	}
}