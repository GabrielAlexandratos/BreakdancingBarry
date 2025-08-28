package;

import flash.system.System;
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
	private var isSelecting:Bool = false;

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
		// add(TitleLogo);
		menuOptions = [];
		selectedIndex = 0;

		var menuOptionsScaleFactor = 0.85;

		var startOption = new FlxSprite(0, 0);
		startOption.loadGraphic("assets/images/mainmenu/storymode.png", false);
		startOption.origin.set(0, startOption.height / 2);
		startOption.scale.set(menuOptionsScaleFactor, menuOptionsScaleFactor);
		add(startOption);
		menuOptions.push(startOption);

		var optionsOption = new FlxSprite(0, 0);
		optionsOption.loadGraphic("assets/images/mainmenu/trackselect.png", false);
		optionsOption.origin.set(0, optionsOption.height / 2);
		optionsOption.scale.set(menuOptionsScaleFactor, menuOptionsScaleFactor);
		add(optionsOption);
		menuOptions.push(optionsOption);

		var exitOption = new FlxSprite(0, 0);
		exitOption.loadGraphic("assets/images/mainmenu/exitoption.png", false);
		exitOption.origin.set(0, exitOption.height / 2);
		exitOption.scale.set(menuOptionsScaleFactor, menuOptionsScaleFactor);
		add(exitOption);
		menuOptions.push(exitOption);

		StateTransitioner.init(this);

		StateTransitioner.slideFromBlackTransition();
		
		positionMenu();
	}

	override public function update(elapsed:Float) {

		super.update(elapsed);
		if (!isSelecting)
		{
			if (FlxG.keys.justPressed.W)
			{
				FlxG.sound.play("assets/sounds/optionChangeSFX.mp3", 0.2);
				selectedIndex = Std.int(Math.max(0, selectedIndex - 1));
				positionMenu();
			}
			else if (FlxG.keys.justPressed.S)
			{
				FlxG.sound.play("assets/sounds/optionChangeSFX.mp3", 0.2);
				selectedIndex = Std.int(Math.min(menuOptions.length - 1, selectedIndex + 1));
				positionMenu();
			}
			if (FlxG.keys.justPressed.ENTER)
			{
				onSelect();
			}
		}
	}

	private function positionMenu():Void
	{
		var spacing = 120;
		var middleIndex = Std.int(menuOptions.length / 2);
		for (i in 0...menuOptions.length)
		{
			var option = menuOptions[i];
			option.y = (FlxG.height / 2 - option.height / 2) + (i - middleIndex) * spacing;
			var targetX = (i == selectedIndex) ? 115 : 30;
			FlxTween.tween(option, {x: targetX}, 0.2, {ease: FlxEase.expoOut});

			// Swap sprite based on selection
			if (i == selectedIndex)
				option.loadGraphic("assets/images/mainmenu/" + getOptionName(i) + "_selected.png", false);
			else
				option.loadGraphic("assets/images/mainmenu/" + getOptionName(i) + ".png", false);
			// re set the origin for the new graphic
			option.origin.set(0, option.height / 2);
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

	private function onSelect():Void
	{
		isSelecting = true;
		FlxG.sound.music.stop();
		FlxG.sound.play("assets/sounds/fightSFX.mp3", 5.0);

		var option = menuOptions[selectedIndex];
		var blinkTimer = new FlxTimer();
		var blinkCount = 0;

		blinkTimer.start(0.1, function(tmr:FlxTimer)
		{
			option.visible = !option.visible;
			blinkCount++;
			if (blinkCount >= 20)
			{
				option.visible = true;
				// choose transition depending on selected option
				switch (selectedIndex)
				{
					case 0: // story mode
						StateTransitioner.fadeToBlackTransition();
					default:
						StateTransitioner.slideToBlackTransition();
				}

				new FlxTimer().start(1, function(_)
				{
				executeOption(selectedIndex);
				isSelecting = false;
				});
			}
		}, 20);
	}

	private function executeOption(index:Int):Void
	{
		switch (index)
		{
			case 0: // story mode
				FlxG.switchState(OpeningMonologueState.new);
			case 1: // track select
				FlxG.switchState(TrackSelectState.new);
			case 2: // exit
				System.exit(0);
			default:
				trace("Unknown option");
		}
	}
}
