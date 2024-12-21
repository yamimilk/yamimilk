import ItemData from '../bean/ItemData';

import MessageItemData from '../bean/MessageItemData';

/**
 * 获取消息数据
 */
export class IndexViewModel {
  getMessageData(): Array<MessageItemData> {
    let messages: MessageItemData[] = [
      new MessageItemData("张三", "你好！这是来自张三的消息。", "2024-12-21 12:30", $r('app.media.fig1')),
      new MessageItemData("李四", "你好呀，我是李四。", "2024-12-21 12:31", $r('app.media.fig2')),
      new MessageItemData("王五", "今天的天气真不错。", "2024-12-21 12:32", $r('app.media.fig3'))
    ];
    return messages;
  }
}

export default new IndexViewModel();
