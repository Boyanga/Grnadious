package;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.util.FlxColor;
import flixel.text.FlxText;
import flixel.FlxG;
import flixel.group.FlxGroup;


class HUD extends FlxSprite
{
	var PowerUp:FlxText;
	
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		makeGraphic(256,16,FlxColor.BLACK);
		scrollFactor.x = 0;
		scrollFactor.y = 0;
	}
	
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		
		if (y > 224)
		y = 224;
	}
}