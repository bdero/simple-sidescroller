package;

import flixel.addons.ui.FlxButtonPlus;
import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.text.FlxText;

/**
 * A FlxState which can be used for the game's menu.
 */
class MenuState extends GameState {

    /**
     * Function that is called up when to state is created to set it up.
     */
    override public function create():Void {
        super.create();

        FlxG.camera.fade(FlxColor.BLACK, 0.5, true);
        FlxG.camera.bgColor = FlxColor.BEIGE;

        var titleText = new FlxText(0, FlxG.height*0.3, FlxG.width, "Simple Sidescroller", 16);
        titleText.alignment = "center";
        titleText.color = FlxColor.CHARCOAL;
        add(titleText);

        var buttonSize = { x: 100, y: 20 };
        var titleButton = new FlxButtonPlus(
            FlxG.width/2 - buttonSize.x/2,
            FlxG.height*0.6,
            function() {
                pressStart();
            },
            "Begin",
            buttonSize.x,
            buttonSize.y
        );
        titleButton.updateInactiveButtonColors([0xff888888, 0xffaaaaaa]);
        titleButton.updateActiveButtonColors([0xffbbbbbb, 0xffaaaaaa]);
        add(titleButton);
    }

    private function pressStart() {
        transitionState(new PlayState());
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
        if (FlxG.keys.anyJustPressed(["SPACE", "ENTER"])) {
            pressStart();
        }
        if (FlxG.keys.justPressed.ESCAPE) {
            transitionState(null);
        }

        super.update();
    }
}