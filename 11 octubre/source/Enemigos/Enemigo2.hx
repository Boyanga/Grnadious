package Enemigos;

import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.system.FlxAssets.FlxGraphicAsset;
import Enemigos.GalletitaBullet;

/**
 * ...
 * @author ...
 */
class Enemigo2 extends FlxSprite
{
	private var c:Int=0;
	public var movimiento:Bool = true;

	
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		loadGraphic(AssetPaths.galletita__png, true, 16, 16);
		animation.add("idle", [1, 2], 2, true);
		animation.play("idle");
	}
	
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		
		if (this.movimiento == true)
		{
			y += 3;
			c += 1;
		}
		if (this.movimiento == false)
		{
			y -= 3;
			c -= 1;
		}
		if (c > 20)
		this.movimiento = false;
		if (c < 0)
		this.movimiento = true;
		
	}
}