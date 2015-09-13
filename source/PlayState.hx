package;

import flixel.util.FlxPoint;
import flixel.FlxCamera;
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
    private var ZERO_POINT = new FlxPoint(0, 0);

    /**
     * Function that is called up when to state is created to set it up.
     */
    override public function create():Void {
        super.create();

        FlxG.camera.fade(FlxColor.BLACK, 0.5, true);
        FlxG.camera.bgColor = FlxColor.ROYAL_BLUE;

        player = new Player(50, 50);
        add(player);

        FlxG.camera.follow(
            player,
            FlxCamera.STYLE_PLATFORMER,
            new FlxPoint(0, 0), 10
        );
        FlxG.camera.followLead.set(15, 10);

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
        player.onGround(FlxG.collide(ground, player));
        FlxG.camera.angle = player.velocity.x/85;
        //FlxG.camera.zoom = 1 - ZERO_POINT.distanceTo(player.velocity)/500;

        super.update();
    }
}