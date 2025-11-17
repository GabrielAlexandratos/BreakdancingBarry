package;

import flash.system.System;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxTimer;

class TitleState extends FlxState {

    private var Background:FlxSprite;
    private var BackgroundColor:FlxSprite;
    private var menuOptions:Array<FlxSprite>;
    private var selectedIndex:Int;
    private var isSelecting:Bool = false;
	private var ignoreMouseUntilMoved:Bool = false;
	private var prevMouseX:Float = -1;
	private var prevMouseY:Float = -1;

    override public function create() {
		ignoreMouseUntilMoved = false;
		prevMouseX = -1;
		prevMouseY = -1;
        super.create();

        BackgroundColor = new FlxSprite(0, 0);
        BackgroundColor.makeGraphic(FlxG.width, FlxG.height, 0xFF232323);
        add(BackgroundColor);

        Background = new FlxSprite(0, 0);
        Background.loadGraphic("assets/images/backgrounds/titlebackground.png", false);
		Background.origin.set(Background.width / 2, Background.height / 2 - 190);
		
		Background.screenCenter();
        add(Background);

		menuOptions = [];
		selectedIndex = 0;

		var menuOptionsScaleFactor = 1;

		var startOption = new FlxSprite(0, 0);
		startOption.loadGraphic("assets/images/mainmenu/startOption.png", false);
		startOption.origin.set(0, startOption.height / 2);
		startOption.scale.set(menuOptionsScaleFactor, menuOptionsScaleFactor);
		add(startOption);
		menuOptions.push(startOption);

		var optionsOption = new FlxSprite(0, 0);
		optionsOption.loadGraphic("assets/images/mainmenu/trackselectOption.png", false);
		optionsOption.origin.set(0, optionsOption.height / 2);
		optionsOption.scale.set(menuOptionsScaleFactor, menuOptionsScaleFactor);
		add(optionsOption);
		menuOptions.push(optionsOption);

		var exitOption = new FlxSprite(0, 0);
		exitOption.loadGraphic("assets/images/mainmenu/exitOption.png", false);
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
		var mousePos = FlxG.mouse.getWorldPosition();
		// re enable mouse selection if the mouse is moved
		var mouseMoved = (mousePos.x != prevMouseX) || (mousePos.y != prevMouseY);
		if (mouseMoved)
		{
			prevMouseX = mousePos.x;
			prevMouseY = mousePos.y;
			ignoreMouseUntilMoved = false;
		}

        if (!isSelecting)
        {
			// MOUSE SELECTING IN TITLE MENU
			if (!ignoreMouseUntilMoved)
			{
				for (i in 0...menuOptions.length)
				{
					var option = menuOptions[i];
					if (option.overlapsPoint(mousePos))
					{
						if (selectedIndex != i)
						{
							selectedIndex = i;
							FlxG.sound.play("assets/sounds/optionChangeSFX.mp3", 0.2);
							positionMenu();
						}

						if(FlxG.mouse.justPressed)
						{
							onSelect();
						}
					}
				}
			}
            
			//ignore mosue when keyboard is used
			if (FlxG.keys.justPressed.W || FlxG.keys.justPressed.UP)
            {
				ignoreMouseUntilMoved = true;
                var newIndex = Std.int(Math.max(0, selectedIndex - 1));
                if (newIndex != selectedIndex)
                {
                    selectedIndex = newIndex;
                    FlxG.sound.play("assets/sounds/optionChangeSFX.mp3", 0.2);
                    positionMenu();
                }
            }
            else if (FlxG.keys.justPressed.S || FlxG.keys.justPressed.DOWN)
            {
				ignoreMouseUntilMoved = true;
                var newIndex = Std.int(Math.min(menuOptions.length - 1, selectedIndex + 1));
                if (newIndex != selectedIndex)
                {
                    selectedIndex = newIndex;
                    FlxG.sound.play("assets/sounds/optionChangeSFX.mp3", 0.2);
                    positionMenu();
                }
            }
            if (FlxG.keys.justPressed.ENTER || FlxG.keys.justPressed.SPACE)
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
			option.y = (FlxG.height / 2 - option.height / 2) + i * spacing;

			// Swap sprite based on selection
			if (i == selectedIndex)
				option.loadGraphic("assets/images/mainmenu/" + getOptionName(i) + "_selected.png", false);
			else
				option.loadGraphic("assets/images/mainmenu/" + getOptionName(i) + ".png", false);
		}
	}

	private function getOptionName(index:Int):String
	{
		switch (index)
		{
			case 0:
				return "startOption";
			case 1:
				return "trackselectOption";
			case 2:
				return "exitOption";
			default:
				return "startOption";
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
				// choose transition effect to fade out if its story mode
				switch (selectedIndex)
				{
					case 0: // story mode
						StateTransitioner.fadeToBlackTransition();
						new FlxTimer().start(2, function(_)
						{
							executeOption(selectedIndex);
							isSelecting = false;
						});
					default: // anything else

						StateTransitioner.slideToBlackTransition();
						new FlxTimer().start(1, function(_)
						{
							executeOption(selectedIndex);
						 isSelecting = false;
						});	
				}
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
				trace("wrong");
		}
	}
}