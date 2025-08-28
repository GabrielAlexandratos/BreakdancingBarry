package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.math.FlxPoint;

class StoryModeState extends FlxState {

	private var player:FlxSprite;
	private var speed:Float = 150;

	override public function create():Void
	{
		super.create();
		player = new FlxSprite(FlxG.width / 2, FlxG.height / 2);
		player.makeGraphic(32, 32, 0xFF00FF00);
		add(player);
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		var vel = FlxPoint.get();
		if (FlxG.keys.pressed.W || FlxG.keys.pressed.UP)
		{
			vel.y -= 1;
		}
		if (FlxG.keys.pressed.S || FlxG.keys.pressed.DOWN)
		{
			vel.y += 1;
		}
		if (FlxG.keys.pressed.A || FlxG.keys.pressed.LEFT)
		{
			vel.x -= 1;
		}
		if (FlxG.keys.pressed.D || FlxG.keys.pressed.RIGHT)
		{
			vel.x += 1;
		}
		if (vel.x != 0 && vel.y != 0)
		{
			vel.normalize();
		}
		vel.x *= speed;
		vel.y *= speed;
		player.velocity.set(vel.x, vel.y);
		if (vel.x < 0)
		{
			player.flipX = true;
		}
		else if (vel.x > 0)
		{
			player.flipX = false;
		}
	}
}