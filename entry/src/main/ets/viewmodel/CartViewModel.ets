import CartItemData from '../bean/CartItemData';

/**
 * 获取购物车数据
 */
export class IndexViewModel {
  getCartData(): Array<CartItemData> {
    let cartData: CartItemData[] = [
      new CartItemData("商品1", $r('app.media.fig1'), 99.99, 1, 'productDetailPage'),
      new CartItemData("商品2", $r('app.media.fig2'), 149.99, 2, 'productDetailPage'),
      new CartItemData("商品3", $r('app.media.fig3'), 49.99, 1, 'productDetailPage'),
      new CartItemData("商品4", $r('app.media.fig4'), 199.99, 3, 'productDetailPage')
    ];
    return cartData;
  }
}

export default new IndexViewModel();
