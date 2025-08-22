package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.math.FlxPoint;
import flixel.util.FlxTimer;
import lime.app.Application;
import lime.ui.MouseCursor;

class OpeningState extends FlxState {

    private var clickToStartImage:FlxSprite;
	private var openingMovie:FlxSprite;
    private var baseScale:Float = 0.5;
	private var hasClickedStart = false;
	private var currentFrame:Int = 0;
	private var frameTimer:Float = 0;

    override public function create() {

        super.create();
        FlxG.mouse.useSystemCursor = true;

        clickToStartImage = new FlxSprite(0, 0);
		clickToStartImage.loadGraphic("assets/images/clickToStartImage.png", false, 16, 16);
        clickToStartImage.origin.set(clickToStartImage.width / 2, clickToStartImage.height / 2);
        clickToStartImage.scale.set(baseScale, baseScale);
        clickToStartImage.alpha = 0.5;
        clickToStartImage.screenCenter();
        add(clickToStartImage);
		openingMovie = new FlxSprite(0, 0);
		openingMovie.loadGraphic("assets/images/openingMovie/opening0001.png", false);
		openingMovie.screenCenter();
		add(openingMovie);
    }
    
    override public function update(elapsed:Float) {

        super.update(elapsed);

		// Update frame timer and switch frames at 24 fps
		if (currentFrame < 84)
		{
			frameTimer += elapsed;
			if (frameTimer >= 1.0 / 24.0)
			{
				frameTimer -= 1.0 / 24.0;
				currentFrame++;
				var frameNumber = currentFrame + 1;
				var frameString = frameNumber < 10 ? "000" + frameNumber : (frameNumber < 100 ? "00" + frameNumber : "0" + frameNumber);
				openingMovie.loadGraphic("assets/images/openingMovie/opening" + frameString + ".png", false);
				openingMovie.screenCenter();
			}
		}

        var mousePoint = FlxPoint.get(FlxG.mouse.x, FlxG.mouse.y);

        if (clickToStartImage.overlapsPoint(mousePoint)) {

			if (FlxG.mouse.pressed)
			{
				new FlxTimer().start(1, SwitchScene);
			}

            clickToStartImage.setGraphicSize(
                Std.int(clickToStartImage.frameWidth * (baseScale + 0.05)),
                Std.int(clickToStartImage.frameHeight * (baseScale + 0.05))
            );

            Application.current.window.cursor = MouseCursor.POINTER;

            clickToStartImage.updateHitbox();
            clickToStartImage.screenCenter();
        } 
        else {

			if (hasClickedStart)
			{
				clickToStartImage.setGraphicSize(Std.int(clickToStartImage.frameWidth * (baseScale + 0.07)),
					Std.int(clickToStartImage.frameHeight * (baseScale + 0.07)));

				clickToStartImage.updateHitbox();
				clickToStartImage.screenCenter();
			}
			else
			{
				clickToStartImage.setGraphicSize(Std.int(clickToStartImage.frameWidth * baseScale), Std.int(clickToStartImage.frameHeight * baseScale));

				clickToStartImage.updateHitbox();
				clickToStartImage.screenCenter();
				clickToStartImage.alpha = 0.5;
			}

		}

        mousePoint.put();
	}

	private function SwitchScene(timer:FlxTimer):Void
	{
		FlxG.switchState(PlayState.new);
    }
}
