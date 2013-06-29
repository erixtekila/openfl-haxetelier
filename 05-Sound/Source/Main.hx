import flash.media.Sound;
import flash.display.Sprite;

@:sound( "GABUZO.mp3" ) class GABUZO extends Sound
{}

class Main extends Sprite
{

	public function new( )
	{

		super( );

		var gabuzo = new GABUZO();
		gabuzo.play( 0 );
	}

}