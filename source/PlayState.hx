package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.math.FlxPoint;
import flixel.util.FlxTimer;
import lime.app.Application;
import lime.ui.MouseCursor;

class PlayState extends FlxState
{

	private var TitleLogo:FlxSprite;

	override public function create()
	{
		super.create();
		TitleLogo = new FlxSprite(0, 0);
		TitleLogo.loadGraphic("assets/images/BarryLogo.png", false);
		TitleLogo.screenCenter();
		add(TitleLogo);
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}
	private function SwitchScene(timer:FlxTimer):Void
	{
		FlxG.switchState(new MainMenuState());
	}
}
