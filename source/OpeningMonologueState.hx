package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxTimer;

class OpeningMonologueState extends FlxState
{
	private var dialogueText:FlxText;
	private var skipImage:FlxSprite;
	private var dialogue:Array<String>;
	private var currentLine:Int;
	private var charIndex:Int;

	override public function create():Void
	{
		super.create();
		dialogue = [
			"We're wired in.",
			"You ... chosen to save the school...",
			// "For us... For...",
			// "... ready?",
			// "Too much ... makes ... dance break...",
			"We need you Barry...",
			"... activation word...\nIs...",
			"(You feel your eyes getting heavy...)",
			"...\n...",
			"Lets transport this jawn!",
			"Barry... You... are our last hope...",
			"Don't let us down."
		];
		currentLine = 0;
		charIndex = 0;
		//
		dialogueText = new FlxText(20, FlxG.height / 2, FlxG.width - 40, "");
		dialogueText.setFormat(null, 28, 0xFFFFFFFF, "center");
		dialogueText.wordWrap = true;
		dialogueText.alignment = "center";
		dialogueText.fieldWidth = FlxG.width - 40;
		add(dialogueText);
		//
		skipImage = new FlxSprite(FlxG.width - 710, FlxG.height - 120);
		skipImage.loadGraphic("assets/images/pressESCtoskip.png");
		skipImage.scale.set(0.8, 0.8);
		skipImage.alpha = 0;
		add(skipImage);
		//
		new FlxTimer().start(1, function(_)
		{
			typeNextCharacter();
		});
		new FlxTimer().start(1.5, function(_)
		{
			FlxTween.tween(skipImage, {alpha: 0.7}, 2, {ease: FlxEase.linear});
		});
	}

	private function typeNextCharacter():Void
	{
		if (charIndex < dialogue[currentLine].length)
		{
			FlxG.sound.play("assets/sounds/dialogueBlipSFX.mp3", 0.2);
			dialogueText.text += dialogue[currentLine].charAt(charIndex);
			charIndex++;
			new FlxTimer().start(0.05, function(tmr:FlxTimer)
			{
				typeNextCharacter();
			});
		}
		else
		{
			new FlxTimer().start(1.8, function(tmr:FlxTimer)
			{
				nextLine();
			});
		}
	}

	private function nextLine():Void
	{
		currentLine++;
		if (currentLine < dialogue.length)
		{
			charIndex = 0;
			dialogueText.text = "";
			typeNextCharacter();
		}
		else 
		{
			new FlxTimer().start(1.8, function(_)
			{
				StateTransitioner.fadeToBlackTransition();
				new FlxTimer().start(1, function(_)
				{
					FlxG.switchState(StoryModeState.new);		
				});
			});
		}
	}
	override public function update(elapsed:Float):Void
	{
		if (FlxG.keys.pressed.ESCAPE)
		{
			FlxG.switchState(StoryModeState.new);
		}
	}
}