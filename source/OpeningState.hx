package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.math.FlxPoint;
import flixel.system.scaleModes.PixelPerfectScaleMode;
import flixel.tweens.FlxTween;
import flixel.util.FlxTimer;
import lime.app.Application;
import lime.ui.MouseCursor;

class OpeningState extends FlxState {

    private var clickToStartImage:FlxSprite;
	private var openingMovie:FlxSprite;
	private var createdForNewgrounds:FlxSprite;
	private var createdForNewgrounds2:FlxSprite;
	private var barryIsBreakdancing:FlxSprite;
	private var madeByCredits1:FlxSprite;
	private var madeByCredits2:FlxSprite;
	private var ngToggleTimer:FlxTimer;
	private var showingAltNG:Bool = false;
	private var creditsToggleTimer:FlxTimer;
	private var showingAltCredits:Bool = false;
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
		FlxG.scaleMode = new PixelPerfectScaleMode();

		// click to start image
        clickToStartImage = new FlxSprite(0, 0);
		clickToStartImage.loadGraphic("assets/images/clickToStartImage.png", false, 16, 16);
        clickToStartImage.origin.set(clickToStartImage.width / 2, clickToStartImage.height / 2);
        clickToStartImage.scale.set(baseScale, baseScale);
        clickToStartImage.alpha = 0.5;
        clickToStartImage.screenCenter();
        add(clickToStartImage);

		// opening movie
		openingMovie = new FlxSprite();
		openingMovie.loadGraphic("assets/images/openingMovie/opening0001.png", false);
		openingMovie.scale.set(0.72, 0.72);
		openingMovie.origin.set(openingMovie.width / 2, openingMovie.height / 2);
		openingMovie.screenCenter();
		openingMovie.visible = false;
		add(openingMovie);
		// newgrounds Credit
		createdForNewgrounds = new FlxSprite();
		createdForNewgrounds.loadGraphic("assets/images/createdForNewgrounds.png", false);
		createdForNewgrounds.scale.set(0.72, 0.72);
		createdForNewgrounds.origin.set(createdForNewgrounds.width / 2, createdForNewgrounds.height / 2);
		createdForNewgrounds.screenCenter();
		createdForNewgrounds.visible = false;
		add(createdForNewgrounds);
		createdForNewgrounds2 = new FlxSprite();
		createdForNewgrounds2.loadGraphic("assets/images/createdForNewgrounds2.png", false);
		createdForNewgrounds2.scale.set(0.72, 0.72);
		createdForNewgrounds2.origin.set(createdForNewgrounds2.width / 2, createdForNewgrounds2.height / 2);
		createdForNewgrounds2.screenCenter();
		createdForNewgrounds2.visible = false;
		add(createdForNewgrounds2);
		// barry is breakdancing
		barryIsBreakdancing = new FlxSprite();
		barryIsBreakdancing.loadGraphic("assets/images/barryIsBreakdancing.png", false);
		barryIsBreakdancing.scale.set(0.72, 0.72);
		barryIsBreakdancing.origin.set(barryIsBreakdancing.width / 2, barryIsBreakdancing.height / 2);
		barryIsBreakdancing.screenCenter();
		barryIsBreakdancing.visible = false;
		add(barryIsBreakdancing);

		// made by credits
		madeByCredits1 = new FlxSprite();
		madeByCredits1.loadGraphic("assets/images/madeByCredits1.png", false);
		madeByCredits1.scale.set(0.72, 0.72);
		madeByCredits1.origin.set(madeByCredits1.width / 2, madeByCredits1.height / 2 - 50);
		madeByCredits1.screenCenter();
		madeByCredits1.visible = false;
		add(madeByCredits1);
		madeByCredits2 = new FlxSprite();
		madeByCredits2.loadGraphic("assets/images/madeByCredits2.png", false);
		madeByCredits2.scale.set(0.72, 0.72);
		madeByCredits2.origin.set(madeByCredits2.width / 2, madeByCredits2.height / 2 - 50);
		madeByCredits2.screenCenter();
		madeByCredits2.visible = false;
		add(madeByCredits2);
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
				}
			}
			else if (!openingFinished)
			{
				openingFinished = true;
				// Wait 0.5s before starting fade out
				new FlxTimer().start(0.5, function(_)
				{
					FlxTween.tween(openingMovie, {alpha: 0}, 1.5, {
						onComplete: function(_)
						{
							// Wait 0.5s after fade before showing createdForNewgrounds
							new FlxTimer().start(1.25, function(_)
							{
								openingMovie.visible = false;
								createdForNewgrounds.visible = true;
								createdForNewgrounds2.visible = false;
								showingAltNG = false;
								ngToggleTimer = new FlxTimer().start(0.5, function(timer:FlxTimer)
								{
									showingAltNG = !showingAltNG;
									createdForNewgrounds.visible = !showingAltNG;
									createdForNewgrounds2.visible = showingAltNG;
								}, 0); // repeat indefinitely

								new FlxTimer().start(5, function(_)
								{
									createdForNewgrounds.visible = false;
									createdForNewgrounds2.visible = false;

									if (ngToggleTimer != null)
										ngToggleTimer.cancel();
									new FlxTimer().start(0.5, function(timer:FlxTimer)
									{
										madeByCredits1.visible = true;
										madeByCredits2.visible = false;
										showingAltCredits = false;

										// Start alternating between the two credits
										creditsToggleTimer = new FlxTimer().start(0.5, function(timer:FlxTimer)
										{
											showingAltCredits = !showingAltCredits;
											madeByCredits1.visible = !showingAltCredits;
											madeByCredits2.visible = showingAltCredits;
										}, 0); 

										new FlxTimer().start(5.35, function(_)
										{
											madeByCredits1.visible = false;
											madeByCredits2.visible = false;

											if (creditsToggleTimer != null)
												creditsToggleTimer.cancel();

											SwitchScene(null);
										});
									});


								});
							});
						}
					});
				});
			}
			return; 
		}

        var mousePoint = FlxPoint.get(FlxG.mouse.x, FlxG.mouse.y);

        if (clickToStartImage.overlapsPoint(mousePoint)) {
			if (FlxG.mouse.justPressed && !startClicked)
			{
				startClicked = true;
				new FlxTimer().start(0.5, function(_)
				{
					FlxG.sound.playMusic(AssetPaths.titleIntro__mp3, 0.8, false);
					FlxG.sound.music.onComplete = function()
					{
						FlxG.sound.playMusic(AssetPaths.titleLoop__mp3, 0.8, true);
					};

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
				clickToStartImage.setGraphicSize(Std.int(clickToStartImage.frameWidth * (baseScale)), Std.int(clickToStartImage.frameHeight * (baseScale)));
			}
			else
			{
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
		FlxG.switchState(TitleState.new);
    }
}
