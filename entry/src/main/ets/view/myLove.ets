import ItemData from '../bean/ItemData';
import mainViewModel from '../viewmodel/IndexViewModel';

@Entry
  /**
   * 我的收藏
   */
@Component
export default struct myLove {
  // 接收传递过来的参数
  @State account: string = '';

  @Builder
  settingCell(item: ItemData) {
    Row() {
      Row({ space: 12 }) {
        Image(item.img)
          .width(22)
          .height(22)
        Text(item.title)
          .fontSize(16)
      }
    }
  }

  build() {
    Scroll() {
      NavDestination() {
        Column({ space: 12 }) {
          // 第二个网格布局（设置每行 4 个项目，每屏显示 6 行）
          Scroll() {
            Grid() {
              ForEach(mainViewModel.getLoveGridData(), (loveItem: ItemData) => {
                GridItem() {
                  Column() {
                    Text(loveItem.title)
                      .fontSize(30)
                      .fontWeight(FontWeight.Medium)
                      .fontColor('blue')
                    Text(loveItem.others)
                      .margin({ top: 4 })
                      .fontSize(12)
                      .fontColor($r('app.color.home_grid_fontColor'))
                  }
                }
                .borderRadius(12)
                .align(Alignment.TopStart)
                .backgroundImage(loveItem.img) // 确保图片正确引用
                .backgroundImageSize(ImageSize.Cover) // 设置背景图片大小
                .height('100vp') // 确保每个项目的高度合适
              }, (loveItem: ItemData) => JSON.stringify(loveItem))
            }
            .width('100%')
            .columnsTemplate('1fr 1fr 1fr 1fr') // 每行 4 个项目
            .rowsTemplate('1fr 1fr 1fr 1fr 1fr 1fr') // 显示 6 行
            .columnsGap(5)
            .rowsGap(5)
            .height('auto')
          }
        }
      }
    }
  }
}
