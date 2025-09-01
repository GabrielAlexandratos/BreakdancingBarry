package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.math.FlxPoint;

class Player extends FlxSprite {
    // Movement vars
    public var speed:Float = 250;
    public var canMove:Bool = true;

    // Idle vars
    private var idleFrame:Int = 0;
    private var idleTimer:Float = 0;
    private var idleFPS:Float = 16;
    private var totalIdleFrames:Int = 16; 

    public function new(x:Float, y:Float) {
        super(x, y);

        loadGraphic("assets/images/characters/barryAnims/barryIdle/Barry_Idle0001.png", false);

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

            if (vel.x < 0) flipX = false;
            else if (vel.x > 0) flipX = true;
        } else {
            velocity.set(0, 0);
        }

        // speed is 0 (idle)
        if (velocity.x == 0 && velocity.y == 0) {
            idleTimer += elapsed;
            if (idleTimer >= 1.0 / idleFPS) {
                idleTimer -= 1.0 / idleFPS;
                idleFrame = (idleFrame + 1) % totalIdleFrames;

                var frameNumber = idleFrame + 1;
                var frameString = 
                    frameNumber < 10 ? "000" + frameNumber :
                    (frameNumber < 100 ? "00" + frameNumber : "0" + frameNumber);

                loadGraphic("assets/images/characters/barryAnims/barryIdle/Barry_Idle" + frameString + ".png", false);
            }
        }

        vel.put();
    }
}
