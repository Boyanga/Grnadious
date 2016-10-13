package Player;

import Player.Bullet;
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
		loadGraphic(AssetPaths.loli__png, true, 31,23);
		animation.add("idle", [0, 1], 2, true);
		animation.play("idle");
	}
	
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		//////////////////////////// MOVIMIENTO DEL JUGADOR \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
		
		if (FlxG.keys.pressed.DOWN)
		y += (2+Reg.speed);
		if (FlxG.keys.pressed.UP)
		y -= (2+Reg.speed);
		if (FlxG.keys.pressed.RIGHT)
		x += (2+Reg.speed);
		if (FlxG.keys.pressed.LEFT)
		x -= (2+Reg.speed);
		
		
		//////////////////////////// OOB CHECKING \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
		
		if (x < FlxG.camera.scroll.x)
		x = FlxG.camera.scroll.x;
		
		if (x > FlxG.camera.scroll.x+224)
		x = (FlxG.camera.scroll.x + 224);
		
		if (y < FlxG.camera.scroll.y)
		y = FlxG.camera.scroll.y;
		
		if (y > FlxG.camera.scroll.y+232)
		y = FlxG.camera.scroll.y + 232;
		
		
		////////////////////////////  \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
		
		if (Reg.movimientocamera == true)
		{
		if (FlxG.keys.pressed.LEFT == false && FlxG.keys.pressed.RIGHT == false)
		x += 0.5;
		if (FlxG.keys.pressed.LEFT == true && FlxG.keys.pressed.RIGHT == true)
		x += 0.5;
		}
			
		
		//////////////////////////// DISPAROS DEL JUGADOR \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
		
		if (FlxG.keys.justPressed.SPACE)
		{
			if (Reg.disparando == true)
			{
				Reg.bulletgroup.add(new Bullet());
				Reg.bulletgroup.members[Reg.bulletgroup.length-1].x = x+10;
				Reg.bulletgroup.members[Reg.bulletgroup.length-1].y = y+12;
				FlxG.state.add(Reg.bulletgroup);
				Reg.cantidadbalas += 1;
			}
		}		
		if (Reg.cantidadbalas > 2)
		Reg.disparando = false;
		
		
		if (Reg.powerup == 2)
		{
			if (FlxG.keys.justPressed.A)
			{
			Reg.missilebool = true;
			Reg.powerup = 0;
			}
		}
		if (FlxG.keys.justPressed.SPACE)
			if (Reg.missilebool == true)
			{
				if (Reg.missiledisp == true)
				{
					Reg.missilegroup.add(new Missile());
					Reg.missilegroup.members[Reg.missilegroup.length-1].x = x+10;
					Reg.missilegroup.members[Reg.missilegroup.length - 1].y = y;
					Reg.missiledisp = false;
				}
			}
		
		//////////////////////////// DESTROY \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
		
		if (Reg.colisionjugador == true)
		{
		Reg.vidas -= 1;
		destroy();
		Reg.death = true;
		}
		
	}
}