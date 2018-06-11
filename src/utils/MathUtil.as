package utils
{
import laya.maths.Point;

public class MathUtil
	{
        public static function equals(a:Point,o:Point):Boolean {
            return a.x == o.x && a.y == o.y;
        }
		public function MathUtil()
		{
		}
		//以水平为基础得到两点之间的弧度值,xy不为负数
		public static function getMoveRadians(startPoint:Point, endPoint:Point):Number
		{
			if(equals(startPoint,endPoint)) return 0;
			return Math.atan(Math.abs(endPoint.y - startPoint.y)/Math.abs(endPoint.x - startPoint.x));	
		}
		//以水平为基础得到两点之间的弧度值,xy可为负数
		public static function getMoveRadiansInit(startPoint:Point, endPoint:Point):Number
		{
			if(equals(startPoint,endPoint)) return 0;
			return Math.atan2(endPoint.y - startPoint.y, endPoint.x - startPoint.x);	
		}
		//以水平为基础得到两点之间的角度值(-180至180)
		public static function getMoveDegrees(startPoint:Point, endPoint:Point):int
		{
			return getMoveRadiansInit(startPoint, endPoint) * 180 /Math.PI;
		}
		
		/**
		 * Generates a random number.  NOTE: To create a series of predictable
		 * random numbers, add the random number you generate each time
		 * to the <code>Seed</code> value before calling <code>random()</code> again.
		 * 
		 * @param	Seed	A user-provided value used to calculate a predictable random number.
		 * 
		 * @return	A <code>Number</code> between 0 and 1.
		 */
		static public function random(Seed:Number=NaN):Number
		{
			if(isNaN(Seed))
				return Math.random();
			else
			{
				//Make sure the seed value is OK
				if(Seed == 0)
					Seed = Number.MIN_VALUE;
				if(Seed >= 1)
				{
					if((Seed%1) == 0)
						Seed /= Math.PI;
					Seed %= 1;
				}
				else if(Seed < 0)
					Seed = (Seed % 1) + 1;
				
				//Then do an LCG thing and return a predictable random number
				return ((69621 *  Math.floor(Seed * 0x7FFFFFFF)) % 0x7FFFFFFF) / 0x7FFFFFFF;
			}
		}
	}
}