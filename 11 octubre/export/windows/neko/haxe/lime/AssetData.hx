package lime;


import lime.utils.Assets;


class AssetData {

	private static var initialized:Bool = false;
	
	public static var library = new #if haxe3 Map <String, #else Hash <#end LibraryType> ();
	public static var path = new #if haxe3 Map <String, #else Hash <#end String> ();
	public static var type = new #if haxe3 Map <String, #else Hash <#end AssetType> ();	
	
	public static function initialize():Void {
		
		if (!initialized) {
			
			path.set ("assets/data/Gradius.oep", "assets/data/Gradius.oep");
			type.set ("assets/data/Gradius.oep", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/data/level.oel", "assets/data/level.oel");
			type.set ("assets/data/level.oel", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/images/bala.png", "assets/images/bala.png");
			type.set ("assets/images/bala.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/bigjefe.png", "assets/images/bigjefe.png");
			type.set ("assets/images/bigjefe.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/conejo.png", "assets/images/conejo.png");
			type.set ("assets/images/conejo.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/cosos.png", "assets/images/cosos.png");
			type.set ("assets/images/cosos.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/escudo.png", "assets/images/escudo.png");
			type.set ("assets/images/escudo.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/fondo.png", "assets/images/fondo.png");
			type.set ("assets/images/fondo.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/galletita.png", "assets/images/galletita.png");
			type.set ("assets/images/galletita.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/jefe.png", "assets/images/jefe.png");
			type.set ("assets/images/jefe.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/jefe2.png", "assets/images/jefe2.png");
			type.set ("assets/images/jefe2.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/loli.png", "assets/images/loli.png");
			type.set ("assets/images/loli.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/montas.png", "assets/images/montas.png");
			type.set ("assets/images/montas.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/mur.png", "assets/images/mur.png");
			type.set ("assets/images/mur.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/pared.png", "assets/images/pared.png");
			type.set ("assets/images/pared.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/pudipudi.png", "assets/images/pudipudi.png");
			type.set ("assets/images/pudipudi.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/tiles.png", "assets/images/tiles.png");
			type.set ("assets/images/tiles.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("flixel/sounds/beep.ogg", "flixel/sounds/beep.ogg");
			type.set ("flixel/sounds/beep.ogg", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("flixel/sounds/flixel.ogg", "flixel/sounds/flixel.ogg");
			type.set ("flixel/sounds/flixel.ogg", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("flixel/fonts/nokiafc22.ttf", "flixel/fonts/nokiafc22.ttf");
			type.set ("flixel/fonts/nokiafc22.ttf", Reflect.field (AssetType, "font".toUpperCase ()));
			path.set ("flixel/fonts/monsterrat.ttf", "flixel/fonts/monsterrat.ttf");
			type.set ("flixel/fonts/monsterrat.ttf", Reflect.field (AssetType, "font".toUpperCase ()));
			path.set ("flixel/images/ui/button.png", "flixel/images/ui/button.png");
			type.set ("flixel/images/ui/button.png", Reflect.field (AssetType, "image".toUpperCase ()));
			
			
			initialized = true;
			
		} //!initialized
		
	} //initialize
	
	
} //AssetData
