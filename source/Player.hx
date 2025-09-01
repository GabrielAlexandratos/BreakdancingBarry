package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.math.FlxPoint;

class Player extends FlxSprite {
    public var speed:Float = 250;
    public var canMove:Bool = true;

    public function new(x:Float, y:Float) {
        super(x, y);
        loadGraphic("assets/images/characters/barry.png", false);
        scale.set(0.7, 0.7);
        origin.set(width / 2, height / 2);
    }

    override public function update(elapsed:Float):Void {
        super.update(elapsed);

        var vel = FlxPoint.get();
        if (canMove) {
            if (FlxG.keys.pressed.W || FlxG.keys.pressed.UP) vel.y -= 1;
            if (FlxG.keys.pressed.S || FlxG.keys.pressed.DOWN) vel.y += 1;
            if (FlxG.keys.pressed.A || FlxG.keys.pressed.LEFT) vel.x -= 1;
            if (FlxG.keys.pressed.D || FlxG.keys.pressed.RIGHT) vel.x += 1;

            if (vel.x != 0 && vel.y != 0) vel.normalize();
            velocity.set(vel.x * speed, vel.y * speed);

            if (speed != 0) {
                // Flip sprite based on direction
                if (vel.x < 0) flipX = false;
                else if (vel.x > 0) flipX = true;
            }
        } else {
            velocity.set(0, 0);
        }
    }
}