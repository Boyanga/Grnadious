package;
import flixel.FlxObject;
import flixel.group.FlxGroup;
import sprites.Bullet;
/**
 * ...
 * @author ...
 */
class Reg
{
	static public var disparando:Bool = true; 
	static public var colision:Bool = false;
	static public var colisionjugador:Bool = false;
	static public var movimientocamera:Bool = true;
	static public var cantidadbalas:Int = 0;
	static public var bulletgroup:FlxTypedGroup<FlxObject>;
}