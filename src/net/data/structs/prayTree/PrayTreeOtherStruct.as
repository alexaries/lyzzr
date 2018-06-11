/**
 * Created by Haru on 2017/8/4.
 */
package net.data.structs.prayTree {
public class PrayTreeOtherStruct {
    /**
     *是否发起许愿
     */
    public var hasWish:Boolean;
    /**
     *愿望ID
     */
    public var wishID:int;
    /**
     *许愿值
     */
    public var wishCount:int;
    /**
     *最大愿望值
     */
    public var maxWishCount:int = 10;
    /**
     *当日是否对该好友许过愿
     */
    public var myHasHelpWish:Boolean;
    /**
     *好友为该玩家祝福的总次数
     */
    public var wishTomeTimes:uint;

    public function PrayTreeOtherStruct() {
    }
}
}
