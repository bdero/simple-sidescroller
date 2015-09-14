package;

import flash.system.System;
import flixel.FlxG;
import flixel.FlxState;
import flixel.util.FlxColor;

class GameState extends FlxState {
    override public function create():Void {
        super.create();

        FlxG.camera.fade(FlxColor.BLACK, 0.5, true);
    }

    private function transitionState(state:FlxState, duration:Float = 0.5):Void {
        FlxG.camera.fade(FlxColor.BLACK, duration, false, function() {
            if (state == null) {
                System.exit(0);
            } else {
                FlxG.switchState(state);
            }
        });
    }
}
