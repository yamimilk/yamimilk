import mainViewModel from '../viewmodel/IndexViewModel';
import ItemData from '../bean/ItemData';
import myLove from '../view/myLove';
import record from '../view/record';
import MessagePage from './messagePage';
import Record from '../view/record';
import messagePage from './messagePage';
import CartPage from './cart';

/**
 * 首页
 */
@Entry
@Component
export default struct Home {
  private swiperController: SwiperController = new SwiperController();
  @Provide("pageStack") pageStack: NavPathStack = new NavPathStack()
  // navigateToMyLovePage(): void {
  //   let Page = myLove();
  //   Page.navigateTo({
  //     url: '/pages/myLove', // 这里的路径需要根据你的实际文件路径调整
  //   });
  // }


  build() {

      Navigation(this.pageStack) {
        Scroll() {
      Column({ space: 12 }) {
        //首页
        Column() {
          Text('首页')
            .fontWeight(FontWeight.Medium)
            .fontSize(24)
            .margin({ top: 12 })
            .padding({ left: 12 })
        }
        .width('100%')
        .alignItems(HorizontalAlign.Start)

        //轮播图
        Swiper(this.swiperController) {
          ForEach(mainViewModel.getSwiperImages(), (img: Resource) => {
            Image(img).borderRadius(16)
          }, (img: Resource) => JSON.stringify(img.id))
        }
        .margin({ top: 24 })
        .height('150vp')
        .width('310vp')
        .autoPlay(true)

        //第一个网格布局

          Grid() {
            ForEach(mainViewModel.getFirstGridData(), (item: ItemData) => {
              GridItem() {
                Column() {
                  Image(item.img)
                    .width(24)
                    .height(24)
                  Text(item.title)
                    .fontSize(12)
                    .margin({ top: 4 })
                }
                .onClick(() => {
                  this.pageStack.pushPathByName(item.page, item)
                })

              }
            }, (item: ItemData) => JSON.stringify(item))
          }
          .columnsTemplate('1fr 1fr 1fr 1fr')
          .rowsTemplate('1fr 1fr')
          .columnsGap(8)
          .rowsGap(12)
          .padding({ top: 12, bottom: 12 })
          .height(120)
          .backgroundColor(Color.White)
          .borderRadius(24)

        Text('列表')
          .fontSize(16)
          .fontWeight(FontWeight.Medium)
          .width('100%')
          // .margin({ top: 2 })

        //第二个网格布局
        Scroll() {
          Grid() {
            ForEach(mainViewModel.getSecondGridData(), (secondItem: ItemData) => {
              GridItem() {
                Column() {
                  Text(secondItem.title)
                    .fontSize(30)
                    .fontWeight(FontWeight.Medium)
                    .fontColor('blue')
                  Text(secondItem.others)
                    .margin({ top: 4 })
                    .fontSize(12)
                    .fontColor($r('app.color.home_grid_fontColor'))
                }
              }
              .borderRadius(12)
              .align(Alignment.TopStart)
              .backgroundImage(secondItem.img)
              .backgroundImageSize(ImageSize.Cover)
            }, (secondItem: ItemData) => JSON.stringify(secondItem))
          }
          .width('100%')
          .height('30%')
          .columnsTemplate('1fr 1fr')
          .rowsTemplate('1fr 1fr')
          .columnsGap(5)
          .rowsGap(5)
        }


        }
      .width('100%')
      }
        .width('100%')
    }
      .navDestination(this.PagesMap)
  }

  @Builder
  PagesMap(name: string) {
    if (name == "myLove") {
      myLove()
    }
      else if (name == "messagePage") {
        messagePage()
      }
      else if(name == "record"){
      Record()
    }
    else if(name == "cart") {
      CartPage()
    }


  }
}