package Graphics.Draw 
{
	import flash.display.Sprite;
	/**
	 * ...
	 * @author Rick musters
	 */
	public class DrawCircle extends Sprite
	{
		protected var color:uint;
		protected var radius:Number;
		protected var lineThicknes:Number;
		
		public function DrawCircle(radius:Number, color:uint, lineThicknes:Number):void 
		{
			this.radius = radius;
			this.color = color;
			this.lineThicknes = lineThicknes;
			this.Draw();
		}
		
		public function Draw():void
		{
			this.graphics.lineStyle(this.lineThicknes);
			this.graphics.beginFill(this.color);
			this.graphics.drawCircle(0, 0, this.radius);
		}
	}

}