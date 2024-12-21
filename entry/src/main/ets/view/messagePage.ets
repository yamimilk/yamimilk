// import { Text, Column, Row, Image, Scroll, Alignment, FontWeight } from '@ohos.';
import mainViewModel from '../viewmodel/MessageViewModel';
import MessageItemData from '../bean/MessageItemData';

/**
 * 消息页面
 */
@Entry
@Component
export default struct messagePage {
  build() {
    Scroll() {
      NavDestination() {
        Column({ space: 12 }) {
          ForEach(mainViewModel.getMessageData(), (msg: MessageItemData) => {
            Row({ space: 12 }) {
              // 渲染头像
              Image(msg.avatar)
                .width(40)
                .height(40)
                .borderRadius(20)
                .align(Alignment.Center)

              // 消息内容
              Column({ space: 4 }) {
                Text(msg.sender)
                  .fontSize(16)
                  .fontWeight(FontWeight.Bold)
                  .fontColor('#333')

                Text(msg.content)
                  .fontSize(14)
                  .fontColor('#555')

                Text(msg.timestamp)
                  .fontSize(12)
                  .fontColor('#888')
              }
            }
            .width('100%')
            .height('auto')
            .backgroundColor('#f0f0f0') // 消息框背景颜色
            .borderRadius(12)
            .padding({
              top: 8,
              bottom: 8,
              left: 12,
              right: 12
            })
          }, (msg: MessageItemData) => JSON.stringify(msg)) // 为每个消息生成一个唯一的标识
        }
      }
    }
  }
}
