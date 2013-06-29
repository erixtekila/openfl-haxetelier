package mb;

import flash.display.Bitmap;
import flash.display.Shape;
import flash.display.Sprite;

import motion.Actuate;
import motion.easing.Quad;

/**
    Card values

	Date: 26/06/13
	Time: 23:06
 **/
class Card extends Sprite
{
	private var __card_back:Shape;
	private var __image:Bitmap;
	@:isVar public var paired( get, set ):Bool;

	public function set_paired( value:Bool ):Bool
	{
		return paired = value;
	}

	public function get_paired( ):Bool
	{
		return paired;
	}


	public function new( image:Bitmap, name:String )
	{
		super();

		__image = image;
		this.name = name;
		paired = false;

		__init();
	}

	/*
		Initialize card
	 */
	private function __init()
	{
		__card_back = new Shape();
		var g = __card_back.graphics;
		g.beginFill( 0x123456 );
		g.drawRect( 0, 0, 150, 200 );
		addChild( __card_back );

		__image.width = __card_back.width;
		__image.height = __card_back.height;
		__image.visible = false;
		addChild( __image );
	}

	/*
		Expose the card
	 */
	public function expose()
	{
		__image.visible = true;
		Actuate.tween
		(
			__image
			,.2
			,{ alpha : 1 }
			, false
		).ease( Quad.easeOut )
		.onComplete
		(
			function()
			{

			}
		);
	}

	/*
		Flip the card back
	 */
	public function flipBack()
	{

		Actuate.tween
		(
			__image
			,.5
			,{ alpha : 0 }
			, false
		).ease( Quad.easeOut )
		.onComplete
		(
			function()
			{
				__image.visible = false;
			}
		);
	}
}
