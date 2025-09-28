package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import haxe.Json;
import openfl.utils.Assets;

class BattleState extends FlxState {
    public var track:TrackData;
    private var infoText:FlxText;
    private var player:FlxSprite;

    private var score:Int = 0;
    private var scoreText:FlxText;
    private var lastScoreText:FlxText;

    private var chart:Array<{time:Float, lane:Int, hit:Bool}> = [];
    private var hitWindow:Float = 0.15; // 150ms  window

    private var currentSpriteState:Int = 1;
    private var spriteTimer:Float = 0;
    private var isAnimating:Bool = false;
    private var punchHangTime:Float = 0.435;

    public function new(track:TrackData) {
        super();
        this.track = track;
    }

    override public function create():Void {
        super.create();

        // Load chart JSON
        var content = Assets.getText(track.notesPath);
        var data:Dynamic = Json.parse(content);
        var notes:Array<Dynamic> = cast data.notes; 
        for (note in notes) {
            chart.push({time: note.time, lane: note.lane, hit: false});
        }

        var bg = new FlxSprite(0, 0);
        bg.makeGraphic(FlxG.width, FlxG.height, 0xFF4B4B4B); // gray backgroun
        add(bg);

        player = new FlxSprite();
        player.loadGraphic("assets/images/characters/barryAnims/Fighting/sketch_anims0001.png");
        player.setPosition(FlxG.width - 1100, FlxG.height - 700);
        add(player);

        infoText = new FlxText(20, 20, FlxG.width - 40, 
            "Title: " + track.name + "\nArtist: " + track.artist + 
            "\nBPM: " + track.bpm + "\nDifficulty: " + track.difficulty);
        infoText.setFormat(null, 28, 0xFF000000, "left");
        add(infoText);

        scoreText = new FlxText(20, FlxG.height - 60, FlxG.width - 40, "Score: 0");
        scoreText.setFormat(null, 28, 0xFF000000, "left");
        add(scoreText);

        lastScoreText = new FlxText(20, FlxG.height - 100, FlxG.width - 40, "");
        lastScoreText.setFormat(null, 24, 0xFF000000, "left");
        add(lastScoreText);

        // Start music
        FlxG.sound.playMusic(track.song, 1.0, false);
    }

    override public function update(elapsed:Float):Void {
        super.update(elapsed);

        var songPos = FlxG.sound.music.time / 1000;

        if (FlxG.keys.justPressed.P) {
            var hitNote:Dynamic = null;
            var bestDiff:Float = hitWindow;

            // Find closest unhit note within window
            for (note in chart) {
                if (!note.hit) {
                    var diff = Math.abs(note.time - songPos);
                    if (diff < bestDiff) {
                        bestDiff = diff;
                        hitNote = note;
                    }
                }
            }

            if (hitNote != null) {
                hitNote.hit = true;

                if (bestDiff < 0.05) {
                    score += 100;
                    lastScoreText.text = "PERFECT!";
                } else if (bestDiff < 0.1) {
                    score += 50;
                    lastScoreText.text = "GOOD";
                } else {
                    score += 25;
                    lastScoreText.text = "OKAY";
                }

                scoreText.text = "Score: " + score;

                animatePunch();
            } else {
                lastScoreText.text = "MISS";
            }
        }

        if (isAnimating) {
            spriteTimer += elapsed;
            if (spriteTimer >= punchHangTime) {
                isAnimating = false;
                spriteTimer = 0;
                resetPlayerSprite();
            }
        }
    }

    private function animatePunch():Void {
        switch (currentSpriteState) {
            case 1:
                currentSpriteState = 2;
                player.loadGraphic("assets/images/characters/barryAnims/Fighting/sketch_anims0002.png");
            case 2:
                currentSpriteState = 3;
                player.loadGraphic("assets/images/characters/barryAnims/Fighting/sketch_anims0003.png");
            case 3:
                currentSpriteState = 2;
                player.loadGraphic("assets/images/characters/barryAnims/Fighting/sketch_anims0002.png");
        }
        isAnimating = true;
        spriteTimer = 0;
    }

    private function resetPlayerSprite():Void {
        currentSpriteState = 1;
        player.loadGraphic("assets/images/characters/barryAnims/Fighting/sketch_anims0001.png");
    }
}