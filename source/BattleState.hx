package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;

class BattleState extends FlxState {
	public var track:TrackData;
	private var infoText:FlxText;
	private var tempBackgroundColour:FlxSprite;
	private var player:FlxSprite;
	private var opponent:FlxSprite;
	private var currentSpriteState:Int = 1;
	private var spriteTimer:Float = 0;
	private var isAnimating:Bool = false;
	private var punchHangTime:Float = 0.435;
	
	// Add these new variables at the top with other private vars
	private var secondsPerBeat:Float;
	private var score:Int = 0;
	private var scoreText:FlxText;
	private var lastScoreText:FlxText;
	
	// Add these variables at the top with other private vars
	private var lastBeat:Int = -1;
    
    public function new(track:TrackData) {
        super();
        this.track = track;
    }

	override public function create():Void
	{
		super.create();

		FlxG.sound.playMusic("assets/music/TestClick.mp3", true);

		tempBackgroundColour = new FlxSprite();
		tempBackgroundColour.makeGraphic(FlxG.width, FlxG.height, 0xFFAFAFAF);
		add(tempBackgroundColour);

		player = new FlxSprite();
		player.loadGraphic("assets/images/characters/barryAnims/Fighting/sketch_anims0001.png");
		player.setPosition(FlxG.width - 1100, FlxG.height - 700);
		add(player);
        
		infoText = new FlxText(20, 20, 20, "");
		infoText.setFormat(null, 28, 0xFF000000, "center");
		infoText.wordWrap = true;
		infoText.alignment = "left";
		infoText.fieldWidth = FlxG.width - 40;
		add(infoText);
        
        infoText.text = "Title: " + track.name + "\n" + "Artist: " + track.artist + "\n" + "BPM:" + track.bpm + "\n" + "Difficulty: " + track.difficulty;
        
        // Calculate seconds per beat (60 seconds / BPM)
        secondsPerBeat = 60 / track.bpm;
        
        // Add score display
        scoreText = new FlxText(20, FlxG.height - 60, FlxG.width - 40, "Score: 0");
        scoreText.setFormat(null, 28, 0xFF000000, "left");
        add(scoreText);
        
        lastScoreText = new FlxText(20, FlxG.height - 100, FlxG.width - 40, "");
        lastScoreText.setFormat(null, 24, 0xFF000000, "left");
        add(lastScoreText);
}

	override public function update(elapsed:Float):Void {
        super.update(elapsed);

        // Play sound on each beat
        var currentSongPosition = FlxG.sound.music.time / 1000; // in seconds
        var currentBeat = Math.floor(currentSongPosition / secondsPerBeat);
        
        if (currentBeat > lastBeat) {
            //FlxG.sound.play("assets/sounds/volumeBlipSFX.mp3"); // <-- music track (need to be passed through from track select)
            lastBeat = currentBeat;
        }

        if (FlxG.keys.justPressed.P) {
            var currentSongPosition = FlxG.sound.music.time / 1000;
            var currentBeat = Math.floor(currentSongPosition / secondsPerBeat);
            var nextBeatTime = (currentBeat + 1) * secondsPerBeat;
            var currentBeatTime = currentBeat * secondsPerBeat;
            
            // Find prox to nearest beat
            var distanceToBeat = currentSongPosition - currentBeatTime;
            var perfectWindow = 0.1; // 100ms
            
            // Check if punch is perfect
            var isPerfect = distanceToBeat > (secondsPerBeat - perfectWindow) || 
                           distanceToBeat < perfectWindow;
            
            // find score based on timing
            var pointsAwarded = 0;
            if (isPerfect) {
                pointsAwarded = 100;
                lastScoreText.text = "PERFECT!";
            } else if (distanceToBeat < 0.2 || distanceToBeat > (secondsPerBeat - 0.2)) {
                pointsAwarded = 50;
                lastScoreText.text = "GOOD";
            } else {
                lastScoreText.text = "MISS";
            }
            
            score += pointsAwarded;
            scoreText.text = "Score: " + score;

            switch (currentSpriteState) {
                case 1:
                    currentSpriteState = 2;
                    player.loadGraphic("assets/images/characters/barryAnims/Fighting/sketch_anims0002.png");
                    isAnimating = true;
                    spriteTimer = 0;
                case 2:
                    currentSpriteState = 3;
                    player.loadGraphic("assets/images/characters/barryAnims/Fighting/sketch_anims0003.png");
                    isAnimating = true;
                    spriteTimer = 0;
                case 3:
                    currentSpriteState = 2;
                    player.loadGraphic("assets/images/characters/barryAnims/Fighting/sketch_anims0002.png");
                    isAnimating = true;
                    spriteTimer = 0;
            }
        }

        if (isAnimating) {
            spriteTimer += elapsed;
            if (spriteTimer >= punchHangTime) {
                isAnimating = false;
                spriteTimer = 0;
                if (currentSpriteState != 1) {
                    currentSpriteState = 1;
                    player.loadGraphic("assets/images/characters/barryAnims/Fighting/sketch_anims0001.png");
                }
            }
        }
    }
}