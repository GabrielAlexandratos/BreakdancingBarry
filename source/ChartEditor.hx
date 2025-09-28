package;

import flixel.FlxState;
import flixel.FlxSprite;
import flixel.FlxG;
import flixel.text.FlxText;
import flixel.group.FlxGroup;
import haxe.Json;
import openfl.utils.Assets;
import openfl.net.FileReference;

class ChartEditor extends FlxState
{
    var timeline:FlxSprite;
    var playhead:FlxSprite;
    var notes:FlxGroup;
    var noteData:Array<{time:Float, lane:Int}> = []; // no hit flag needed
    var scrollOffset:Float = 0;
    var pausedTime:Float = 0;

    var isPlaying:Bool = false;
    var currentSong:String = "assets/music/titleLoop.mp3";
    var lastSongPos:Float = 0;

    override public function create():Void
    {
        super.create();

        timeline = new FlxSprite(0, FlxG.height/2 - 20);
        timeline.makeGraphic(4000, 40, 0xFFAAAAAA);
        add(timeline);

        playhead = new FlxSprite(FlxG.width/2, timeline.y - 50);
        playhead.makeGraphic(4, 100, 0xFFFF0000);
        add(playhead);

        notes = new FlxGroup();
        add(notes);

        FlxG.sound.playMusic(currentSong, 0.1, false);
        FlxG.sound.music.pause();

        var info = new FlxText(10, 10, 400, "Controls:\n[Click] place note\n[X] remove note\n[Space] play/pause\n[S] save\n[L] load\n[Arrow keys] scroll");
        info.setFormat(null, 16, 0xFFFFFFFF, "left");
        add(info);
    }

    override public function update(elapsed:Float):Void
    {
        super.update(elapsed);

        if (FlxG.keys.pressed.RIGHT) {
            scrollOffset += 500 * elapsed;
            pausedTime = (scrollOffset / timeline.width) * (FlxG.sound.music.length / 1000);
        }
        if (FlxG.keys.pressed.LEFT) {
            scrollOffset -= 500 * elapsed;
            pausedTime = (scrollOffset / timeline.width) * (FlxG.sound.music.length / 1000);
        }

        timeline.x = -scrollOffset;
        for (i in 0...notes.members.length) {
            if (notes.members[i] != null) {
                var note = cast(notes.members[i], FlxSprite);
                var noteTime = noteData[i].time;
                var noteWorldX = (noteTime / (FlxG.sound.music.length/1000)) * timeline.width;
                note.x = noteWorldX - scrollOffset;
            }
        }

        if (FlxG.mouse.justPressed)
        {
            var worldX = FlxG.mouse.x + scrollOffset;
            var time = (worldX / timeline.width) * FlxG.sound.music.length / 1000;
            var lane = 0;

            noteData.push({time: time, lane: lane});
            var n = new FlxSprite(worldX - scrollOffset, timeline.y - 20);
            n.makeGraphic(20, 20, 0xFF00FF00);
            notes.add(n);
        }

        if (FlxG.keys.justPressed.X)
        {
            var worldX = FlxG.mouse.x + scrollOffset;
            var closest = -1;
            var minDist = 9999.0;

            for (i in 0...noteData.length)
            {
                var noteX = (noteData[i].time / (FlxG.sound.music.length/1000)) * timeline.width;
                var dist = Math.abs(noteX - worldX);
                if (dist < minDist && dist < 30) {
                    minDist = dist;
                    closest = i;
                }
            }

            if (closest != -1)
            {
                noteData.splice(closest, 1);
                notes.remove(notes.members[closest], true);
            }
        }

        if (FlxG.keys.justPressed.SPACE)
        {
            if (isPlaying)
            {
                // Pause the song
                FlxG.sound.music.pause();
                pausedTime = FlxG.sound.music.time / 1000;
            }
            else
            {
                // Resume song from current playhead position
                var songPos = ((scrollOffset + FlxG.width / 2) / timeline.width) * (FlxG.sound.music.length / 1000);
                FlxG.sound.music.time = songPos * 1000;
                FlxG.sound.music.play();
            }
            isPlaying = !isPlaying;
        }

        if (FlxG.keys.justPressed.S)
        {
            var data = {
                song: currentSong,
                notes: noteData
            };
            var fileRef = new FileReference();
            fileRef.save(Json.stringify(data, null, "  "), "chart.json");
        }

        if (FlxG.keys.justPressed.L)
        {
            var content = Assets.getText("assets/data/chart.json");
            var data:Dynamic = Json.parse(content);
            noteData = data.notes;

            notes.clear();
            for (note in noteData)
            {
                var worldX = (note.time / (FlxG.sound.music.length/1000)) * timeline.width;
                var n = new FlxSprite(worldX - scrollOffset, timeline.y - 20);
                n.makeGraphic(20, 20, 0xFF00FF00);
                notes.add(n);
            }
        }

        if (isPlaying)
        {
            var songPos = FlxG.sound.music.time / 1000;

            for (i in 0...noteData.length)
            {
                var note = noteData[i];
                var noteSprite = cast(notes.members[i], FlxSprite);
                if (noteSprite == null) continue;

                // Trigger note when playhead is within 0.02s of note time
                if (Math.abs(songPos - note.time) < 0.02)
                {
                    FlxG.sound.play("assets/sounds/dialogueBlipSFX.mp3", 0.25);
                    noteSprite.makeGraphic(20, 20, 0xFFFF0000); // red
                }
                else if (songPos > note.time + 0.05)
                {
                    noteSprite.makeGraphic(20, 20, 0xFF00FF00); // green
                }
            }

            lastSongPos = songPos;

            var targetOffset = (songPos / (FlxG.sound.music.length / 1000)) * timeline.width - FlxG.width/2;
            scrollOffset += (targetOffset - scrollOffset) * 0.1;

            timeline.x = -scrollOffset;
            for (i in 0...notes.members.length) {
                if (notes.members[i] != null) {
                    var n = cast(notes.members[i], FlxSprite);
                    var noteTime = noteData[i].time;
                    var noteWorldX = (noteTime / (FlxG.sound.music.length / 1000)) * timeline.width;
                    n.x = noteWorldX - scrollOffset;
                }
            }

            playhead.x = FlxG.width / 2;
        }
    }
}