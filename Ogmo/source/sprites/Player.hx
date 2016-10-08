package sprites;

import sprites.Bullet;
import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.FlxG;
import flixel.group.FlxGroup;
import sprites.Player;

/**
 * ...
 * @author ...
 */
class Player extends FlxSprite
{

	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		
		//var whiteSquare = new FlxSprite();
		makeGraphic(32, 8);
		//add(whiteSquare);
	}
	
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		
		if (FlxG.keys.pressed.DOWN)
		y += 2;
		if (FlxG.keys.pressed.UP)
		y -= 2;
		if (FlxG.keys.pressed.RIGHT)
		x += 2;
		if (FlxG.keys.pressed.LEFT)
		x -= 2;
		
		if (x < FlxG.camera.scroll.x)
		x = FlxG.camera.scroll.x;
		
		if (x > FlxG.camera.scroll.x+224)
		x = (FlxG.camera.scroll.x + 224);
		
		if (y < FlxG.camera.scroll.y)
		y = FlxG.camera.scroll.y;
		
		if (y > FlxG.camera.scroll.y+232)
		y = FlxG.camera.scroll.y + 232;
		
		if (Reg.movimientocamera == true)
		{
		if (FlxG.keys.pressed.LEFT == false && FlxG.keys.pressed.RIGHT == false)
		x += 0.5;
		if (FlxG.keys.pressed.LEFT == true && FlxG.keys.pressed.RIGHT == true)
		x += 0.5;
		}
			
		if (FlxG.keys.justPressed.SPACE)
		{
			if (Reg.disparando == true)
			{
				Reg.bulletgroup.add(new Bullet());      // KE
				Reg.bulletgroup.members[Reg.bulletgroup.length-1].x = x;
				Reg.bulletgroup.members[Reg.bulletgroup.length-1].y = y;
				FlxG.state.add(Reg.bulletgroup);
				Reg.cantidadbalas += 1;
			}
		}		
		if (Reg.cantidadbalas > 1)
		Reg.disparando = false;
		
		if (Reg.colisionjugador == true)
		destroy();
		
		
	}
}