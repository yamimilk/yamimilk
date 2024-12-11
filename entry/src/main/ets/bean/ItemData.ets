/**
 * 列表item数据
 */
export default class ItemData {

  title: Resource|string;
  img: Resource;
  others?: Resource|string;
  page: string;

  constructor(title: Resource|string, img: Resource, page: string, others?: Resource|string) {
    this.title = title;
    this.img = img;
    this.page = page;
    this.others = others;
  }
}