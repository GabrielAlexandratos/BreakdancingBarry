package;

import flixel.util.FlxColor;
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
	private var idleFPS:Float = 14;
    private var totalIdleFrames:Int = 16; 

    public var collisionBox:CollisionBox;

    public function new(x:Float, y:Float) {
        super(x, y);

        loadGraphic("assets/images/characters/barryAnims/barryIdle/Barry_Idle0001.png", false);

        origin.set(width / 2, height / 2);

        collisionBox = new CollisionBox(x, y, width * 0.5, height * 0.75, true, FlxColor.BLUE);
        FlxG.state.add(collisionBox);
    }

    override public function update(elapsed:Float):Void {
        super.update(elapsed);

        var vel = FlxPoint.get();
        if (canMove) {
            if (FlxG.keys.pressed.W || FlxG.keys.pressed.UP) vel.y -= 0.75;
            if (FlxG.keys.pressed.S || FlxG.keys.pressed.DOWN) vel.y += 0.75;
            if (FlxG.keys.pressed.A || FlxG.keys.pressed.LEFT) vel.x -= 1;
            if (FlxG.keys.pressed.D || FlxG.keys.pressed.RIGHT) vel.x += 1;

            if (vel.x != 0 && vel.y != 0) vel.normalize();
            
            // Store current position
            var oldX = x;
            var oldY = y;
            
            // Try to move X first
            if (vel.x != 0) {
                var desiredX = x + vel.x * speed * elapsed;
                var testX = desiredX + (width - collisionBox.width) / 2;
                
                collisionBox.x = testX;
                
                // Check if new position would cause collision
                var hasCollision = false;
                var state = cast(FlxG.state, StoryModeState);
                for (box in state.collisionBoxes) {
                    if (collisionBox.overlaps(box)) {
                        hasCollision = true;
                        break;
                    }
                }
                
                // Only move if no collision
                if (!hasCollision) {
                    x = desiredX;
                }
                
                // Reset collision box position
                collisionBox.x = x + (width - collisionBox.width) / 2;
            }
            
            // Then try to move Y
            if (vel.y != 0) {
                var desiredY = y + vel.y * speed * elapsed;
                var testY = desiredY + (height - collisionBox.height);
                
                // Update collision box position for testing
                collisionBox.y = testY;
                
                // Check if new position would cause collision
                var hasCollision = false;
                var state = cast(FlxG.state, StoryModeState);
                for (box in state.collisionBoxes) {
                    if (collisionBox.overlaps(box)) {
                        hasCollision = true;
                        break;
                    }
                }
                
                // Only move if no collision
                if (!hasCollision) {
                    y = desiredY;
                }
                
                // Reset collision box position
                collisionBox.y = y + (height - collisionBox.height);
            }

            if (vel.x < 0) flipX = false;
            else if (vel.x > 0) flipX = true;
        }

        // Keep collision box aligned with player
        collisionBox.x = x + (width - collisionBox.width) / 2;
        collisionBox.y = y + (height - collisionBox.height);

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
