package mb;

import flash.events.TimerEvent;
import flash.utils.Timer;
import flash.events.MouseEvent;
import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.Sprite;

@:bitmap( "shadock_amnesie.jpg" ) class Shadok1 extends BitmapData{}
@:bitmap( "shadock_complique.jpg" ) class Shadok2 extends BitmapData{}
@:bitmap( "shadock_dormir.jpg" ) class Shadok3 extends BitmapData{}
@:bitmap( "shadock_essayer.jpg" ) class Shadok4 extends BitmapData{}
@:bitmap( "shadock_intelligence.jpg" ) class Shadok5 extends BitmapData{}
@:bitmap( "shadock_passoire.jpg" ) class Shadok6 extends BitmapData{}
@:bitmap( "shadock_solution.jpg" ) class Shadok7 extends BitmapData{}
@:bitmap( "shadock_tobeornot.jpg" ) class Shadok8 extends BitmapData{}
@:bitmap( "shadock_maladie.jpg" ) class Shadok9 extends BitmapData{}
@:bitmap( "shadock_battu.jpg" ) class Shadok10 extends BitmapData{}

/**
    Define the display grid

	Date: 26/06/13
	Time: 23:01
 **/
class Grid extends Sprite
{
	private var __cards:Array<{ image:Bitmap, name:String }>;
	private var __selected:Card;

	public function new()
	{
		super();
		__init();
		__refresh();
	}

	/*
		Initialize default values
	 */
	private function __init()
	{
		__cards =
		[
			{ image : new Bitmap( new Shadok1(0, 0) ), name : "Shadok1" }
			,{ image : new Bitmap( new Shadok1(0, 0) ), name : "Shadok1" }
			,{ image : new Bitmap( new Shadok2(0, 0) ), name : "Shadok2" }
			,{ image : new Bitmap( new Shadok2(0, 0) ), name : "Shadok2" }
			,{ image : new Bitmap( new Shadok3(0, 0) ), name : "Shadok3" }
			,{ image : new Bitmap( new Shadok3(0, 0) ), name : "Shadok3" }
			,{ image : new Bitmap( new Shadok4(0, 0) ), name : "Shadok4" }
			,{ image : new Bitmap( new Shadok4(0, 0) ), name : "Shadok4" }
			,{ image : new Bitmap( new Shadok5(0, 0) ), name : "Shadok5" }
			,{ image : new Bitmap( new Shadok5(0, 0) ), name : "Shadok5" }
			,{ image : new Bitmap( new Shadok6(0, 0) ), name : "Shadok6" }
			,{ image : new Bitmap( new Shadok6(0, 0) ), name : "Shadok6" }
			,{ image : new Bitmap( new Shadok7(0, 0) ), name : "Shadok7" }
			,{ image : new Bitmap( new Shadok7(0, 0) ), name : "Shadok7" }
			,{ image : new Bitmap( new Shadok8(0, 0) ), name : "Shadok8" }
			,{ image : new Bitmap( new Shadok8(0, 0) ), name : "Shadok8" }
			,{ image : new Bitmap( new Shadok9(0, 0) ), name : "Shadok9" }
			,{ image : new Bitmap( new Shadok9(0, 0) ), name : "Shadok9" }
			,{ image : new Bitmap( new Shadok10(0, 0) ), name : "Shadok10" }
			,{ image : new Bitmap( new Shadok10(0, 0) ), name : "Shadok10" }
		];
	}

	/*
		Refresh the entire grid
	 */
	private function __refresh()
	{
		__shuffle( __cards );

		var s
			,i = 0
			,j = 0;
		for( c in __cards )
		{
			s = addChild( new Card( c.image, c.name ) );
			s.x = i* ( s.width + 5 );
			s.y = j* ( s.height + 5 );

			i++;
			if( i >= 5 )
			{
				i = 0;
				j++;
			}
		}

		addEventListener( MouseEvent.CLICK, __cardClicked, true );
	}

	/*
		Shuffles the "arr" Array (in place) according to a randomly chosen permutation
		This is the classic Fisher-Yates style shuffle.
	*/
	private function __shuffle<T>( arr:Array<T> )
	{
		var n = arr.length;
		while (n > 1){
			var k = Std.random(n);
			n--;
			var temp = arr[n];
			arr[n] = arr[k];
			arr[k]= temp;
		}
	}

	/*
		Card event notification
	 */
	private function __cardClicked( event )
	{
		var card_target = cast( event.target, Card );

		if( ! card_target.paired )
		{
			// Add to selected pool
			if( __selected == null )
			{
				// 1st choice
				__selected = card_target;
				__selected.expose();
			} else
			{
				card_target.expose();

				// 2nd choice
				if( __selected.name == card_target.name )
				{
					// Win !
					// TODO addPoint
					__selected.paired = true;
					card_target.paired = true;
				} else
				{
					// Loose
					// Flip cards later
					var selected = __selected;
					var wait = new Timer( 500, 1 );
					wait.addEventListener
					(
						TimerEvent.TIMER
						,function( e )
						{
							selected.flipBack();
							card_target.flipBack();

						}
					);
					wait.start();
				}
				__selected = null;
			}
		}
	}
}
