package Menu 
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import Graphics.Create.CreateTextButton;
	/**
	 * ...
	 * @author Rick musters
	 */
	public class StartGame extends Sprite 
	{
		[Embed(source = "../../lib/Untitled-1.png")]
		private var Bg:Class;
		
		public var startButton:CreateTextButton = new CreateTextButton(390, 200, 250, "Verdana", 40, 0xffffff, "StartGame");
		public var quitButton:CreateTextButton = new CreateTextButton(390, 300, 250, "Verdana", 40, 0xffffff, "QuitGame");
		
		public function StartGame() 
		{
			var background:Bitmap = new Bg;
			addChild(background);
			addChild(startButton);
			addChild(quitButton);
		}
		
	}

}