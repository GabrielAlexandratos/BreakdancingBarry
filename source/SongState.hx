package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;

class SongState extends FlxState {

    
	public var track:TrackData;
	private var infoText:FlxText;

    
    public function new(track:TrackData) {
        super();
        this.track = track;
    }

	override public function create():Void
	{
		super.create();
        
		infoText = new FlxText(20, 20, 20, "");
		infoText.setFormat(null, 28, 0xFFFFFFFF, "center");
		infoText.wordWrap = true;
		infoText.alignment = "left";
		infoText.fieldWidth = FlxG.width - 40;
		add(infoText);

        
        infoText.text = "Title: " + track.name + "\n" + "Artist: " + track.artist + "\n" + "BPM:" + track.bpm + "\n" + "Difficulty: " + track.difficulty;
    }

}