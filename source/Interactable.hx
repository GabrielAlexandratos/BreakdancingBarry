// Interactable.hx
package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.util.FlxTimer;
import lime.app.Application;
import lime.ui.MouseCursor;

class Interactable extends FlxSprite {
	public var interactRange:Float = 200;
    public var onInteract:Void->Void;
	private var sprite:FlxSprite;
	private var idleFrame:Int = 0;
	private var idleTimer:Float = 0;
	private var idleFPS:Float = 14;
	private var totalIdleFrames:Int = 35; 
	private var interactSprite:FlxSprite;
	private var flickerTimer:FlxTimer;

    public function new(x:Float, y:Float, width:Int, height:Int, color:Int, onInteract:Void->Void) {
        super(x, y);
		loadGraphic("assets/images/characters/dusterAnims/idle/dusterIdle0001.png");
		scale.set(0.7, 0.7);
		flipX = true;
		origin.set(width / 2, height / 2);
        this.onInteract = onInteract;

		interactSprite = new FlxSprite();
		interactSprite.loadGraphic("assets/images/pressE0001.png");
		interactSprite.scale.set(0.85, 0.85);

		interactSprite.x = this.x + (this.width-interactSprite.width) / 2;
		interactSprite.y = this.y - interactSprite.height + 50;

		FlxG.state.add(interactSprite);

		interactSprite.visible = false;

		flickerTimer = new FlxTimer();
		var frames = [
			"assets/images/pressE0001.png",
			"assets/images/pressE0002.png"
		];
		var frameIndex = 0;
		flickerTimer.start(0.2, function(timer:FlxTimer) {
			if (interactSprite.visible) {
				interactSprite.loadGraphic(frames[frameIndex]);
				frameIndex = (frameIndex + 1) % frames.length;
			}
		}, 0);
    }

	public function checkInteraction(player:Player):Void
	{
		var dx = (player.x + player.width / 2) - (this.x + this.width / 2);
		var dy = (player.y + player.height / 2) - (this.y + this.height / 2);
		var dist = Math.sqrt(dx * dx + dy * dy);

		var mousePos = FlxG.mouse.getWorldPosition();

		if (dist <= interactRange)
		{
			interactSprite.visible = true;
			if (FlxG.keys.justPressed.E)
			{
				var state = cast(FlxG.state, StoryModeState);
				if (state.dialogueBox == null && onInteract != null)
				{
					onInteract();
				}
			}
			if (this.overlapsPoint(mousePos))
			{
				Application.current.window.cursor = MouseCursor.POINTER;

				if (FlxG.mouse.justPressed)
				{
					var state = cast(FlxG.state, StoryModeState);
					if (state.dialogueBox == null && onInteract != null)
					{
						onInteract();
					}
				}
			}
		}
		else
		{
			Application.current.window.cursor = MouseCursor.ARROW;
			interactSprite.visible = false;
		}
	}
	override public function update(elapsed:Float):Void
	{
		idleTimer += elapsed;
		if (idleTimer >= 1.0 / idleFPS)
		{
			idleTimer -= 1.0 / idleFPS;
			idleFrame = (idleFrame + 1) % totalIdleFrames;
			var frameNumber = idleFrame + 1;
			var frameString = frameNumber < 10 ? "000" + frameNumber : (frameNumber < 100 ? "00" + frameNumber : "0" + frameNumber);
			loadGraphic("assets/images/characters/dusterAnims/idle/dusterIdle" + frameString + ".png", false);
		}
	}
}