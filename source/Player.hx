package ;
import flixel.FlxObject;
import flixel.util.FlxColor;
import flixel.FlxSprite;

class Player extends FlxSprite {
    public function new(inX:Int, inY:Int) {
        super(inX, inY);

        makeGraphic(40, 40, FlxColor.GOLDENROD);

        acceleration.y = 800;
        drag.x = 800;
        maxVelocity.set(200, 200);
    }

    override public function update():Void {
        super.update();
    }
}
