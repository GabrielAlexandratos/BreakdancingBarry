package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.math.FlxPoint;
import lime.app.Application;
import lime.ui.MouseCursor;

class OpeningState extends FlxState {

    private var clickToStartImage:FlxSprite;
    private var baseScale:Float = 0.5;

    override public function create() {

        super.create();
        FlxG.mouse.useSystemCursor = true;

        clickToStartImage = new FlxSprite(0, 0);
        clickToStartImage.loadGraphic(AssetPaths.clickToStartImage__png, false, 16, 16);
        clickToStartImage.origin.set(clickToStartImage.width / 2, clickToStartImage.height / 2);
        clickToStartImage.scale.set(baseScale, baseScale);
        clickToStartImage.alpha = 0.5;
        clickToStartImage.screenCenter();
        add(clickToStartImage);
    }
    
    override public function update(elapsed:Float) {

        super.update(elapsed);

        var mousePoint = FlxPoint.get(FlxG.mouse.x, FlxG.mouse.y);

        if (clickToStartImage.overlapsPoint(mousePoint)) {

            clickToStartImage.setGraphicSize(
                Std.int(clickToStartImage.frameWidth * (baseScale + 0.05)),
                Std.int(clickToStartImage.frameHeight * (baseScale + 0.05))
            );

            Application.current.window.cursor = MouseCursor.POINTER;

            clickToStartImage.updateHitbox();
            clickToStartImage.screenCenter();
        } 
        else {

            clickToStartImage.setGraphicSize(
                Std.int(clickToStartImage.frameWidth * baseScale),
                Std.int(clickToStartImage.frameHeight * baseScale)
            );

            clickToStartImage.updateHitbox();
            clickToStartImage.screenCenter();
            clickToStartImage.alpha = 0.5;
        }

        mousePoint.put();
    }
}
