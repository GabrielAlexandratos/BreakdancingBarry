package;

import flixel.FlxG;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import openfl.Assets;
import openfl.display.Bitmap;
import openfl.display.Sprite;

class CustomSoundTray extends Sprite
{
	private var bitmap:Bitmap;
	public var targetX:Float; 

	private var currentTween:FlxTween;

	public function new(x:Float, y:Float)
	{
        super();
		this.x = x;
		this.y = y;

		targetX = x; 

		bitmap = new Bitmap();
		bitmap.scaleX = 0.6;
		bitmap.scaleY = 0.6;
		addChild(bitmap);

		updateVolumeDisplay();
		// Start offscreen
		this.x += 200; 
	}

	public function showTray():Void
	{
		if (currentTween != null)
		{
			currentTween.cancel();
			currentTween = null;
		}
		currentTween = FlxTween.tween(this, {x: targetX}, 1, {
			ease: FlxEase.expoOut,
			onComplete: function(t:FlxTween)
			{
				currentTween = null;
			}
		});
	}

	public function hideTray():Void
	{
		if (currentTween != null)
		{
			currentTween.cancel();
			currentTween = null;
		}
		currentTween = FlxTween.tween(this, {x: targetX + 125}, 1, {
			ease: FlxEase.expoOut,
			onComplete: function(t:FlxTween)
			{
				currentTween = null;
			}
		});
	}

	public function updateVolumeDisplay():Void
	{
		var vol = FlxG.sound.volume;
		if (vol < 0)
			vol = 0;
		if (vol > 1)
			vol = 1;

		var level:Int = Math.round(vol * 10);
		if (level < 0)
			level = 0;
		if (level > 10)
			level = 10;

		bitmap.bitmapData = Assets.getBitmapData("assets/images/soundtray/soundtray_" + (10 - level) + ".png");
	}
}