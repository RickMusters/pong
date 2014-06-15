package Data 
{
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import Input.MultiPlayerInput;
	/**
	 * ...
	 * @author Rick musters
	 */
	public class Score extends Sprite
	{
		public static var scoreP1:int = 0;
		public static var scoreP2:int = 0;
		
		private var p1Textfield:TextField = new TextField;
		private var p2Textfield:TextField = new TextField;
		
		private var format:TextFormat;
		
		public function Score(x:Number, y:Number, width:Number, fontsize:Number, color:uint) 
		{
			format = new TextFormat("Verdana", fontsize, color, true);
			
			p1Textfield.x = x;
			p1Textfield.y = y;
			p2Textfield.x = x + 500;
			p2Textfield.y = y;
			
			p1Textfield.width = width;
			p2Textfield.width = p1Textfield.width;
			
			addChild(p1Textfield);
			addChild(p2Textfield);
		}
		
		public function UpdateScore():void
		{
			p1Textfield.text = ("P1: " + scoreP1);
			p1Textfield.setTextFormat(format);
			
			p2Textfield.text = ("P2: " + scoreP2);
			p2Textfield.setTextFormat(format);
		}
		
	}

}