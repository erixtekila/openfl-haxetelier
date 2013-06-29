import flash.text.TextFieldAutoSize;
import flash.text.TextField;
import flash.text.TextFormat;
import flash.text.Font;
import flash.display.Sprite;

@:font("Comic Sans MS.ttf") class ShadokFont extends Font
{}

class Main extends Sprite
{

	public function new( )
	{

		super( );

		Font.registerFont( ShadokFont );

		var shadok_format = new TextFormat ("Comic Sans MS", 30, 0x7A0026);
		var devise = new TextField ();

		devise.defaultTextFormat = shadok_format;
		devise.autoSize = TextFieldAutoSize.LEFT;
		devise.embedFonts = true;
		devise.selectable = false;

		devise.x = 50;
		devise.y = 50;
		devise.text = "Et les shadoks pompaient !";

		addChild( devise );

	}

}