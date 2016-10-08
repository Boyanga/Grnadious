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

class MenuState extends FlxState
{
	
	private var player:Player;
	private var tilemap:FlxTilemap;
	
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
		super.update(elapsed);
		
		if (FlxG.collide(tilemap, player))
		Reg.colisionjugador = true;
		
		
		for (i in 0...Reg.bulletgroup.length) 
		{
			if (FlxG.collide(tilemap, Reg.bulletgroup.members[i]))
			{
				Reg.bulletgroup.members[i].destroy();
				Reg.colision = true;
			}
		}
		
		
		//if (FlxG.collide(tilemap, Reg.bullet))
		//Reg.colision = true;
		
		
		// viaja 2 tiles por segundo
		if (Reg.movimientocamera == true)
		FlxG.camera.scroll.x += 0.5;
		
		if (FlxG.keys.pressed.B)
		FlxG.camera.scroll.x += 2;
		
		if (FlxG.keys.pressed.F)
		Reg.movimientocamera = false;
		else
		Reg.movimientocamera = true;
	}
}
