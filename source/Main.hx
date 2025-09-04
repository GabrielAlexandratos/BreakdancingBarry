package;

import CustomSoundTrayPlugin;
import flixel.FlxG;
import flixel.FlxGame;
import openfl.display.Sprite;

class Main extends Sprite {

	public function new()
	{
		super();
		// create the game
		addChild(new FlxGame(0, 0, OpeningState, 60, 60, true));
		// add the plugin, NOT the sprite
		FlxG.plugins.addPlugin(new CustomSoundTrayPlugin());
	}
}