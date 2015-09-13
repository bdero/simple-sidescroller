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
        if (FlxG.keys.anyPressed(["SPACE"])) {
            if (currentJumpFrame < MAX_JUMP_FRAMES && !jumpUsed) {
                jumping = true;
                velocity.y = -250;
                currentJumpFrame++;
            }
        } else if (jumping) {
            jumpUsed = true;
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
