package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.util.FlxColor;

class StoryModeState extends FlxState {

	private var backgroundColor:FlxSprite;

	private var player:Player;
	private var testInteractable:Interactable;
	private var dialogueBox:DialogueBox;

	override public function create():Void
	{
		super.create();
		backgroundColor = new FlxSprite(0, 0).makeGraphic(FlxG.width, FlxG.height, 0xFF4b4b4b);
		add(backgroundColor);

		player = new Player(FlxG.width / 2, FlxG.height / 2);
		player.screenCenter();
		add(player);

		testInteractable = new Interactable(300, 400, 60, 60, FlxColor.WHITE, function()
		{
			dialogueBox = new DialogueBox(DialogueReference.D_test, function()
			{
				player.canMove = true;
				dialogueBox = null;
			});
		});
		add(testInteractable);
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		testInteractable.checkInteraction(player);

		if (dialogueBox != null)
		{
			dialogueBox.updateBox();
			player.canMove = false;
		}
		else
		{
			player.canMove = true;
		}
	}
}