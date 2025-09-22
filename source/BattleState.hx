package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.group.FlxGroup;
import haxe.Json;

class BattleState extends FlxState {
    public var track:TrackData;
    private var tempBackgroundColour:FlxSprite;
    private var player:FlxSprite;
    private var infoText:FlxText;

    private var score:Int = 0;
    private var scoreText:FlxText;
    private var lastScoreText:FlxText;

    private var secondsPerBeat:Float;
    private var notes:Array<Note>;
    private var noteSprites:FlxGroup;

    private var hitLineY:Float = 600;
    private var hitWindowPerfect:Float = 0.1; // seconds
    private var hitWindowGood:Float = 0.2;    // seconds

    public function new(track:TrackData) {
        super();
        this.track = track;
    }

    override public function create():Void {
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
        infoText.setFormat(null, 28, 0xFF000000, "left");
        infoText.fieldWidth = FlxG.width - 40;
        infoText.text = "Title: " + track.name + "\n" + "Artist: " + track.artist + "\n" + "BPM: " + track.bpm + "\n" + "Difficulty: " + track.difficulty;
        add(infoText);

        // Calculate seconds per beat
        secondsPerBeat = 60 / track.bpm;

        // Score
        scoreText = new FlxText(20, FlxG.height - 60, FlxG.width - 40, "Score: 0");
        scoreText.setFormat(null, 28, 0xFF000000, "left");
        add(scoreText);

        lastScoreText = new FlxText(20, FlxG.height - 100, FlxG.width - 40, "");
        lastScoreText.setFormat(null, 24, 0xFF000000, "left");
        add(lastScoreText);

        // Load note map from JSON
        var raw = flixel.util.FlxAssets.getText("assets/data/testTrack.json");
        notes = Json.parse(raw);

        noteSprites = new FlxGroup<NoteSprite>();
        add(noteSprites);

        // Preload all notes into sprites
        for (note in notes) {
            var sprite = new NoteSprite(note.beat, secondsPerBeat, hitLineY);
            noteSprites.add(sprite);
        }
    }

    override public function update(elapsed:Float):Void {
        super.update(elapsed);

        var currentSongPos = FlxG.sound.music.time / 1000; // seconds

        // Update note positions
        for (noteSprite in noteSprites) {
            noteSprite.updatePosition(currentSongPos);
        }

        // Player input
        if (FlxG.keys.justPressed.P) {
            checkHit(currentSongPos, "punch");
        }
    }

    private function checkHit(currentSongPos:Float, action:String):Void {
        var closest:Note = null;
        var closestSprite:NoteSprite = null;
        var minDiff:Float = 999;

        for (i in 0...notes.length) {
            var note = notes[i];
            if (note.action != action) continue;

            var noteTime = note.beat * secondsPerBeat;
            var diff = Math.abs(noteTime - currentSongPos);

            if (diff < minDiff) {
                minDiff = diff;
                closest = note;
                closestSprite = cast noteSprites.members[i];
            }
        }

        if (closest != null) {
            if (minDiff <= hitWindowPerfect) {
                score += 100;
                lastScoreText.text = "PERFECT!";
                closestSprite.kill();
            } else if (minDiff <= hitWindowGood) {
                score += 50;
                lastScoreText.text = "GOOD";
                closestSprite.kill();
            } else {
                lastScoreText.text = "MISS";
            }
        }

        scoreText.text = "Score: " + score;
    }
}
