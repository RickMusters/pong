package Objects 
{
	import Graphics.Draw.DrawCircle;
	import Math.Vector2D;
	import Data.Score;
	/**
	 * ...
	 * @author Rick musters
	 */
	public class Ball extends DrawCircle
	{
		public static var position:Vector2D;
		private var velocity:Vector2D = new Vector2D(11,12);
		private var ySpeed:Number;
		
		public function Ball(_x:Number,_y:Number,radius:Number,color:uint,lineThicknes:Number) 
		{
			super(radius, color, lineThicknes);
			position = new Vector2D(_x, _y);
			this.x = position.x;
			this.y = position.y;
		}
		
		//Check Collion with The Screen sides!
		public function WallCollisionAndMove():void
		{
			position = position.add(velocity);
			this.x = position.x;
			this.y = position.y;
			
			if (position.y >= stage.stageHeight - this.height/2 && position.x >= stage.stageWidth/2)
			{
				Score.scoreP1 ++;
			}
			
			if (position.y >= stage.stageHeight - this.height / 2 && position.x <= stage.stageWidth / 2)
			{
				Score.scoreP2 ++;
			}
			
			if (position.y <= this.height / 2 && position.x >= stage.stageWidth/2)
			{
				Score.scoreP1++;
			}
			if (position.y <= this.height / 2 && position.x <= stage.stageWidth / 2)
			{
				Score.scoreP2 ++;
			}
			
			if (position.y >= stage.stageHeight - this.height/2)
			{
				position.y = stage.stageHeight - this.height;
				velocity.y *= -1;
			}
			
			if (position.y <= this.height / 2)
			{
				position.y = this.height / 2;
				velocity.y *= -1;
			}
			
			if (position.x >= stage.stageWidth - this.width / 2)
			{
				position.x = stage.stageWidth - this.width / 2;
				velocity.x *= -1;
				Score.scoreP1 ++;
			}
			
			if (position.x <= this.width / 2)
			{
				position.x = this.width / 2;
				velocity.x *= -1;
				Score.scoreP2 ++;
			}
		}
		
		// Check Collision with the paddles!
		public function PaddleCollision(paddle:Paddle, paddle1:PaddleAI):void
		{
			if (hitTestObject(paddle) == true)
			{
				BallAngle(paddle.y, this.y);
				velocity.x *= -1;
				velocity.y = ySpeed;
			}
			
			if (hitTestObject(paddle1) == true)
			{
				BallAngle(paddle1.y, this.y);
				velocity.x *= -1;
				velocity.y = ySpeed;
			}
			
		}
		
		//Calculate BallAngle!
		public function BallAngle(playerY:Number, ballY:Number):void
		{
			ySpeed = 5 * ((ballY - playerY) / 25);
		}
		
	}

}