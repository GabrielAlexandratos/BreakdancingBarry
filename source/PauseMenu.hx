import flixel.FlxSprite;
import flixel.group.FlxSpriteGroup;
import flixel.FlxG;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;

class PauseMenu extends FlxSpriteGroup
{
    public var background:FlxSprite;
    public var pausedText:FlxSprite;
    var bgTween:FlxTween;
    var textTween:FlxTween;

    public function new()
    {
        super();
        
        // Background
        background = new FlxSprite(0, FlxG.height + 25);
        background.makeGraphic(FlxG.width, FlxG.height + 25, 0x9C000000);
        add(background);

        // Paused text
        pausedText = new FlxSprite();
        pausedText.loadGraphic("assets/images/paused.png");

        // Center origin
        pausedText.centerOffsets();

        // Center X on screen
        pausedText.x = FlxG.width / 2 - pausedText.width/2;

        // Start above screen (origin accounted for)
        pausedText.y = -pausedText.height / 2;

        add(pausedText);
    }

    public function slideIn():Void
    {
        // Stop any active tweens
        if (bgTween != null) bgTween.cancel();
        if (textTween != null) textTween.cancel();

        // Reset positions
        background.y = FlxG.height + 25;
        pausedText.y = -pausedText.height / 2;

        // Start new tweens
        bgTween = FlxTween.tween(background, {y: -25}, 0.6, {ease: FlxEase.expoOut});
        textTween = FlxTween.tween(pausedText, {y: FlxG.height / 2}, 0.8, {ease: FlxEase.expoOut});
    }


    public function disable():Void
    {
        background.y = FlxG.height + 25;
        pausedText.y = -pausedText.height / 2;
    }
}
