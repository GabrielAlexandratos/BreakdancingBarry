package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxTimer;
import flixel.text.FlxText;

class TrackSelectState extends FlxState {

    private var Background:FlxSprite;
    private var BackgroundColor:FlxSprite;

    private var menuOptions:Array<FlxSprite>;
    private var selectedIndex:Int = 0;
    private var isSelecting:Bool = false;

	private var trackOptions:Array<TrackData>;
	private var trackInfo:FlxText;

    override public function create() {
        super.create();

        BackgroundColor = new FlxSprite(0, 0);
        BackgroundColor.makeGraphic(FlxG.width, FlxG.height, 0xFF4b4b4b);
        add(BackgroundColor);

        Background = new FlxSprite(0, 0);
        Background.loadGraphic("assets/images/backgrounds/trackselectbackground.png", false);
        Background.origin.set(Background.width / 2 - 20, Background.height / 2);
		Background.scale.set(0.305, 0.305);
        Background.screenCenter();
        add(Background);

		FlxG.sound.playMusic("assets/music/trackSelectLoop.mp3", 0.65, true);

		var songs = [
			new TrackData("track1", "artist1", 90, 3, "assets/music/titleLoop.mp3", "assets/images/backgrounds/optionsBackground.png", "assets/data/testChart.json", "images/mainmenu/exit.png")
		];

        // Options
        menuOptions = [];
		trackOptions = [];

        for (i in 0...songs.length) {
            var opt = new FlxSprite(0, 0);
            //opt.loadGraphic("assets/images/trackselect/" + songs[i] + ".png", false);
            opt.loadGraphic("assets/images/mainmenu/exitoption.png");
            opt.origin.set(0, opt.height / 2);
            add(opt);
            menuOptions.push(opt);
			// Track Data
			trackOptions.push(songs[i]);
        }

		trackInfo = new FlxText(FlxG.width-300, 20, 280, "");
		trackInfo.setFormat(null, 32, 0xFFFFFFFF, "right");
		add(trackInfo);
		updateTrackInfo();

		StateTransitioner.init(this);

		StateTransitioner.slideFromBlackTransition();

        positionMenu();
    }

    override public function update(elapsed:Float) {
        super.update(elapsed);

        if (!isSelecting) {
            if (FlxG.keys.justPressed.W) {
				FlxG.sound.play("assets/sounds/optionChangeSFX.mp3", 0.2);
                selectedIndex = Std.int(Math.max(0, selectedIndex - 1));
                positionMenu();
            } else if (FlxG.keys.justPressed.S) {
				FlxG.sound.play("assets/sounds/optionChangeSFX.mp3", 0.2);
                selectedIndex = Std.int(Math.min(menuOptions.length - 1, selectedIndex + 1));
                positionMenu();
            }
			updateTrackInfo();
			if (FlxG.keys.justPressed.ENTER && !isSelecting)
			{
				isSelecting = true;
				FlxG.sound.music.stop();
				FlxG.sound.play("assets/sounds/fightSFX.mp3", 5.0);

				var selectedTrack = trackOptions[selectedIndex];
				var selectedOption = menuOptions[selectedIndex];
				var blinkTimer = new FlxTimer();
				var blinkCount = 0;
				blinkTimer.start(0.1, function(tmr:FlxTimer)
				{
					selectedOption.visible = !selectedOption.visible;
					blinkCount++;
					if (blinkCount >= 20)
					{
						selectedOption.visible = true;
						loadTrack(selectedTrack);
					}
				}, 20);
			}
        }
		if (FlxG.keys.justPressed.ESCAPE)
		{
			returnToTitle();
		}
    }

    private function positionMenu():Void {
		var spacing = 200;
        for (i in 0...menuOptions.length) {
            var option = menuOptions[i];
            var offset = i - selectedIndex;

            var targetY = (FlxG.height / 2 - option.height / 2) + (offset * spacing);

            var targetX = (offset == 0) ? 300 : 200 - Math.abs(offset) * 100;

			var scaleFactor = 1 - 0.3 * Math.abs(offset);
			FlxTween.tween(option, {x: targetX, y: targetY}, 0.3, {ease: FlxEase.expoOut});
			FlxTween.tween(option.scale, {x: scaleFactor, y: scaleFactor}, 0.3, {ease: FlxEase.expoOut});
		}
	}

	private function returnToTitle():Void
	{
		FlxG.sound.play("assets/sounds/stateBackSFX.mp3", 0.5);
		FlxG.sound.music.stop();
		StateTransitioner.slideToBlackTransition();
		new FlxTimer().start(1, function(_)
		{
			FlxG.sound.playMusic("assets/music/titleIntro.mp3", 0.6);
			FlxG.sound.music.onComplete = function()
			{
				FlxG.sound.playMusic(AssetPaths.titleLoop__mp3, 0.6, true);
			};
			FlxG.switchState(TitleState.new);
		});
    }
	private function loadTrack(track:TrackData):Void
	{
		FlxG.sound.music.stop();

		FlxG.switchState(() -> new BattleState(track));
	}

	private function updateTrackInfo():Void {
	    if (trackOptions.length > 0) {
	        var track = trackOptions[selectedIndex];
	        trackInfo.text = "Title: " + track.name + "\n"
	            + "Artist: " + track.artist + "\n"
	            + "BPM: " + track.bpm + "\n"
	            + "Difficulty: " + track.difficulty;
	    }
	}
}