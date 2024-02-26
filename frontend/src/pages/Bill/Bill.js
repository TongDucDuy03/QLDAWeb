import React, { useState, useEffect } from "react";
import axios from "axios";
import { useParams } from "react-router-dom";

const getCartByUser = async (id) => {
  try {
    const response = await axios.get(
      `http://localhost:5168/api/Cart/cart/${id}`
    );
    return response.data.cartProductList;
  } catch (error) {
    console.log(error);
    return [];
  }
};

const getTotalCart = async (id) => {
  try {
    const response = await axios.get(
      `http://localhost:5168/api/Cart/cart/${id}`
    );
    return response.data.cartTotal;
  } catch (error) {
    console.log(error);
    return 0;
  }
};

const Bill = () => {
  const params = useParams();
  const [cartProducts, setCartProducts] = useState([]);
  const [totalCart, setTotalCart] = useState(0);
  const [selectedAddress, setSelectedAddress] = useState("");
  const [paymentMethod, setPaymentMethod] = useState("");

  useEffect(() => {
    getCartByUser(params.userId).then((products) => {
      setCartProducts(products);
    });
    getTotalCart(params.userId).then((total) => {
      setTotalCart(total);
    });
  }, [params.userId]);

  const handleAddressChange = (event) => {
    setSelectedAddress(event.target.value);
  };

  const handlePaymentMethodChange = (event) => {
    setPaymentMethod(event.target.value);
  };

  const handleCheckout = () => {
    // Xử lý đặt hàng và thanh toán ở đây
    console.log("Địa chỉ nhận hàng:", selectedAddress);
    console.log("Phương thức thanh toán:", paymentMethod);
    console.log("Tổng tiền đơn hàng:", totalCart);
    console.log("Danh sách sản phẩm trong giỏ hàng:", cartProducts);
  };

  return (
    <div id="content-page" className="content-page">
      <div className="container-fluid checkout-content">
        <div className="row">
          <div id="bill" className="card-block show p-0 col-12">
            <div className="row align-item-center">
              <div className="col-lg-8">
                <div className="iq-card">
                  <div className="iq-card-header d-flex justify-content-between iq-border-bottom mb-0">
                    <div className="iq-header-title">
                      <h4 className="card-title">Thông tin đơn hàng</h4>
                    </div>
                  </div>
                  <div className="iq-card-body">
                    <ul className="list-inline p-0 m-0">
                      {cartProducts.map((item, index) => (
                        <li key={index} className="checkout-product">
                          <div className="row align-items-center">
                            <div className="col-sm-2">
                              <span className="checkout-product-img">
                                <a href="./">
                                  <img
                                    className="img-fluid rounded"
                                    src={item.products.imagesUrl}
                                    alt=""
                                  />
                                </a>
                              </span>
                            </div>
                            <div className="col-sm-4">
                              <div className="checkout-product-details">
                                <h5>{item.products.name}</h5>
                              </div>
                            </div>
                            <div className="col-sm-6">
                              <div className="row">
                                <div className="col-sm-10">
                                  <div className="row align-items-center mt-2">
                                    <div className="col-sm-7 col-md-6">
                                      <span>Số lượng: {item.quantity}</span>
                                      <span>Giá: {item.products.price}đ</span>
                                    </div>
                                  </div>
                                </div>
                              </div>
                            </div>
                          </div>
                        </li>
                      ))}
                    </ul>
                  </div>
                  <div>
                    <h3>Tổng tiền: {totalCart}đ</h3>
                    <h3>Chọn địa chỉ nhận hàng</h3>
                    <select onChange={handleAddressChange}>
                      <option value="address1">Địa chỉ 1</option>
                      <option value="address2">Địa chỉ 2</option>
                      {/* Thêm các địa chỉ khác ở đây */}
                    </select>
                    <div>
                      <h3>Chọn phương thức thanh toán</h3>
                      <div>
                        <input
                          type="radio"
                          id="cashOnDelivery"
                          name="paymentMethod"
                          value="cashOnDelivery"
                          checked={paymentMethod === "cashOnDelivery"}
                          onChange={handlePaymentMethodChange}
                        />
                        <label htmlFor="cashOnDelivery">Thanh toán khi nhận hàng</label>
                      </div>
                      <div>
                        <input
                          type="radio"
                          id="momo"
                          name="paymentMethod"
                          value="momo"
                          checked={paymentMethod === "momo"}
                          onChange={handlePaymentMethodChange}
                        />
                        <label htmlFor="momo">Momo</label>
                      </div>
                    </div>
                    <button onClick={handleCheckout}>Thanh toán</button>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
};
export default Bill;
