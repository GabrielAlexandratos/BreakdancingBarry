// Interactable.hx
package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.util.FlxTimer;
import lime.app.Application;
import lime.ui.MouseCursor;

class Interactable extends FlxSprite {
    public var interactRange:Float;
    public var onInteract:Void->Void;
    private var interactSprite:FlxSprite;
    private var flickerTimer:FlxTimer;

    private var idleFrames:Array<String>;
    private var idleFrame:Int = 0;
    private var idleTimer:Float = 0;
    private var idleFPS:Float;

    public function new(
        x:Float, 
        y:Float, 
        width:Int, 
        height:Int, 
        frames:Array<String>, // <-- custom idle frames
        ?range:Float = 300, 
        ?fps:Float = 14,
        ?onInteract:Void->Void
    ) {
        super(x, y);

        this.idleFrames = frames;
        this.idleFPS = fps;
        this.interactRange = range;
        this.onInteract = onInteract;

        // Load first idle frame
        loadGraphic(frames[0]);
        scale.set(0.7, 0.7);
        flipX = true;
        origin.set(width / 2, height / 2);

        // Hardcoded "Press E" prompt
        interactSprite = new FlxSprite();
        interactSprite.loadGraphic("assets/images/pressE0001.png");
        interactSprite.scale.set(0.85, 0.85);
        interactSprite.x = this.x + (this.width - interactSprite.width) / 2;
        interactSprite.y = this.y - interactSprite.height + 50;
        FlxG.state.add(interactSprite);
        interactSprite.visible = false;

        // Flicker animation for prompt
        flickerTimer = new FlxTimer();
        var framesPrompt = [
            "assets/images/pressE0001.png",
            "assets/images/pressE0002.png"
        ];
        var frameIndex = 0;
        flickerTimer.start(0.2, function(timer:FlxTimer) {
            if (interactSprite.visible) {
                interactSprite.loadGraphic(framesPrompt[frameIndex]);
                frameIndex = (frameIndex + 1) % framesPrompt.length;
            }
        }, 0);
    }

    public function checkInteraction(player:Player):Void {
        var dx = (player.x + player.width / 2) - (this.x + this.width / 2);
        var dy = (player.y + player.height / 2) - (this.y + this.height / 2);
        var dist = Math.sqrt(dx * dx + dy * dy);
        var mousePos = FlxG.mouse.getWorldPosition();

        if (dist <= interactRange) {
            interactSprite.visible = true;
            if (FlxG.keys.justPressed.E) {
                var state = cast(FlxG.state, StoryModeState);
                if (state.dialogueBox == null && onInteract != null) {
                    onInteract();
                }
            }
            if (this.overlapsPoint(mousePos)) {
                Application.current.window.cursor = MouseCursor.POINTER;
                if (FlxG.mouse.justPressed) {
                    var state = cast(FlxG.state, StoryModeState);
                    if (state.dialogueBox == null && onInteract != null) {
                        onInteract();
                    }
                }
            }
        } else {
            Application.current.window.cursor = MouseCursor.ARROW;
            interactSprite.visible = false;
        }
    }

    override public function update(elapsed:Float):Void {
        idleTimer += elapsed;
        if (idleTimer >= 1.0 / idleFPS) {
            idleTimer -= 1.0 / idleFPS;
            idleFrame = (idleFrame + 1) % idleFrames.length;
            loadGraphic(idleFrames[idleFrame], false);
        }
    }
}