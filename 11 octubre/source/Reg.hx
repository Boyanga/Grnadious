package;
import flixel.FlxObject;
import flixel.group.FlxGroup;
import Player.Bullet;


class Reg
{
	static public var disparando:Bool = true;   // TIMER PARA BALAS
	static public var colision:Bool = false;    // COLISION ENTRE BALA DE JUGADOR Y ENEMIGO/PARED
	static public var colisionjugador:Bool = false; // COLISION ENTRE JUGADOR Y ENEMIGO/PARED/BALA
	static public var movimientocamera:Bool = true; // BOOL PARA SABER SI LA CAMERA SE ESTA MOVIENDO O NO
	static public var missilehit:Bool = false;		// BOOL PARA SABER SI EL MISIL PEGO
	static public var missiledisp:Bool = true;		// TIMER PARA MISILES
	static public var missilebool:Bool = false;		// BOOL PARA POWERUP DE MISIL
	static public var death:Bool = false;			// MUERTE
	static public var gallehit:Bool = false;
	
	static public var speed:Int = 0;                  // CANTIDAD DE POWER UPS AGREGADOS A VELOCIDAD
	static public var cantidadbalas:Int = 0;          // CANTIDAD DE BALAS DEL JUGADOR EN PANTALLA
	static public var powerup:Int = 0;                // CANTIDAD DE POWERUPS ADQUIRIDOS SIN USAR
	static public var vidas:Int = 3;				  // CANTIDAD DE VIDAS
	static public var ataque:Int = 0;
	
	static public var bulletgroup:FlxTypedGroup<FlxObject>;
	static public var missilegroup:FlxTypedGroup<FlxObject>;
	static public var enemigo1group:FlxTypedGroup<FlxObject>;
	static public var enemigo2group:FlxTypedGroup<FlxObject>;
	static public var enemigo3group:FlxTypedGroup<FlxObject>;
	static public var pudibullet:FlxTypedGroup<FlxObject>;
	static public var galletitabullet:FlxTypedGroup<FlxObject>;
}