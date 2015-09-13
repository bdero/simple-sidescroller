package ;
import flixel.FlxG;
import flixel.util.FlxColor;
import flixel.FlxSprite;

class Player extends FlxSprite {
    private var MAX_JUMP_FRAMES = 20;

    private var currentJumpFrame = 0;
    private var jumping = true;
    private var jumpUsed = true;

    public function new(inX:Int, inY:Int) {
        super(inX, inY);

        makeGraphic(20, 30, FlxColor.GOLDENROD);

        acceleration.y = 1000;
        drag.x = 800;
        maxVelocity.set(200, 400);
    }

    override public function update():Void {
        if (FlxG.keys.anyPressed(["W", "SPACE"])) {
            if (currentJumpFrame < MAX_JUMP_FRAMES && !jumpUsed) {
                jumping = true;
                velocity.y = -250;
                currentJumpFrame++;
            }
        } else if (jumping) {
            jumpUsed = true;
        }

        var left = FlxG.keys.anyPressed(["A", "LEFT"]);
        var right = FlxG.keys.anyPressed(["D", "RIGHT"]);

        acceleration.x = 0;
        var accel = jumping ? 300 : 800;
        if (left && !right) {
            acceleration.x -= (velocity.x > 0) ? accel*2 : accel;
        } else if (right && !left) {
            acceleration.x += (velocity.x < 0) ? accel*2 : accel;
        }

        super.update();
    }

    public function onGround(grounded:Bool) {
        if (grounded) {
            currentJumpFrame = 0;
            jumping = false;
            jumpUsed = false;
        } else {
            jumping = true;
        }
    }
}
