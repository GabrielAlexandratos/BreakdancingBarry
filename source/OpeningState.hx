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
	private var startClicked:Bool = false;
	private var openingFinished:Bool = false;

	private var currentFrame:Int = 0;
	private var frameTimer:Float = 0;
	private var playingOpening:Bool = false;

	override public function create()
	{
        super.create();
        FlxG.mouse.useSystemCursor = true;

		// click to start image
        clickToStartImage = new FlxSprite(0, 0);
		clickToStartImage.loadGraphic("assets/images/clickToStartImage.png", false, 16, 16);
        clickToStartImage.origin.set(clickToStartImage.width / 2, clickToStartImage.height / 2);
        clickToStartImage.scale.set(baseScale, baseScale);
        clickToStartImage.alpha = 0.5;
        clickToStartImage.screenCenter();
        add(clickToStartImage);

		// opening movie
		openingMovie = new FlxSprite(0, 0);
		openingMovie.loadGraphic("assets/images/openingMovie/opening0001.png", false);
		openingMovie.scale.set(0.8, 0.8);
		openingMovie.origin.set(openingMovie.width / 2, openingMovie.height / 2);
		openingMovie.updateHitbox();
		openingMovie.screenCenter();
		openingMovie.visible = false;
		add(openingMovie);
    }
    
	override public function update(elapsed:Float)
	{
        super.update(elapsed);

		if (playingOpening)
		{
			if (currentFrame < 43)
			{
				frameTimer += elapsed;
				if (frameTimer >= 1.0 / 18.0) 
				{
					frameTimer -= 1.0 / 18.0;
					currentFrame++;
					var frameNumber = currentFrame + 1;
					var frameString = frameNumber < 10 ? "000" + frameNumber : (frameNumber < 100 ? "00" + frameNumber : "0" + frameNumber);
					openingMovie.loadGraphic("assets/images/openingMovie/opening" + frameString + ".png", false);
					openingMovie.screenCenter();
				}
			}
			else if (!openingFinished)
			{
				openingFinished = true;
				new FlxTimer().start(2, SwitchScene);
			}
			return; 
		}

        var mousePoint = FlxPoint.get(FlxG.mouse.x, FlxG.mouse.y);

        if (clickToStartImage.overlapsPoint(mousePoint)) {
			if (FlxG.mouse.justPressed && !startClicked)
			{
				startClicked = true;
				new FlxTimer().start(1, function(_)
				{
					clickToStartImage.visible = false;
					openingMovie.visible = true;
					playingOpening = true;
				});
			}

            clickToStartImage.setGraphicSize(
                Std.int(clickToStartImage.frameWidth * (baseScale + 0.05)),
                Std.int(clickToStartImage.frameHeight * (baseScale + 0.05))
            );

			Application.current.window.cursor = MouseCursor.POINTER;
			clickToStartImage.updateHitbox();
			clickToStartImage.screenCenter();
		}
		else
		{
			if (startClicked)
			{
				// Keep it a little bigger after being clicked
				clickToStartImage.setGraphicSize(Std.int(clickToStartImage.frameWidth * (baseScale + 0.05)),
					Std.int(clickToStartImage.frameHeight * (baseScale + 0.05)));
			}
			else
			{
				// Normal smaller size before clicking
				clickToStartImage.setGraphicSize(Std.int(clickToStartImage.frameWidth * baseScale), Std.int(clickToStartImage.frameHeight * baseScale));
			}

			clickToStartImage.updateHitbox();
			clickToStartImage.screenCenter();
			clickToStartImage.alpha = 0.5;
		}


        mousePoint.put();
	}

	private function SwitchScene(timer:FlxTimer):Void
	{
		FlxG.switchState(new PlayState());
    }
}
