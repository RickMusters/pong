package Graphics.Draw 
{
	import flash.display.Sprite;
	/**
	 * ...
	 * @author Rick musters
	 */
	public class DrawRect extends Sprite
	{
		protected var widthNes:Number;
		protected var heightNes:Number;
		protected var lineThicknes:Number;
		protected var color:uint;
		
		public function DrawRect(width:Number,height:Number,color:uint,lineThicknes:Number) 
		{
			this.heightNes = height;
			this.widthNes = width;
			this.color = color;
			this.lineThicknes = lineThicknes;
			this.Draw();
		}
		
		public function Draw():void 
		{
			this.graphics.lineStyle(this.lineThicknes);
			this.graphics.beginFill(this.color);
			this.graphics.drawRect(this.x, this.y, this.widthNes, this.heightNes);
		}
		
	}

}