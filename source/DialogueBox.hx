//
package;

import openfl.display3D.Context3DTextureFormat;
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
	private var canAdvance:Bool = false;
	private var continueSprite:FlxSprite;

	public function new(dialogue:Array<String>, ?onComplete:Void->Void)
	{
		super(0, FlxG.height - 250);
		var boxWidth = 1221;
		x = (FlxG.width - boxWidth) / 2;
		y = (FlxG.height - 300);
		loadGraphic("assets/images/dialogueBox0001.png");

		continueSprite = new FlxSprite(FlxG.width - 930, FlxG.height - 115);
		continueSprite.loadGraphic("assets/images/pressEtoContinue0001.png");
		continueSprite.scale.set(0.6, 0.6);
		
		this.dialogue = dialogue;
		this.onComplete = onComplete;

		dialogueText = new FlxText(x + 60, y + 35, boxWidth - 100, "");
		dialogueText.setFormat(null, 30, 0xFFFFFFFF, "left");
		dialogueText.wordWrap = true;
		dialogueText.alignment = "left";

		FlxG.state.add(this);
		FlxG.state.add(dialogueText);
		new FlxTimer().start(0.09, function(timer:FlxTimer){

			FlxG.state.add(continueSprite);
		});

		playOpenAnimation();
	}

    public function updateBox():Void {
		if (!canAdvance)
			return;
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

		if (FlxG.keys.justPressed.E)
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

	private function startTyping():Void
	{
		dialogueText.text = "";
		charIndex = 0;
		typing = true;
		typeNextCharacter();
	}

	private function typeNextCharacter():Void
	{
		if (charIndex < dialogue[currentLine].length)
		{
			FlxG.sound.play("assets/sounds/dialogueBlipSFX.mp3", 0.1);

			dialogueText.text += dialogue[currentLine].charAt(charIndex);
			charIndex++;
			new FlxTimer().start(0.03, function(_)
			{
				typeNextCharacter();
			});
		}
		else
		{
			typing = false;
		}
	}

	private function typeWholeLine():Void
	{
		charIndex += dialogue[currentLine].length;
		dialogueText.text = dialogue[currentLine];
		typing = false;
	}

    private function nextLine():Void {
        currentLine++;
		FlxG.sound.play("assets/sounds/dialogueNewLine.mp3",0.2);
        if (currentLine < dialogue.length) {
            startTyping();
        } else {
            FlxG.state.remove(this);
            FlxG.state.remove(dialogueText);
			FlxG.state.remove(continueSprite);
            if (onComplete != null) {
                onComplete();
            }
        }
    }
	private function playOpenAnimation():Void
	{
		FlxG.sound.play("assets/sounds/openDialogueBoxSFX.mp3", 0.25);
		var frames = [
			"assets/images/dialogueBox0002.png",
			"assets/images/dialogueBox0003.png",
			"assets/images/dialogueBox0004.png"
		];
		var continueFrames = [
			"assets/images/pressEtoContinue0001.png",
			"assets/images/pressEtoContinue0002.png",
			"assets/images/pressEtoContinue0003.png",
			"assets/images/pressEtoContinue0004.png",
			"assets/images/pressEtoContinue0005.png",
			"assets/images/pressEtoContinue0006.png"
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
				timer.destroy();
				startTyping();
				canAdvance = true;

				// dialogue box flicker
				var boxToggle:Bool = false;
				new FlxTimer().start(0.2, function(swapTimer:FlxTimer) {
					boxToggle = !boxToggle;
					makeGraphic(1, 1, 0x00000000);
					loadGraphic(boxToggle ? "assets/images/dialogueBox0004.png" : "assets/images/dialogueBox0005.png");
					scale.set(1, 0.8);
					origin.set(0, 0);
					x = (FlxG.width - width) / 2;
					y = FlxG.height - 300;
				}, 0);
				
				var cFrameIndex = 0;
				new FlxTimer().start(0.15, function(cTimer:FlxTimer) {
					continueSprite.loadGraphic(continueFrames[cFrameIndex]);
					continueSprite.scale.set(0.6, 0.6);
					cFrameIndex = (cFrameIndex + 1) % continueFrames.length;
				}, 0);
			}
		}, frames.length);
	}

}