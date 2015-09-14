package;

import flixel.FlxObject;
import flixel.FlxG;
import flixel.FlxSprite;

class Player extends FlxSprite {
    private var MAX_JUMP_FRAMES = 20;
    private var JUMP_VELOCITY = -250;

    private var currentJumpFrame = 0;
    private var jumping = true;
    private var jumpUsed = true;

    public function new(inX:Int, inY:Int) {
        super(inX, inY);

        loadGraphic("assets/images/player.png", true, 16, 16);
        origin.set(0, 0);
        setGraphicSize(32, 32);
        setSize(32, 32);

        setFacingFlip(FlxObject.LEFT, true, false);
        setFacingFlip(FlxObject.RIGHT, false, false);

        animation.add("walk", [0, 1, 2, 3], 12, true);
        animation.add("jump", [4]);
        animation.add("fall", [5]);
        animation.add("idle", [6, 7], 2, true);
        animation.add("sit", [8, 9], 4, false);

        acceleration.y = 1000;
        drag.x = 800;
        maxVelocity.set(200, 400);
    }

    override public function update():Void {
        if (FlxG.keys.anyPressed(["W", "UP", "SPACE"])) {
            if (currentJumpFrame < MAX_JUMP_FRAMES && !jumpUsed) {
                jumping = true;
                velocity.y = JUMP_VELOCITY;
                currentJumpFrame++;
            }
        } else if (jumping) {
            jumpUsed = true;
        }

        var left = FlxG.keys.anyPressed(["A", "LEFT"]);
        var right = FlxG.keys.anyPressed(["D", "RIGHT"]);

        if (velocity.x == 0) {
            animation.play("idle");
        }

        acceleration.x = 0;
        var accel = jumping ? 300 : 800;
        if (left && !right) {
            acceleration.x -= (velocity.x > 0) ? accel*2 : accel;
            facing = FlxObject.LEFT;
            animation.play("walk");
        } else if (right && !left) {
            acceleration.x += (velocity.x < 0) ? accel*2 : accel;
            facing = FlxObject.RIGHT;
            animation.play("walk");
        }

        if (jumping) {
            if (velocity.y < 0) {
                animation.play("jump");
            } else {
                animation.play("fall");
            }
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
