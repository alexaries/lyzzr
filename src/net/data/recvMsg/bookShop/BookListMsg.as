package net.data.recvMsg.bookShop {
import utils.ByteArray;

import net.data.BaseMsg;

public class BookListMsg extends BaseMsg {
    public var time:uint;
    public var refreshCount:uint;
    public var books:Array;

    public function BookListMsg() {
        super();
    }

    override public function byteArrayToMsg(bytes:ByteArray):Boolean {

        time = bytes.readUnsignedShort();
      //  refreshCount=bytes.readUnsignedShort();
        books = [];
        var count:int = 6;
        for (var i:uint = 0; i < count; i++) {
            var bookId:int = bytes.readUnsignedShort();
            var price:int = bytes.readUnsignedInt();
            trace("BookListMsg",bookId,price);
            books.push({bookID: bookId, Price: price, flag: 0});
        }

        return true;
    }
}
}