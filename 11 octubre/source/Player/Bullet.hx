package Player;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.group.FlxGroup;

/**
 * ...
 * @author ...
 */
class Bullet extends FlxSprite
{

	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		loadGraphic(AssetPaths.bala__png);
		velocity.x = 200;
		x = -500;
		y = -500;
	}
	
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		if (Reg.colision==true) 
		{
		Reg.colision = false;
		Reg.cantidadbalas -= 1;
		destroy();
		Reg.disparando = true;
		}
		if (x > FlxG.camera.scroll.x+256)
		{
		Reg.cantidadbalas -= 1;
		destroy();
		Reg.disparando = true;
		}

	}
}