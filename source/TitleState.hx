package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxTimer;

class TitleState extends FlxState {

	private var TitleLogo:FlxSprite;
    private var Background:FlxSprite;
    private var BackgroundColor:FlxSprite;
	private var menuOptions:Array<FlxSprite>;
	private var selectedIndex:Int;

	override public function create() {

		super.create();

        BackgroundColor = new FlxSprite(0, 0);
        BackgroundColor.makeGraphic(FlxG.width, FlxG.height, 0xFF4B4B4B);
        add(BackgroundColor);

        Background = new FlxSprite(0, 0);
        Background.loadGraphic("assets/images/backgrounds/titlebackground.png", false);
        Background.origin.set(Background.width / 2, Background.height / 2 - 190);
		Background.scale.set(0.72, 0.72);
		
		Background.screenCenter();
        add(Background);

		TitleLogo = new FlxSprite(0, 0);
		TitleLogo.loadGraphic("assets/images/BarryLogo.png", false);
		TitleLogo.origin.set(TitleLogo.width / 2 - 30, TitleLogo.height / 2 - 270);
        TitleLogo.scale.set(0.3, 0.3);
		TitleLogo.screenCenter();
		add(TitleLogo);
		menuOptions = [];
		selectedIndex = 0;

		var startOption = new FlxSprite(0, 0);
		startOption.loadGraphic("assets/images/mainmenu/play.png", false);
		startOption.scale.set(0.5, 0.5);
		add(startOption);
		menuOptions.push(startOption);

		var optionsOption = new FlxSprite(0, 0);
		optionsOption.loadGraphic("assets/images/mainmenu/options.png", false);
		optionsOption.scale.set(0.5, 0.5);
		add(optionsOption);
		menuOptions.push(optionsOption);

		var exitOption = new FlxSprite(0, 0);
		exitOption.loadGraphic("assets/images/mainmenu/exit.png", false);
		exitOption.scale.set(0.5, 0.5);
		add(exitOption);
		menuOptions.push(exitOption);

		positionMenu();
	}

	override public function update(elapsed:Float) {

		super.update(elapsed);
		if (FlxG.keys.justPressed.W)
		{
			selectedIndex = Std.int(Math.max(0, selectedIndex - 1));
			positionMenu();
		}
		else if (FlxG.keys.justPressed.S)
		{
			selectedIndex = Std.int(Math.min(menuOptions.length - 1, selectedIndex + 1));
			positionMenu();
		}
	}

	private function positionMenu():Void
	{
		var spacing = 100;
		for (i in 0...menuOptions.length)
		{
			var option = menuOptions[i];
			var targetY = FlxG.height / 2 + (i - selectedIndex) * spacing;
			FlxTween.tween(option, {y: targetY}, 0.3, {ease: FlxEase.quadOut});

			if (i == selectedIndex)
			{
				option.loadGraphic("assets/images/mainmenu/" + getOptionName(i) + "_selected.png", false);
			}
			else
			{
				option.loadGraphic("assets/images/mainmenu/" + getOptionName(i) + ".png", false);
			}
			option.origin.set(option.width / 2, option.height / 2);
			option.x = FlxG.width / 2;
		}
	}

	private function getOptionName(index:Int):String
	{
		switch (index)
		{
			case 0:
				return "start";
			case 1:
				return "options";
			case 2:
				return "exit";
			default:
				return "start";
		}
	}

	private function SwitchScene(timer:FlxTimer):Void {

		FlxG.switchState(MainMenuState.new);
	}
}
