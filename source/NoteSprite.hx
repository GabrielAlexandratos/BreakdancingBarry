package;

import flixel.FlxSprite;
import flixel.FlxG;

class NoteSprite extends FlxSprite {
    public var targetBeat:Float;
    private var secondsPerBeat:Float;
    private var hitLineY:Float;

    public function new(targetBeat:Float, secondsPerBeat:Float, hitLineY:Float) {
        super();
        makeGraphic(40, 40, 0xFFFF0000);
        this.targetBeat = targetBeat;
        this.secondsPerBeat = secondsPerBeat;
        this.hitLineY = hitLineY;
        x = FlxG.width / 2 - 20;
        y = -100;
    }

    public function updatePosition(currentSongPos:Float):Void {
        var noteTime = targetBeat * secondsPerBeat;
        var timeUntilHit = noteTime - currentSongPos;

        var scrollSpeed = 300;

        y = hitLineY = (timeUntilHit * scrollSpeed);
    }
}