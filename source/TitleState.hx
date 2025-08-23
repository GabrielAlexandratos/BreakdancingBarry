package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.util.FlxTimer;

class TitleState extends FlxState {

	private var TitleLogo:FlxSprite;
    private var Background:FlxSprite;
    private var BackgroundColor:FlxSprite;

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
	}

	override public function update(elapsed:Float) {

		super.update(elapsed);
	}

	private function SwitchScene(timer:FlxTimer):Void {

		FlxG.switchState(MainMenuState.new);
	}
}
