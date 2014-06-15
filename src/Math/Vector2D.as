package Math 
{
	/**
	 * ...
	 * @author Rick musters
	 */
	public class Vector2D 
	{
		private var _x:Number;
		private var _y:Number;
		
		public function Vector2D(x:Number = 0, y:Number = 0) {
			_x = x;
			_y = y;
		}
		
		public function add(vector2:Vector2D):Vector2D{
			_x += vector2.x;
			_y += vector2.y;
			
			return this;
		}
		
		public function set y(value:Number):void{
			_y = value;
		}
		
		public function get y():Number{
			return _y;
		}
		
		public function set x(value:Number):void {
			_x = value;
		}
		
		public function get x():Number {
			return _x;
		}
		
		
	}

}