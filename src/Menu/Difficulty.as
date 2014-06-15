package Menu 
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import Graphics.Create.CreateTextButton;
	/**
	 * ...
	 * @author Rick musters
	 */
	public class Difficulty extends Sprite
	{
		[Embed(source = "../../lib/Untitled-1.png")]
		private var Bg:Class;
		
		public var easy:CreateTextButton = new CreateTextButton(390, 200, 250, "Verdana", 40, 0xffffff, "Easy");
		public var normal:CreateTextButton = new CreateTextButton(390, 300, 250, "Verdana", 40, 0xffffff, "Normal");
		public var hard:CreateTextButton = new CreateTextButton(390, 400, 250, "Verdana", 40, 0xffffff, "Hard");
		
		public function Difficulty() 
		{
			var background:Bitmap = new Bg;
			addChild(background);
			
			addChild(easy);
			addChild(normal);
			addChild(hard);
		}
		
	}

}