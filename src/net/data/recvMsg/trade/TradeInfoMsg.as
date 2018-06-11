package net.data.recvMsg.trade {
import utils.ByteArray;

import net.consts.StaticConfig;
import net.data.BaseMsg;
import net.data.structs.pack.EqInfoStruct;
import net.data.structs.pack.ItemStruct;
import net.data.structs.trade.TradeInfoStruct;
import net.utils.BytesUtil;

public class TradeInfoMsg extends BaseMsg {
    public function TradeInfoMsg() {
        super();
    }

    private var _tradeInfo:Array;
    public var itemList:Array;
    private var tradeInfoStruct:TradeInfoStruct;

    override public function byteArrayToMsg(bytes:ByteArray):Boolean {

        _tradeInfo = [];
        itemList = [];
        var id:uint = bytes.readUnsignedInt();
        var side:uint = BytesUtil.readByte1(bytes);
        var state:uint = BytesUtil.readByte1(bytes);
        var coin:uint = bytes.readUnsignedInt();
        var gold:uint = bytes.readUnsignedInt();
        var launchItemNum:uint = BytesUtil.readByte2(bytes);
//				var tradedItemNum:uint=BytesUtil.readByte2(bytes);
        var itemChange:Array;
        _tradeInfo.push(id);
        _tradeInfo.push(side);
        _tradeInfo.push(state);
        _tradeInfo.push(coin);
        _tradeInfo.push(gold);
        _tradeInfo.push(launchItemNum);
//				_tradeInfo.push(tradedItemNum);
        if (launchItemNum != 0) {
            var itemStruct:ItemStruct;
            for (var i:uint = 0; i < launchItemNum; i++) {
                itemStruct = new ItemStruct();
                itemStruct.itemId = bytes.readUnsignedInt();
                itemStruct.binding = BytesUtil.readByte1(bytes);
                itemStruct.itemNums = BytesUtil.readByte2(bytes);
                itemStruct.type = ItemStruct.COMM;
                if (itemStruct.itemId >= StaticConfig.EQ_START_FLOW_ID) {
                    itemStruct.type = 1;
                    if (itemStruct.itemNums == 0) {
                        itemList.push(itemStruct);
                        continue;
                    }
                    itemStruct.eqInfo = new EqInfoStruct();
                    itemStruct.eqInfo.eqId = BytesUtil.readByte2(bytes);
                    itemStruct.eqInfo.enhanceLevel = BytesUtil.readByte1(bytes);
                    itemStruct.eqInfo.boreNums = BytesUtil.readByte1(bytes);
                    for (var j:uint = 0; j < itemStruct.eqInfo.boreNums; j++) {
                        itemStruct.eqInfo.jewelIds.push(BytesUtil.readByte2(bytes));
                    }

                    itemStruct.eqInfo.exNums = BytesUtil.readByte1(bytes);
                    for (var k:uint = 0; k < itemStruct.eqInfo.exNums; k++) {
                        var type:uint = BytesUtil.readByte1(bytes);
                        var exValue:Number = BytesUtil.readByte2(bytes);
                        itemStruct.eqInfo.exProps.push([type, exValue]);
                    }
                    //if(itemStruct.eqInfo.eqId<1700&&itemStruct.eqInfo.eqId>=1500)
                    //{
                    //	itemStruct.eqInfo.currentLevel = BytesUtil.readByte1(bytes);
                    ///	itemStruct.eqInfo.maxLevel = BytesUtil.readByte1(bytes);
                    //	itemStruct.eqInfo.currentExp = bytes.readUnsignedInt();
                    //}
                }
                //客户端处理物品数据的时候。需要将物品分栏。先在这里分好
                /*if(itemStruct.itemId>=StaticConfig.EQ_START_FLOW_ID)
                 itemStruct.type = ItemStruct.EQ;
                 else if(itemStruct.itemId<=StaticConfig.JEWEL_LIMIT_ID)
                 itemStruct.type = ItemStruct.JEWELS;
                 else if(itemStruct.itemId<StaticConfig.FAVORITE_LIMIT_ID)
                 itemStruct.type = ItemStruct.COMM;
                 else if(itemStruct.itemId<StaticConfig.BUSSINESS_LIMIT_ID)
                 itemStruct.type = ItemStruct.COMM;
                 else if(itemStruct.itemId<StaticConfig.TASK_LIMIT_ID)
                 itemStruct.type = ItemStruct.TASK;
                 else
                 itemStruct.type = ItemStruct.OTHERS;*///由何鑫注释，由交易模块自己判断，PackUtil.getTypeById(itemStruct.itemId);

                itemList.push(itemStruct);
            }
//					for(var i:uint = 0;i<launchItemNum;i++)
//					{
//						tradeInfoStruct = new TradeInfoStruct();
//						itemStruct.itemId = bytes.readUnsignedInt();
//						itemStruct.binding = BytesUtil.readByte1(bytes);
//						itemStruct.itemNums = BytesUtil.readByte2(bytes);				
//						tradeInfoStruct.type = BytesUtil.readByte1(bytes);
//						if(tradeInfoStruct.type==0)
//						{
//							tradeInfoStruct.itemId=bytes.readUnsignedInt();
//							tradeInfoStruct.pileNum=BytesUtil.readByte2(bytes);
//						}
//						else
//						{
//							tradeInfoStruct.itemId=bytes.readUnsignedInt();
//							tradeInfoStruct.pileNum=BytesUtil.readByte2(bytes);
//							tradeInfoStruct.eqFlowId=BytesUtil.readByte1(bytes);
//							tradeInfoStruct.enhanceLevel = BytesUtil.readByte1(bytes)
//							tradeInfoStruct.boreNums = BytesUtil.readByte1(bytes);
//							tradeInfoStruct.jewelNum = BytesUtil.readByte1(bytes);
//							for(var j:uint = 0;j<tradeInfoStruct.jewelNum;j++)
//							{
//								tradeInfoStruct.jewelIds.push(BytesUtil.readByte2(bytes));						
//							}
//							tradeInfoStruct.exNums = BytesUtil.readByte1(bytes);
//							for(var k:uint = 0;k<tradeInfoStruct.exNums;k++)
//							{
//								var type:uint = BytesUtil.readByte1(bytes);
//								var exValue:Number = BytesUtil.readByte2(bytes);
//								tradeInfoStruct.exProps.push([type,exValue])
//							}
//						}
//						itemChange.push(tradeInfoStruct);
//					}
            _tradeInfo.push(itemList);
        }
//				for(i = 0;i<tradedItemNum;i++)
//				{
//					tradeInfoStruct = new TradeInfoStruct();
//					tradeInfoStruct.type = BytesUtil.readByte1(bytes);
//					if(tradeInfoStruct.type==0)
//					{
//						tradeInfoStruct.itemId=bytes.readUnsignedInt();
//						tradeInfoStruct.pileNum=BytesUtil.readByte2(bytes);
//					}
//					else
//					{
//						tradeInfoStruct.itemId=bytes.readUnsignedInt();
//						tradeInfoStruct.pileNum=BytesUtil.readByte2(bytes);
//						tradeInfoStruct.eqFlowId=BytesUtil.readByte1(bytes);
//						tradeInfoStruct.enhanceLevel = BytesUtil.readByte1(bytes)
//						tradeInfoStruct.boreNums = BytesUtil.readByte1(bytes);
//						tradeInfoStruct.jewelNum = BytesUtil.readByte1(bytes);
//						for( j= 0;j<tradeInfoStruct.jewelNum;j++)
//						{
//							tradeInfoStruct.jewelIds.push(BytesUtil.readByte2(bytes));						
//						}
//						tradeInfoStruct.exNums = BytesUtil.readByte1(bytes);
//						for(k = 0;k<tradeInfoStruct.exNums;k++)
//						{
//							type = BytesUtil.readByte1(bytes);
//							exValue = BytesUtil.readByte2(bytes);
//							tradeInfoStruct.exProps.push([type,exValue])
//						}
//					}
//					itemChange.push(tradeInfoStruct);
//				}
//				_tradeInfo.push(itemChange);
        return true;
    }

    public function getTradeInfo():Array {
        return _tradeInfo;
    }
}
}