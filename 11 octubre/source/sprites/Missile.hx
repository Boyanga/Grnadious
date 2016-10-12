package sprites;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.FlxG;

/**
 * ...
 * @author ...
 */
class Missile extends FlxSprite
{

	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		makeGraphic(13, 8);
		velocity.y = 200;
		x = -500;
		y = -500;
		
	}
	
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		
		if (Reg.missilehit==true) 
		{
		Reg.missilehit = false;
		destroy();
		Reg.missiledisp = true;
		}
		if (y > FlxG.camera.scroll.y+240)
		{
		destroy();
		Reg.missiledisp = true;
		}
	}
}