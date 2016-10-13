package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.addons.display.FlxBackdrop;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;
import flixel.addons.editors.ogmo.FlxOgmoLoader;
import flixel.tile.FlxTilemap;
import Boss.Boss;
import Enemigos.Enemigo1;
import Enemigos.Enemigo2;
import Enemigos.Enemigo3;
import Player.Missile;
import Player.Player;
import flixel.FlxObject;
import Player.Bullet;
import flixel.group.FlxGroup;
import Player.PowerUp;

class PlayState extends FlxState
{
	
	
	private var player:Player;
	private var tilemap:FlxTilemap;
	private var fondo:FlxBackdrop;
	private var powerup:PowerUp;
	private var enemigo:Enemigo1;
	private var boss:Boss;
	private var hud:HUD;
	private var display:FlxText;
	private var vida:FlxText;
	
	override public function create():Void
	{	
		super.create();
		
		fondo =  new FlxBackdrop(AssetPaths.fondo__png, 1, 0, true, false);	
		var loader:FlxOgmoLoader = new FlxOgmoLoader(AssetPaths.level__oel);
		tilemap = loader.loadTilemap(AssetPaths.tiles__png, 16, 16, "tiles");
		tilemap.setTileProperties(0, FlxObject.NONE);
		tilemap.setTileProperties(1, FlxObject.NONE);
		tilemap.setTileProperties(2, FlxObject.ANY);		
		
		
		FlxG.worldBounds.set(0, 0, tilemap.width, tilemap.height);
		FlxG.camera.setScrollBounds(0, tilemap.width, 0, tilemap.height);
		FlxG.mouse.visible = false;
		
		Reg.enemigo1group = new FlxTypedGroup();
		Reg.enemigo2group = new FlxTypedGroup();
		Reg.enemigo3group = new FlxTypedGroup();
		Reg.missilegroup = new FlxTypedGroup();
		Reg.bulletgroup = new FlxTypedGroup();
		
		hud = new HUD(0, 223);
		player = new Player(80, 126);
		boss = new Boss(180, 86);
		
		add(fondo);
		add(tilemap);
		add(player);
		add(Reg.missilegroup);
		add(Reg.bulletgroup);
		add(Reg.enemigo1group);
		add(Reg.enemigo2group);
		add(Reg.enemigo3group);
		add(hud);
		add(boss);
		
		Reg.galletitabullet = new FlxTypedGroup();
		add(Reg.galletitabullet);
		
		display=new FlxText(hud.x + 100, hud.y + 2, 0, "" + Reg.powerup, 8);
		add(display);
		display.scrollFactor.set(0, 0);
		
		vida=new FlxText(hud.x + 200, hud.y +2, 0, "" + Reg.vidas, 8);
		add(vida);
		vida.scrollFactor.set(0, 0);
		
		Reg.enemigo3group.add(new Enemigo3(200, 207));
	}
	

	override public function update(elapsed:Float):Void
	{
		
		if (Reg.colisionjugador == true)
		  onPlayAgain();
		
		
		super.update(elapsed);
		display.text = "" + Reg.powerup;
		vida.text = "" + Reg.vidas;
		
		
		for (i in 0...Reg.enemigo2group.length) 
		{
			if ()
			{
				Reg.galletitabullet.add(new GalletitaBullet(this.x, this.y));
			}
		}

		
		
		
		
		
		
		
		
		if (FlxG.keys.justPressed.E)
		Reg.enemigo2group.add(new Enemigo2(player.x + 100, player.y));
		
		for (i in 0...Reg.enemigo1group.length) 
		{
		if (player.x < Reg.enemigo1group.members[i].x)
		Reg.enemigo1group.members[i].x -= 0.5;
		if (player.x > Reg.enemigo1group.members[i].x)
		Reg.enemigo1group.members[i].x += 1;
		if (player.y < Reg.enemigo1group.members[i].y)
		Reg.enemigo1group.members[i].y -= 0.5;
		if (player.y > Reg.enemigo1group.members[i].y)
		Reg.enemigo1group.members[i].y += 0.5;
		}
		
		//////////////////////////// COLISION PARA PLAYER \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
		
		for (j in 0...Reg.enemigo1group.length) 
			if (FlxG.collide(Reg.enemigo1group.members[j], player))
				Reg.colisionjugador = true;
		
		if (FlxG.collide(tilemap, player))
			Reg.colisionjugador = true;
		
		FlxG.collide(player,hud);
		
		///////////// COLISION ENTRE BALA + PARED + ENEMIGOS \\\\\\\\\\\\\\\\\
		
		for (b in 0...Reg.bulletgroup.length) 
		{
			if (FlxG.collide(Reg.bulletgroup.members[b], tilemap))
				Reg.colision = true;
				for (k in 0...Reg.enemigo1group.length) 
				{
					if (FlxG.collide(Reg.bulletgroup.members[b], Reg.enemigo1group.members[k]))
					{
						Reg.colision = true;
						if (FlxG.random.int(0, 7) == 7)
							powerup= new PowerUp(Reg.enemigo1group.members[k].x, Reg.enemigo1group.members[k].y);
						Reg.enemigo1group.members[k].destroy();	
					}
				}
				for (n	in 0...Reg.enemigo2group.length) 
				{
					if (FlxG.collide(Reg.bulletgroup.members[b], Reg.enemigo2group.members[n]))
					{
						Reg.enemigo2group.members[n].destroy();
						Reg.colision = true;
					}
				}
				for (o	in 0...Reg.enemigo3group.length) 
				{
					if (FlxG.collide(Reg.bulletgroup.members[b], Reg.enemigo3group.members[o]))
					{
						Reg.enemigo3group.members[o].destroy();
						Reg.colision = true;
					}
				}
		}
		
		
		for (m in 0...Reg.missilegroup.length) 
		{
			if (FlxG.collide(Reg.missilegroup.members[m], tilemap))
				Reg.missilehit = true;
				for (l in 0...Reg.enemigo1group.length) 
				{
					if (FlxG.collide(Reg.missilegroup.members[m], Reg.enemigo1group.members[l]))
					{
						Reg.enemigo1group.members[l].destroy();
						Reg.missilehit = true;
					}
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
