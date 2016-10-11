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
	static public var disparando:Bool = true;   // TIMER PARA BALAS
	static public var colision:Bool = false;    // COLISION ENTRE BALA DE JUGADOR Y ENEMIGO/PARED
	static public var colisionjugador:Bool = false; // COLISION ENTRE JUGADOR Y ENEMIGO/PARED/BALA
	static public var movimientocamera:Bool = true; // BOOL PARA SABER SI LA CAMERA SE ESTA MOVIENDO O NO
	
	static public var speed:Int = 0;                  // CANTIDAD DE POWER UPS AGREGADOS A VELOCIDAD
	static public var cantidadbalas:Int = 0;          // CANTIDAD DE BALAS DEL JUGADOR EN PANTALLA
	static public var powerup:Int = 0;                // CANTIDAD DE POWERUPS ADQUIRIDOS SIN USAR
	static public var vidas:Int = 3;				  // CANTIDAD DE VIDAS
	
	static public var bulletgroup:FlxTypedGroup<FlxObject>;
}