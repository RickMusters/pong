package 
{
	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.events.TimerEvent;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.net.URLRequest;
	import flash.utils.Timer;
	import Graphics.Create.CreateTextButton;
	import Graphics.Draw.DrawLine;
	import Graphics.Draw.DrawRect;
	import Input.MultiPlayerInput;
	import Menu.Difficulty;
	import Objects.Ball;
	import Objects.Paddle;
	import Data.Score;
	import Objects.PaddleAI;
	import Menu.StartGame
	import flash.system.fscommand;
	
	/**
	 * ...
	 * @author Rick musters
	 */
	public class Game extends Sprite 
	{	
		
		private var minute:Number = 0;
		private var second:Number = 0;
		
		private var gameMenu:StartGame = new StartGame();
		private var difficultyMenu:Difficulty = new Difficulty();
		
		private var background:DrawRect = new DrawRect(1000, 600, 0x000000, 4);
		
		private var ball:Ball = new Ball(500, 300, 10, 0x00ff00, 4);
		
		private var paddleL:Paddle = new Paddle(10, 0, 80, 10, 0xff00f0, 4);	
		private var paddleL2:Paddle = new Paddle(10, 590, 80, 10, 0xff00f0, 4);
		private var paddleL3:Paddle = new Paddle(0, 220, 10, 80, 0xff00f0, 4);
		
		private var cpuPaddle1:PaddleAI = new PaddleAI(990, 220, 10, 80, 0xff0f00, 4);
		private var cpuPaddle2:PaddleAI = new PaddleAI(910, 0, 80, 10, 0xff0f00, 4);
		private var cpuPaddle3:PaddleAI = new PaddleAI(910, 590, 80, 10, 0xff0f00, 4);
		
		private var line:DrawLine = new DrawLine(500, 600, 500, 0);
		
		private var multi:MultiPlayerInput = new MultiPlayerInput();
		
		[Embed(source="../lib/pong.mp3")]
		private var mySound: Class;
		private var sound:Sound;
		private var sc:SoundChannel;
		
		private var score:Score = new Score(200, 300, 500, 40, 0xffffff);
		
		private var time:CreateTextButton;
	
		public function Game():void
		{
			addChild(gameMenu);

			gameMenu.startButton.addEventListener(MouseEvent.CLICK, StartClick);
			gameMenu.quitButton.addEventListener(MouseEvent.CLICK, quitClick);
			difficultyMenu.easy.addEventListener(MouseEvent.CLICK, EasyClick);
			difficultyMenu.normal.addEventListener(MouseEvent.CLICK, normalClick);
			difficultyMenu.hard.addEventListener(MouseEvent.CLICK, hardClick);
		}
		
		private function quitClick(e:MouseEvent):void 
		{
			fscommand("quit");
		}
		
		private function hardClick(e:MouseEvent):void 
		{
			PaddleAI.cpuPaddleSpeed = 7;
			init();
		}
		
		private function normalClick(e:MouseEvent):void 
		{
			PaddleAI.cpuPaddleSpeed = 5;
			init();
		}
		
		private function EasyClick(e:MouseEvent):void 
		{
			PaddleAI.cpuPaddleSpeed = 3;
			init();
		}
		
		private function StartClick(e:MouseEvent):void 
		{
			addChild(difficultyMenu);
			removeChild(gameMenu);
		}
		
		private function init():void 
		{ 
			sound = (new mySound) as Sound;
			sc = sound.play(0, 9999);
			
			time = new CreateTextButton(462, 100, 105, "Verdana", 40, 0xffffff, minute + ":" + second);
			
			removeChild(difficultyMenu);

			addChild(background);
			
			addChild(line);
			
			addChild(time);
			
			addChild(score);
			addChild(line);
			
			addChild(paddleL);
			addChild(paddleL2);
			addChild(paddleL3);
			
			addChild(cpuPaddle1);
			addChild(cpuPaddle2);
			addChild(cpuPaddle3);
			
			addChild(ball);
			
			var timer:Timer = new Timer(1000, 0);
			timer.addEventListener(TimerEvent.TIMER, Clock);
			timer.start();
			
			stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDown);
			stage.addEventListener(KeyboardEvent.KEY_UP, keyUp);
			stage.addEventListener(Event.ENTER_FRAME, loop);
		}
		
		private function Clock(evt:TimerEvent):void 
		{
			second += 1;
			
			if (second > 59) 
			{
				
				minute += 1;
				
				second = 00;
			}
			
		}
		
		private function loop(e:Event):void 
		{
			time.update(minute + ":" + second);
			score.UpdateScore();
			
			paddleL.CollisionCheck(true, false);
			paddleL2.CollisionCheck(true, false);
			paddleL3.CollisionCheck(false, true);
			
			paddleL.Move(12, true, false);
			paddleL2.Move( -12, true, false);
			paddleL3.Move(12, false, true);
			
			cpuPaddle1.CpuMove(false, true);
			cpuPaddle2.CpuMove(true, false);
			cpuPaddle3.CpuMove(true, false);

			cpuPaddle1.WallCollision(false, true);
			cpuPaddle2.WallCollision(true, false);
			cpuPaddle3.WallCollision(true, false);
			
			ball.WallCollisionAndMove();
			ball.PaddleCollision(paddleL, cpuPaddle1);
			ball.PaddleCollision(paddleL2, cpuPaddle2);
			ball.PaddleCollision(paddleL3, cpuPaddle3);
			if (minute == 1)
			{
				fscommand("quit");
			}
		}
		
		private function keyDown(e:KeyboardEvent):void 
		{ 
			multi.keyDown(e.keyCode);
		}
		
		private function keyUp(e:KeyboardEvent):void 
		{
			multi.keyUp(e.keyCode);
		}
		
		
	}
}