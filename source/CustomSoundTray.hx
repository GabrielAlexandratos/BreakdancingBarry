package;

import flixel.FlxG;
import openfl.Assets;
import openfl.display.Bitmap;
import openfl.display.Sprite;

class CustomSoundTray extends Sprite
{
	private var bitmap:Bitmap;

	public function new(x:Float, y:Float)
	{
        super();
		this.x = x;
		this.y = y;

		bitmap = new Bitmap();
		addChild(bitmap);

		updateVolumeDisplay();
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

		// Load bitmap asset
		bitmap.bitmapData = Assets.getBitmapData("assets/images/soundtray/soundtray_" + (10 - level) + ".png");
	}
}