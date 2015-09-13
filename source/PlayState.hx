package;

import flixel.FlxObject;
import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxMath;

/**
 * A FlxState which can be used for the actual gameplay.
 */
class PlayState extends FlxState {
    private var player:Player;
    private var ground:FlxSprite;

    /**
     * Function that is called up when to state is created to set it up.
     */
    override public function create():Void {
        super.create();

        FlxG.camera.fade(FlxColor.BLACK, 0.5, true);
        FlxG.camera.bgColor = FlxColor.ROYAL_BLUE;

        player = new Player(20, 40);
        add(player);

        ground = new FlxSprite(0, FlxG.height - 20);
        ground.makeGraphic(500, 50, FlxColor.GREEN);
        ground.allowCollisions = FlxObject.UP;
        ground.immovable = true;
        add(ground);

    }

    /**
     * Function that is called when this state is destroyed - you might want to
     * consider setting all objects this state uses to null to help garbage collection.
     */
    override public function destroy():Void {
        super.destroy();
    }

    /**
     * Function that is called once every frame.
     */
    override public function update():Void {
        FlxG.collide(ground, player);

        super.update();
    }
}