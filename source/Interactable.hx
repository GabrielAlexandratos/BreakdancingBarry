// Interactable.hx
package;

import flixel.FlxG;
import flixel.FlxSprite;
import lime.app.Application;
import lime.ui.MouseCursor;

class Interactable extends FlxSprite {
    public var interactRange:Float = 150;
    public var onInteract:Void->Void;

    public function new(x:Float, y:Float, width:Int, height:Int, color:Int, onInteract:Void->Void) {
        super(x, y);
        makeGraphic(width, height, color);
        this.onInteract = onInteract;
    }

public function checkInteraction(player:Player):Void {
    var dx = (player.x + player.width / 2) - (this.x + this.width / 2);
    var dy = (player.y + player.height / 2) - (this.y + this.height / 2);
    var dist = Math.sqrt(dx * dx + dy * dy);

    var mousePos = FlxG.mouse.getWorldPosition();

    if (dist <= interactRange && this.overlapsPoint(mousePos)) {
        
        Application.current.window.cursor = MouseCursor.POINTER;

        if (FlxG.mouse.justPressed) {
            if (onInteract != null) onInteract();
        }
    } else {
        Application.current.window.cursor = MouseCursor.ARROW;
    }
}
}