package Enemigos;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import Enemigos.Enemigo2;
/**
 * ...
 * @author ...
 */
class GalletitaBullet extends FlxSprite
{

	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);		
		loadGraphic(AssetPaths.bala__png);
		velocity.x = -200;
		x = -500;
		y = -500;
	}
	
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		if (Reg.gallehit==true) 
		{
		Reg.gallehit = false;
		destroy();
		}
		if (x < FlxG.camera.scroll.x)
		destroy();
	}
	
}