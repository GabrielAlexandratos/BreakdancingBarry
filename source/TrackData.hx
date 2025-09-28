package;

class TrackData {

    public var name:String;
    public var artist:String;
    public var bpm:Float;
    public var difficulty:Int;
    public var song:String;
    public var backgroundPath:String;
    public var notesPath:String;
    public var opponentSpritePath:String;

    public function new(name:String, artist:String, bpm:Float, difficulty:Int, song:String, backgroundPath:String, notesPath:String, opponentSpritePath:String) {
        this.name = name;
        this.artist = artist;
        this.bpm = bpm;
        this.difficulty = difficulty;
        this.song = song;
        this.backgroundPath = backgroundPath;
        this.notesPath = notesPath;
        this.opponentSpritePath = opponentSpritePath;
    }
}