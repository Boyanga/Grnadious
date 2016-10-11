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
import sprites.PowerUp;


class PlayState extends FlxState
{
	
	
	private var player:Player;
	private var tilemap:FlxTilemap;
	private var powerup:PowerUp;
	
	
	override public function create():Void
	{	
		super.create();
		
		
		
		var loader:FlxOgmoLoader = new FlxOgmoLoader(AssetPaths.level__oel);
		tilemap = loader.loadTilemap(AssetPaths.tiles__png, 16, 16, "tiles");
		tilemap.setTileProperties(0, FlxObject.NONE);
		tilemap.setTileProperties(1, FlxObject.NONE);
		tilemap.setTileProperties(2, FlxObject.ANY);
		
		FlxG.worldBounds.set(0, 0, tilemap.width, tilemap.height);
		FlxG.camera.setScrollBounds(0, tilemap.width, 0, tilemap.height);
		FlxG.mouse.visible = false;
		
		Reg.bulletgroup = new FlxTypedGroup();
		player = new Player(80, 126);
		add(tilemap);
		add(player);
		add(Reg.bulletgroup);
	}
	

	override public function update(elapsed:Float):Void
	{
		
		if (Reg.colisionjugador==true)
		  onPlayAgain();
		
		
		super.update(elapsed);
		
		//////////////////////////// COLISION PARA PLAYER \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
		
		if (FlxG.collide(tilemap, player))
		Reg.colisionjugador = true;
		
		
		
		///////////// COLISION ENTRE BALA Y PARED \\\\\\\\\\\\\\\\\
		
		for (i in 0...Reg.bulletgroup.length) 
		{
			if (FlxG.collide(Reg.bulletgroup.members[i], tilemap))
			{
				Reg.colision = true;
			}
		}
		
		////////////////////////////  \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
		
		if (FlxG.keys.justPressed.P)
		{
			powerup = new PowerUp(player.x + 120, 120);
			add(powerup);
		}
		
		if (FlxG.overlap(player, powerup))
		{
			Reg.powerup += 1;
			powerup.destroy();
		}
		//trace(Reg.powerup);
		
		//////////////////////////// MOVIMIENTO DE CAMERA \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
		
		if (Reg.movimientocamera == true)
		FlxG.camera.scroll.x += 0.5;
		
		if (FlxG.keys.pressed.B)
		FlxG.camera.scroll.x += 2;
		
		if (FlxG.keys.pressed.F)
		Reg.movimientocamera = false;
		else
		Reg.movimientocamera = true;
		
		
		//////////////////////////// POWER UPS \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
		//////////
		/////////      1: Speed/Velocidad    2: Missile     3: Option        4: Shield       5: Extra
		/////////
		
		if (FlxG.overlap(player, powerup))
		{
			Reg.powerup += 1;
			powerup.destroy();
		}
		
		
		
		if (Reg.powerup == 1)
		{
			if (FlxG.keys.justPressed.A)
			Reg.speed = (Reg.speed+ 1);
		}
		
		if (Reg.powerup == 2)
		{
			if (FlxG.keys.justPressed.A)
			{}
		}
		
		if (Reg.powerup == 3)
		{
			if (FlxG.keys.justPressed.A)
			{}
		}
		
		if (Reg.powerup == 4)
		{
			if (FlxG.keys.justPressed.A)
			{}
		}
		
		if (Reg.powerup == 5)
		{
			if (FlxG.keys.justPressed.A)
			{}
		}
		
		if (Reg.powerup == 6)
		Reg.powerup = 1;
		
		
	}
	
	
	///////////////////// RESTART  \\\\\\\\\\\\\\\\\\\\\\\\\\
	
	private function onPlayAgain():Void
	{
		Reg.colisionjugador = false;
		Reg.powerup = 0;
		Reg.speed = 0;
		FlxG.resetState();
	}
}
