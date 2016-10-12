package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;
import flixel.addons.editors.ogmo.FlxOgmoLoader;
import flixel.tile.FlxTilemap;
import sprites.Boss;
import sprites.Enemigo1;
import sprites.Missile;
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
	private var enemigo:Enemigo1;
	private var boss:Boss;
	private var missile:Missile;
	private var hud:HUD;
	private var display:FlxText;
	private var vida:FlxText;
	
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
		
		Reg.missilegroup = new FlxTypedGroup();
		Reg.bulletgroup = new FlxTypedGroup();
		hud = new HUD(0, 224);
		player = new Player(80, 126);
		add(tilemap);
		add(player);
		add(Reg.missilegroup);
		add(Reg.bulletgroup);
		add(hud);
		
		display=new FlxText(hud.x + 100, hud.y + 2, 0, "" + Reg.powerup, 8);
		add(display);
		display.scrollFactor.set(0, 0);
		
		vida=new FlxText(hud.x + 200, hud.y +2, 0, "" + Reg.vidas, 8);
		add(vida);
		vida.scrollFactor.set(0, 0);
	}
	

	override public function update(elapsed:Float):Void
	{
		
		if (Reg.colisionjugador == true)
		  onPlayAgain();
		
		
		super.update(elapsed);
		display.text = "" + Reg.powerup;
		vida.text = "" + Reg.vidas;
		
		
		//////////////////////////// COLISION PARA PLAYER \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
		
		if (FlxG.collide(tilemap, player))
		Reg.colisionjugador = true;
		
		FlxG.collide(player,hud);
		
		///////////// COLISION ENTRE BALA Y PARED \\\\\\\\\\\\\\\\\
		
		for (i in 0...Reg.bulletgroup.length) 
		{
			if (FlxG.collide(Reg.bulletgroup.members[i], tilemap))
			{
				Reg.colision = true;
			}
		}
		
		
		for (i in 0...Reg.bulletgroup.length) 
		{
			if (FlxG.collide(Reg.missilegroup.members[i], tilemap))
			{
				Reg.missilehit = true;
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
		////////
		
		
		if (FlxG.overlap(player, powerup))
		{
			Reg.powerup += 1;
			powerup.destroy();
		}
		
		
		if (Reg.powerup == 1)
		{
			if (FlxG.keys.justPressed.A)
			{
			Reg.speed = (Reg.speed + 1);
			Reg.powerup = 0;
			}
		}
		
		if (Reg.powerup == 2)
		{
			if (FlxG.keys.justPressed.A)
			{
				
			}
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
		if (Reg.death == true)
		{
			if (Reg.vidas > 0)
			{
			Reg.colisionjugador = false;
			Reg.powerup = 0;
			Reg.speed = 0;
			Reg.death = false;
			FlxG.resetState();
			
			}
			else{}
		}
	}
}
