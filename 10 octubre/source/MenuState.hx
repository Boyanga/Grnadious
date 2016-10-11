package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;
import flixel.addons.editors.ogmo.FlxOgmoLoader;
import flixel.tile.FlxTilemap;
import sprites.Player;
import flixel.FlxObject;
import sprites.Bullet;
import flixel.group.FlxGroup;

class MenuState extends FlxState
{
	

	
	override public function create():Void
	{
		super.create();
		
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		
		
		FlxG.switchState(new PlayState());
		
	}
}
