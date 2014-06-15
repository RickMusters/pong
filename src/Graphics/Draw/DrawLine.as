package Graphics.Draw 
{
	import flash.display.Sprite;
	/**
	 * ...
	 * @author Rick musters
	 */
	public class DrawLine extends Sprite
	{
		private var xPos:Number;
		private var yPos:Number;
		private var _x:Number;
		private var _y:Number;
		
		public function DrawLine(x:Number, y:Number,xPos:Number, yPos:Number):void
		{
			this.xPos = xPos;
			this.yPos = yPos;
			this._x = x;
			this._y = y;
			Draw();
		}
		
		private function Draw():void
		{
			this.graphics.lineStyle(10, 0xff0f0f);
			this.graphics.moveTo(this.xPos, this.yPos);
			this.graphics.lineTo(this._x, this._y);
		}
		
	}

}