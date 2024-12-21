/**
 * 购物车item数据
 */
export default class CartItemData {
  title: string;       // 商品名称
  img: Resource;      // 商品图片
  price: number;      // 商品价格
  quantity: number;   // 商品数量
  page: string;       // 商品详情页路径

  constructor(title: string, img: Resource, price: number, quantity: number, page: string) {
    this.title = title;
    this.img = img;
    this.price = price;
    this.quantity = quantity;
    this.page = page;
  }
}
