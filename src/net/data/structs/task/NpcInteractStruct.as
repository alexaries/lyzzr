package net.data.structs.task {
/**
 * NpcInteract结构
 */
public class NpcInteractStruct {
    /**
     * 交互类型：任务行为、商店行为、铁匠行为等
     */
    public var interactType:String = "";
    /**
     * 用于显示client的标示
     */
    public var interactToken:uint = 0;
    /**
     * 交互ID
     */
    public var interactId:uint = 0;
    /**
     * 交互步骤
     */
    public var interactStep:uint = 0;
    /**
     * 交互MSG，不定长字符串
     */
    public var interactMsg:String = "";
    public var state:String= "";
    public var guideState:Boolean;

    public function NpcInteractStruct() {
    }
}
}