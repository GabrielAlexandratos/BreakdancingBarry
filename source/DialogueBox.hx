// DialogueBox.hx
package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.text.FlxText;
import flixel.util.FlxTimer;
import lime.app.Application;
import lime.ui.MouseCursor;

class DialogueBox extends FlxSprite {
    private var dialogue:Array<String>;
    private var currentLine:Int = 0;
    private var charIndex:Int = 0;
    private var dialogueText:FlxText;
    private var typing:Bool = false;
    private var onComplete:Void->Void;

	public function new(dialogue:Array<String>, ?onComplete:Void->Void)
	{
		super(0, FlxG.height - 250);
		var boxWidth = 1221;
		x = (FlxG.width - boxWidth) / 2;
		y = (FlxG.height - 300);
		loadGraphic("assets/images/dialogueBox0001.png");

		this.dialogue = dialogue;
		this.onComplete = onComplete;

		dialogueText = new FlxText(x + 60, y + 35, boxWidth - 100, "");
		dialogueText.setFormat(null, 30, 0xFFFFFFFF, "left");
		dialogueText.wordWrap = true;
		dialogueText.alignment = "left";

		FlxG.state.add(this);
		FlxG.state.add(dialogueText);

		playOpenAnimation();
	}

    private function startTyping():Void {
        dialogueText.text = "";
        charIndex = 0;
        typing = true;
        typeNextCharacter();
    }

    private function typeNextCharacter():Void {
        if (charIndex < dialogue[currentLine].length) {
			FlxG.sound.play("assets/sounds/dialogueBlipSFX.mp3", 0.1);

            dialogueText.text += dialogue[currentLine].charAt(charIndex);
            charIndex++;
            new FlxTimer().start(0.03, function(_) { typeNextCharacter(); });
        } else {
            typing = false;
        }
    }

	private function typeWholeLine():Void
	{
		charIndex += dialogue[currentLine].length;
		dialogueText.text = dialogue[currentLine];
		typing = false;
	}

    public function updateBox():Void {
        var mousePos = FlxG.mouse.getWorldPosition();
        if (this.overlapsPoint(mousePos)) {
            Application.current.window.cursor = MouseCursor.POINTER;
			if (FlxG.mouse.justPressed)
			{
				if (typing)
				{
					typeWholeLine();
				}
				else
				{
					nextLine();
				}

            }
        }
    }

    private function nextLine():Void {
        currentLine++;
        if (currentLine < dialogue.length) {
            startTyping();
        } else {
            FlxG.state.remove(this);
            FlxG.state.remove(dialogueText);
            if (onComplete != null) {
                onComplete();
            }
        }
    }
	private function playOpenAnimation():Void
	{
		var frames = [
			"assets/images/dialogueBox0002.png",
			"assets/images/dialogueBox0003.png",
			"assets/images/dialogueBox0004.png"
		];

		var frameIndex = 0;
		new FlxTimer().start(0.03, function(timer:FlxTimer)
		{
			loadGraphic(frames[frameIndex]);
			scale.set(1, 0.8);
			origin.set();

			frameIndex++;
			if (frameIndex >= frames.length)
			{
				// stop animation and start typing
				timer.destroy();
				startTyping();
			}
		}, frames.length);
	}
}