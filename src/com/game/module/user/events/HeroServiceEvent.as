package com.game.module.user.events {
import com.game.events.NotiEvent;

/**
 * @author ryan
 */
public class HeroServiceEvent extends NotiEvent {
    public static const HERO_LIST_UPDATE:String = "HERO_LIST_UPDATE";
    /**
     * 坐骑信息更新
     */
    public static const RIDE_INFO_UPDATE:String = "ride_info_update";
    /**
     * 坐骑模型改变
     */
    public static const HERO_RIDE_CHANGE:String = "hero_ride_change";
    public static const HERO_CHARM_CHANGE:String = "HERO_CHARM_CHANGE";

    public function HeroServiceEvent(type:String, data:Object = null) {
        super(type, data);
        this.data = data;
    }

    public var data:Object;
}
}
