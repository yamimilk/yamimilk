//import { Text, Column, Row, Image, Scroll, Alignment, FontWeight, Button } from '@ohos.ui';
import mainViewModel from '../viewmodel/CartViewModel';
import CartItemData from '../bean/CartItemData';

/**
 * 购物车页面
 */
@Entry
@Component
export default struct CartPage {
  build() {
    Scroll() {
      NavDestination() {
        Column({ space: 12 }) {
          // 渲染购物车项
          ForEach(mainViewModel.getCartData(), (cartItem: CartItemData) => {
            Row({ space: 12 }) {
              // 商品图片
              Image(cartItem.img)
                .width(80)
                .height(80)
                .borderRadius(8)
                .align(Alignment.Center)

              // 商品信息
              Column({ space: 4 }) {
                Text(cartItem.title)
                  .fontSize(16)
                  .fontWeight(FontWeight.Bold)
                  .fontColor('#333')

                Row({ space: 8 }) {
                  Text(`价格: ¥${cartItem.price.toFixed(2)}`)
                    .fontSize(14)
                    .fontColor('#555')

                  Text(`数量: ${cartItem.quantity}`)
                    .fontSize(14)
                    .fontColor('#555')
                }
              }

              // 商品详情按钮
              // Button('查看详情')
              //   .onClick(() => {
              //     // 点击后导航到商品详情页
              //     this.pageStack.pushPathByName(cartItem.page, cartItem);
              //   })
              //   .backgroundColor('#ff7f50')
              //   .fontSize(14)
              //   .fontColor('#fff')
              //   .padding({ top: 4, bottom: 4, left: 12, right: 12 })
            }
            .width('100%')
            .height('auto')
            .backgroundColor('#f9f9f9') // 每个商品背景
            .borderRadius(8)
            .padding({
              top: 8,
              bottom: 8,
              left: 12,
              right: 12
            })
            .margin({ bottom: 12 })
          }, (cartItem: CartItemData) => JSON.stringify(cartItem)) // 使用商品数据生成唯一标识
        }
      }
    }
  }
}
