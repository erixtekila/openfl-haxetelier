import flash.display.Sprite;
import openfl.Assets;

class Main extends Sprite {
	
	public function new () {
		
		super ();

		var fish = Assets.getMovieClip( "fish:fish" );
		addChild( fish );
	}
	
}