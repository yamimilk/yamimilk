import mainViewModel from '../viewmodel/IndexViewModel';
import ItemData from '../bean/ItemData';

/**
 * 我的收藏页面
 */
@Entry
@Component
export default struct MyCollection {

  private swiperController: SwiperController = new SwiperController();

  build() {
    Scroll() {
      Column({ space: 12 }) {
        // 我的收藏
        Column() {
          Text('我的收藏')
            .fontWeight(FontWeight.Medium)
            .fontSize(24)
            .margin({ top: 12 })
            .padding({ left: 12 })
        }
        .width('100%')
        .alignItems(HorizontalAlign.Start)
        // 收藏列表
        List() {
          ForEach(mainViewModel.getCollectionData(), (item: ItemData) => {
            ListItem() {
              Column() {
                Image(item.img)
                  .borderRadius(16)
                Text(item.title)
                  .fontSize(16)
                  .margin({ top: 8 })
              }
            }
            .padding({ top: 12 })
          }, (item: ItemData) => JSON.stringify(item.title))
        }
        .margin({ top: 24 })
      }
    }
  }
}