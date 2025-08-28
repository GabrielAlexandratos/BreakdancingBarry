package;

import TrackOBJ;

class TrackRegistry {
    
    // name
    // artist
    // bpm
    // difficulty (1-5)
    // audioPath
    // backgroundPath
    // notesPath
    // opponentSpritePath

    var tracks:Array<TrackData>;
    
    var Track1 = new TrackData(
        "name",
        "Artist",
        120,
        3,
        "assets/music/track1.mp3",
        "assets/images/backgrounds/track1background.png",
        "assets/notes/track1.json",
        "assets/images/opponents/opponent1.png"
    );
}