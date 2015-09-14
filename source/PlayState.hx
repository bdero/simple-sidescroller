package;

import GameState;
import flixel.util.FlxRect;
import flixel.util.FlxPoint;
import flixel.FlxCamera;
import flixel.FlxObject;
import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.FlxSprite;

/**
 * A FlxState which can be used for the actual gameplay.
 */
class PlayState extends GameState {
    private var player:Player;
    private var ground:FlxSprite;
    private var ZERO_POINT = new FlxPoint(0, 0);

    /**
     * Function that is called up when to state is created to set it up.
     */
    override public function create():Void {
        super.create();

        // Basic camera setup
        FlxG.camera.fade(FlxColor.BLACK, 0.5, true);
        FlxG.camera.bgColor = FlxColor.ROYAL_BLUE;

        // Create solid ground
        ground = new FlxSprite(0, FlxG.height - 20);
        ground.makeGraphic(500, 50, FlxColor.GREEN);
        ground.allowCollisions = FlxObject.UP;
        ground.immovable = true;
        add(ground);

        // Create player
        player = new Player();
        add(player);

        // Configure camera following
        FlxG.camera.follow(
            player,
            -1,
            new FlxPoint(0, 0),
            10
        );
        FlxG.camera.followLead.set(15, 0);

        // Set camera deadzone
        var deadzoneSize = { x: FlxG.camera.width/8, y: 0 };
        FlxG.camera.deadzone = FlxRect.get(
            FlxG.camera.width/2 - deadzoneSize.x/2,
            FlxG.camera.height/2 - deadzoneSize.y/2,
            deadzoneSize.x,
            deadzoneSize.y
        );
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
        if (FlxG.keys.justPressed.ESCAPE) {
            transitionState(new MenuState());
        }

        var playerOnGround = FlxG.collide(ground, player);

        player.onGround(playerOnGround);
        FlxG.camera.angle = player.velocity.x/85;

        super.update();
    }
}