/**
 * 消息item数据
 */
export default class MessageItemData {
  sender: string;
  content: string;
  timestamp: string;
  avatar: Resource;

  constructor(sender: string, content: string, timestamp: string, avatar: Resource) {
    this.sender = sender;
    this.content = content;
    this.timestamp = timestamp;
    this.avatar = avatar;
  }
}
