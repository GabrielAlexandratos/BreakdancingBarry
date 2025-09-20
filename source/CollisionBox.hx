package;

import flixel.FlxSprite;
import flixel.util.FlxColor;

class CollisionBox extends FlxSprite
{
    public function new(x:Float, y:Float, width:Float, height:Float, ?debug:Bool = true, ?color:FlxColor = FlxColor.RED)
    {
        super(x, y);
        makeGraphic(Std.int(width), Std.int(height), debug ? color : FlxColor.TRANSPARENT);
        alpha = debug ? 0.4 : 0;
        immovable = true;
        solid = true;  // Enable collision
    }
}