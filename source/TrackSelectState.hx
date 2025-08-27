package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;

class TrackSelectState extends FlxState {

    private var Background:FlxSprite;
    private var BackgroundColor:FlxSprite;

    private var menuOptions:Array<FlxSprite>;
    private var selectedIndex:Int = 0;
    private var isSelecting:Bool = false;

    override public function create() {
        super.create();

        BackgroundColor = new FlxSprite(0, 0);
        BackgroundColor.makeGraphic(FlxG.width, FlxG.height, 0xFF4b4b4b);
        add(BackgroundColor);

        Background = new FlxSprite(0, 0);
        Background.loadGraphic("assets/images/backgrounds/trackselectbackground.png", false);
        Background.origin.set(Background.width / 2 - 20, Background.height / 2);
        Background.scale.set(0.205, 0.205);
        Background.screenCenter();
        add(Background);

        // Options
        menuOptions = [];

        var songs = ["track1", "track2", "track3", "track4", "track5"];
        for (i in 0...songs.length) {
            var opt = new FlxSprite(0, 0);
            //opt.loadGraphic("assets/images/trackselect/" + songs[i] + ".png", false);
            opt.loadGraphic("assets/images/mainmenu/exitoption.png");
            opt.origin.set(0, opt.height / 2);
            add(opt);
            menuOptions.push(opt);
        }

        positionMenu();
    }

    override public function update(elapsed:Float) {
        super.update(elapsed);

        if (!isSelecting) {
            if (FlxG.keys.justPressed.W) {
                selectedIndex = Std.int(Math.max(0, selectedIndex - 1));
                positionMenu();
            } else if (FlxG.keys.justPressed.S) {
                selectedIndex = Std.int(Math.min(menuOptions.length - 1, selectedIndex + 1));
                positionMenu();
            }
        }
    }

    private function positionMenu():Void {
        var spacing = 200; // vertical spacing
        for (i in 0...menuOptions.length) {
            var option = menuOptions[i];
            var offset = i - selectedIndex;

            // Y position -> center + offset * spacing
            var targetY = (FlxG.height / 2 - option.height / 2) + (offset * spacing);

            // X position -> selected option is further to the right
            var targetX = (offset == 0) ? 300 : 200 - Math.abs(offset) * 100;

            FlxTween.tween(option, {x: targetX, y: targetY}, 0.2, {ease: FlxEase.quadOut});
        }
    }
}