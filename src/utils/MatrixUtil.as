

package  utils
{
import laya.filters.ColorFilter;

public class MatrixUtil
{

    public static function setBrightness(value:Number):ColorFilter
    {
        value = value/100;

        var m:Array = new Array();
        m = m.concat([1+value, 0, 0, 0, 0]);	// red
        m = m.concat([0, 1+value, 0, 0, 0]);	// green
        m = m.concat([0, 0, 1+value, 0, 0]);	// blue
        m = m.concat([0, 0, 0, 1+value, 0]);		// alpha

        return new ColorFilter(m);
    }

}
}
