package Graphics.Create 
{
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.text.TextFormat;
	/**
	 * ...
	 * @author Rick musters
	 */
	public class CreateTextButton extends Sprite
	{
		private var textField:TextField = new TextField;
		private var format:TextFormat;
		
		public function CreateTextButton(x:Number, y:Number, width:Number, font:String, fontsize:Number, color:uint, text:String) 
		{
			format = new TextFormat(font, fontsize, color, true);
			
			textField.x = x;
			textField.y = y;
			textField.width = width;
			textField.text = (text);
			textField.setTextFormat(format);
			
			addChild(textField);
			
		}
		
		public function update(text:String):void
		{
			textField.text = (text);
			textField.setTextFormat(this.format);
		}
		
	}

}