package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.util.FlxColor;
import flixel.input.keyboard.FlxKey;

class StoryModeState extends FlxState {

    private var backgroundColor:FlxSprite;
    private var player:Player;
    private var testInteractable:Interactable;
    public var dialogueBox:DialogueBox;

    // Add the pause menu variable
    private var pauseMenu:PauseMenu;
    private var isPaused:Bool = false;

    private var background:FlxSprite;

    override public function create():Void {
        super.create();

        backgroundColor = new FlxSprite(0, 0).makeGraphic(FlxG.width, FlxG.height, 0xFF4b4b4b);
        add(backgroundColor);

        background = new FlxSprite(0, 0);
        background.loadGraphic("assets/images/maps/map001.png");
        add(background);

        player = new Player(FlxG.width / 2 + 300, FlxG.height - 350);
        add(player);

        testInteractable = new Interactable(40, 600, 60, 60, FlxColor.WHITE, function() {
            dialogueBox = new DialogueBox(DialogueReference.D_test, function() {
                player.canMove = true;
                dialogueBox = null;
            });
        });
        add(testInteractable);

        pauseMenu = new PauseMenu();
    }

    override public function update(elapsed:Float):Void {
        super.update(elapsed);

        if (FlxG.keys.justPressed.TAB) { 
            if (!isPaused) {
                add(pauseMenu);
                pauseMenu.disable();
                pauseMenu.slideIn();
                isPaused = true;
            } else {
                pauseMenu.disable();
                isPaused = false;
                remove(pauseMenu);
            }
        }

        // Only update the game if not paused
        if (!isPaused) {
            testInteractable.checkInteraction(player);

            if (dialogueBox != null) {
                dialogueBox.updateBox();
                player.canMove = false;
            } else {
                player.canMove = true;
            }
        } else {
            player.canMove = false;
        }
    }
}