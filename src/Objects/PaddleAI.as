package Objects 
{
	import Graphics.Draw.DrawRect;
	import Math.Vector2D;
	import Objects.Ball
	/**
	 * ...
	 * @author Rick musters
	 */
	public class PaddleAI extends DrawRect 
	{
		private var position:Vector2D;
		public static var cpuPaddleSpeed:Number;
		
		public function PaddleAI(_x:Number,_y:Number,width:Number,height:Number,color:uint,lineThicknes:Number) 
		{
			super(width, height, color, lineThicknes);
			position = new Vector2D(_x, _y);
			this.x = position.x;
			this.y = position.y;
		}
		
		public function CpuMove(xPos:Boolean, yPos:Boolean):void
		{
			this.x = position.x;
			this.y = position.y;
			
			if (yPos)
			{
				if (position.y + 40 < Ball.position.y - 20)
				{
					position.y += cpuPaddleSpeed;
				}
				if (position.y + 40 > Ball.position.y + 20)
				{
					position.y -= cpuPaddleSpeed;
				}
			}
			
			if (xPos)
			{
				if (position.x + 40 < Ball.position.x - 10)
				{
					position.x += cpuPaddleSpeed;
				}
				if (position.x + 40 > Ball.position.x + 10)
				{
					position.x -= cpuPaddleSpeed;
				}
			}
		}
		
		public function WallCollision(xPos:Boolean, yPos:Boolean):void
		{
			if (xPos)
			{
				if (position.x <= stage.stageWidth / 2 + 20)
				{
					position.x = stage.stageWidth / 2 + 20;
				}
				if (position.x >= stage.stageWidth - this.width - 20)
				{
					position.x = stage.stageWidth - this.width - 20;
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