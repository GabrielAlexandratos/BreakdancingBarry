package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;

class StateTransitioner {
    public static var screenBox:FlxSprite;

    public static function init(state:FlxState) {
        
        if (screenBox != null) {
            screenBox.destroy();
            screenBox = null;
        }

        screenBox = new FlxSprite(0, -FlxG.height-30);
        screenBox.makeGraphic(FlxG.width, FlxG.height+30, 0xFF000000);
        state.add(screenBox);
    }

    public static function slideToBlackTransition() {
        if (screenBox != null) {
            screenBox.y = -FlxG.height;
            FlxTween.tween(screenBox, { y: 0 }, 1, { ease: FlxEase.expoOut });
        }
    }

    public static function slideFromBlackTransition() {
        if (screenBox != null) {
            screenBox.y = 0;
            FlxTween.tween(screenBox, { y: -FlxG.height-30 }, 1, { ease: FlxEase.expoOut });
        }
    }

    public static function fadeToBlackTransition():Void {
        if (screenBox != null) {
            
            screenBox.y = 0;
            screenBox.alpha = 0;

            FlxG.state.remove(screenBox, true);
            FlxG.state.add(screenBox);

            FlxTween.tween(screenBox, { alpha: 1 }, 3, { ease: FlxEase.expoOut });
        }
    }

    public static function fadeFromBlackTransition():Void {
        if (screenBox != null) {
            screenBox.y = 0;
            screenBox.alpha = 1;

            FlxG.state.remove(screenBox, true);
            FlxG.state.add(screenBox);

            FlxTween.tween(screenBox, { alpha: 0 }, 3, { ease: FlxEase.expoOut });
        }
    }
}