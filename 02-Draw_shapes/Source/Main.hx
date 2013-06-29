import flash.display.Shape;
import flash.display.Sprite;

class Main extends Sprite
{

	public function new( )
	{

		super( );

		__init( );
	}

	/*
		Initialize drawings
	 */

	public function __init( )
	{
		var outer = new Shape();
		var graphics = outer.graphics;
		graphics.beginFill( 0xff1324 );
		graphics.drawCircle( 0, 0, 100 );

		var inner = new Shape();
		graphics = inner.graphics;
		graphics.beginFill( 0x1324FF );
		graphics.drawCircle( 0, 0, 10 );

		addChild( outer );
		addChild( inner );
		outer.x = outer.width / 2;
		outer.y = outer.height / 2;
		inner.x = outer.x;
		inner.y = inner.width / 2;
	}

}