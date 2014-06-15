package Objects 
{
	import flash.events.Event;
	import Graphics.Draw.DrawRect;
	import Input.MultiPlayerInput;
	import Math.Vector2D;
	/**
	 * ...
	 * @author Rick musters
	 */
	public class Paddle extends DrawRect
	{
		private var position:Vector2D;
		
		public function Paddle(_x:Number,_y:Number,width:Number,height:Number,color:uint,lineThicknes:Number) 
		{
			super(width, height, color, lineThicknes);
			position = new Vector2D(_x, _y);
			this.x = position.x;
			this.y = position.y;
		}
		
		
		public function Move(speed:int,xPos:Boolean,ypos:Boolean):void
		{
			this.y = position.y;
			this.x = position.x;
			
			if (MultiPlayerInput.p1_Down_Bool)
			{
				if (ypos)
				{
					position.y += speed;
				}
				if (xPos)
				{
					position.x += speed;
				}
			}
			if (MultiPlayerInput.p1_Up_Bool)
			{
				if (ypos)
					{
						position.y -= speed;
					}
					if (xPos)
					{
						position.x -= speed;
					}
			}
		}
		public function CollisionCheck(xPos:Boolean, yPos:Boolean):void
		{
			if (xPos)
			{
				if (position.x >= stage.stageWidth/2 - this.width)
				{
					position.x = stage.stageWidth/2 - this.width;
				}
				if (position.x <= this.width * 0 + 20)
				{
					position.x = this.width * 0 + 20;
				}
			}
			if (yPos)
			{
				if (position.y >= stage.stageHeight - this.height - 20)
				{
					position.y = stage.stageHeight - this.height - 20;
				}
				if (position.y <= stage.stageHeight * 0 + 20)
				{
					position.y = stage.stageHeight * 0 + 20;
				}
			}
		}
	}

}