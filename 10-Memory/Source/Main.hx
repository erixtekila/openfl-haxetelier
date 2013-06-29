import flash.display.Stage;
import flash.filters.GlowFilter;
import flash.events.MouseEvent;
import mb.Grid;
import flash.media.Sound;
import flash.text.TextField;
import flash.display.Sprite;
import openfl.Assets;

@:sound( "OHOOO.mp3" ) class OHOOO extends Sound
{}

class Main extends Sprite
{
	private var __grid:Grid;

	public function new( )
	{

		super( );

		__launchSplashSound( );
		__init();
	}

	/*
		Splashscreen
	 */

	private function __launchSplashSound( )
	{
		//FIXME embedded sounds doesn't works in html5 target
		// var welcomesound = new OHOOO();
		var welcomesound = Assets.getSound ( "sounds/OHOOO.mp3" );
		var channel = welcomesound.play( 0 );
		//FIXME SOUND_COMPLETE is not fired on html5 target
//		channel.addEventListener
//		(
//			Event.SOUND_COMPLETE
//			, function( e )
//			{
//				__init();
//			}
//		);
	}

	/*
		Initialize the game
	 */

	private function __init( )
	{
		__createGrid( null );

		var footerbar = new Sprite();
		var initButton = new Sprite();

		var initText = new TextField();
		initText.text = "Pompe again";
		initText.selectable = false;

		var text_w = initText.textWidth /2;
		var text_h = initText.textHeight /2;
		var g = initButton.graphics;
		g.beginFill( 0xcccccc );
		g.drawCircle( text_w, text_h, text_w > text_h ? text_w +20: text_h +20 );

		footerbar.addChild( initButton );
		initButton.addChild( initText );
		addChild( footerbar );

		initButton.x = ( stage.width - initButton.width ) /2;
		initButton.y = initButton.height/2;
		initButton.filters = [ new GlowFilter() ];
		footerbar.y = stage.height - footerbar.height*2;

		initButton.addEventListener( MouseEvent.CLICK, __createGrid );
	}

	/*
		Initialize a new Grid
	 */
	private function __createGrid( event )
	{
		if( __grid != null )
		{
			removeChild( __grid );
			__launchSplashSound();
		}
		__grid = cast( addChild( new Grid() ), Grid );
	}
}
