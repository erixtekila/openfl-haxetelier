import flash.display.Stage;
import flash.events.Event;
import flash.display.Shape;
import flash.display.Sprite;

class Main extends Sprite
{

	private var __outer:Shape;
	private var __inner:Shape;

	public function new( )
	{
		super( );

		stage.frameRate = 2;

		__init( );
	}

	/*
		Initialize drawings
	 */

	private function __init( )
	{
		__outer = new Shape();
		var graphics = __outer.graphics;
		graphics.beginFill( 0xff1324 );
		graphics.drawCircle( 0, 0, 100 );

		__inner = new Shape();
		graphics = __inner.graphics;
		graphics.beginFill( 0x1324FF );
		graphics.drawCircle( __outer.width / 2 - 10, 0, 10 );

		addChild( __outer );
		addChild( __inner );
		__inner.x = __outer.x = __outer.width / 2;
		__inner.y = __outer.y = __outer.height / 2;

		addEventListener( Event.ENTER_FRAME, tick );
	}

	/*
    	Tick event for display refresh
     */

	private function tick( event:Event )
	{
		//		trace( event );
		__inner.rotation ++;
	}

}