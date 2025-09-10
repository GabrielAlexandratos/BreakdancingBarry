import flixel.FlxSprite;
import flixel.text.FlxText;
import flixel.FlxG;
import flixel.group.FlxSpriteGroup;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;

class PauseMenu extends FlxSpriteGroup
{
    public var background:FlxSprite;

    public function new()
    {
        super();
        
        // Start off-screen
        background = new FlxSprite(0, FlxG.height+25);
        background.makeGraphic(FlxG.width, FlxG.height+25, 0x88000000); 
        add(background);
    }

    // Call this after adding the PauseMenu to the state
    public function slideIn():Void
    {
        FlxTween.tween(background, {y: -25}, 1, {ease: FlxEase.expoOut});
    }

    public function disable():Void
    {
        background.y = FlxG.height;
    }
}