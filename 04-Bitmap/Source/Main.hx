import flash.display.BitmapData;
import flash.display.Bitmap;
import flash.display.Sprite;

@:bitmap( "shadock_tobeornot.jpg" ) class Shadok extends BitmapData{}

class Main extends Sprite
{

	public function new( )
	{

		super( );

		var bitmap = new Bitmap (new Shadok (0, 0));
		addChild( bitmap );
	}

}