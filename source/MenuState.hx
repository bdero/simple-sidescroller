package;

import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.text.FlxText;
import flixel.ui.FlxButton;

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

        var titleButton = new FlxButton(0, 0, "Begin", function() {
            pressStart();
        });

        var bSize = { x: 125, y: 25 };
        titleButton.origin.set(0, 0);
        titleButton.setGraphicSize(bSize.x, bSize.y);
        titleButton.setSize(bSize.x, bSize.y);
        titleButton.setPosition(
            FlxG.width/2 - titleButton.width/2,
            FlxG.height*0.6
        );
        var fontSize = 8;
        var bLabel:FlxText = titleButton.label;
        bLabel.fieldWidth = titleButton.width;
        bLabel.size = fontSize;
        bLabel.offset.y = -2;
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