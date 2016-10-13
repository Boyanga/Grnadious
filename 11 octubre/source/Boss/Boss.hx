package Boss;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;

/**
 * ...
 * @author ...
 */
class Boss extends FlxSprite
{

	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		loadGraphic(AssetPaths.bigjefe__png, true);
		animation.add("idle", [1,2], 2, true);
		animation.play("idle");
	}
	
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
}