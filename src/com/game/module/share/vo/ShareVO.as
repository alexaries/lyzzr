/**
 * Created by guanll on 2018/1/17.
 */
package com.game.module.share.vo {
public class ShareVO {
    /**
     * 0:未分享,时间戳:已分享,UInt32(-1):已经领奖
     */
    public var sharetime:int;
    /**
     * 0:未关注,时间戳:已关注,UInt32(-1):已经领奖
     */
    public var concerntime:int;
    public function ShareVO() {
    }
}
}
