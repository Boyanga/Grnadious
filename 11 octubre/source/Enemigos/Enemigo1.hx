package Enemigos;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.util.FlxColor;
/**
 * ...
 * @author ...
 */
class Enemigo1 extends FlxSprite
{

	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		loadGraphic(AssetPaths.conejo__png, true, 16, 16);
		animation.add("idle", [1, 2], 2, true);
		animation.play("idle");
	}
	
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		
		
		
	}
}