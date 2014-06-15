 package Input 
{
	import flash.display.Sprite;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	/**
	 * ...
	 * @author Rick musters
	 */
	public class MultiPlayerInput extends Sprite
	{
		public static var p1_Up_Bool:Boolean = false;
		public static var p2_Up_Bool:Boolean = false;
		public static var p1_Down_Bool:Boolean = false;
		public static var p2_Down_Bool:Boolean = false;
		
		public function MultiPlayerInput():void
		{
			
		}
		
		public function keyUp(keycode:int):void
		{
			if (keycode == Keyboard.UP)
			{
				p1_Up_Bool = false;
			}
			if (keycode == Keyboard.DOWN)
			{
				p1_Down_Bool = false;
			}
			if (keycode == Keyboard.W)
			{
				p2_Up_Bool = false;
			}
			if (keycode == Keyboard.S)
			{
				p2_Down_Bool = false;
			}
		}
		
		public function keyDown(keycode:int):void
		{
			if (keycode == Keyboard.UP)
			{
				p1_Up_Bool = true;
			}
			if (keycode == Keyboard.DOWN)
			{
				p1_Down_Bool = true;
			}
			if (keycode == Keyboard.W)
			{
				p2_Up_Bool = true;
			}
			if (keycode == Keyboard.S)
			{
				p2_Down_Bool = true;
			}
		}
		
	}

}