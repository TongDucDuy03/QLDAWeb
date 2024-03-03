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
<<<<<<< HEAD
=======
    // Xử lý đặt hàng và thanh toán ở đây
>>>>>>> parent of ab5ec27 (update)
    console.log("Địa chỉ nhận hàng:", selectedAddress);
    console.log("Phương thức thanh toán:", paymentMethod);
    console.log("Tổng tiền đơn hàng:", totalCart);
    console.log("Danh sách sản phẩm trong giỏ hàng:", cartProducts);
  };

  return (
    <div id="content-page" className="content-page">
      <div className="container-fluid checkout-content">
        <div className="row">
          <div id="payment" className="p-0 col-12">
            <div className="row align-item-center">
              <div className="col-lg-8">
                <div className="iq-card">
                  <div className="iq-card-header d-flex justify-content-between">
                    <div className="iq-header-title">
                      <h4 className="card-title">Lựa chọn thanh toán</h4>
                    </div>
                  </div>
                  <div className="iq-card-body">
<<<<<<< HEAD
                    <h5 className="mb-2">Chi tiết</h5>
                    <div className="d-flex justify-content-between">
                      <span>Giá 3 sản phẩm</span>
                      <span>
                        <strong>329.900đ</strong>
                      </span>
                    </div>
                    <div className="d-flex justify-content-between">
                      <span>Phí vận chuyển</span>
                      <span className="text-success">Miễn phí</span>
                    </div>
                    <hr />
                    <div className="d-flex justify-content-between">
                      <span>Số tiền phải trả</span>
                      <span>
                        <strong>329.900đ</strong>
                      </span>
                    </div>
                    <hr />
                    <div className="card-lists">
                      <div className="form-group">
                        <div className="custom-control custom-radio">
                          <input
                            type="radio"
                            id="credit"
                            name="customRadio"
                            className="custom-control-input"
                          />
=======
                    <form className="mt-3">
                      <div className="d-flex align-items-center">
                        <span>Mã giảm giá: </span>
                        <div className="cvv-input ml-3 mr-3">
                          <input
                            type="text"
                            className="form-control"
                            required=""
                          />
                        </div>
                        <button type="submit" className="btn btn-primary">
                          Tiếp tục
                        </button>
                      </div>
                    </form>
                    <hr />
                    <div className="card-lists">
                      <div className="form-group">
                        <div className="custom-control custom-radio">
                          <input
                            type="radio"
                            id="credit"
                            name="customRadio"
                            className="custom-control-input"
                          />
>>>>>>> parent of ab5ec27 (update)
                          <label
                            className="custom-control-label"
                            htmlFor="credit"
                          >
                            Thẻ Tín dụng / Ghi nợ / ATM
                          </label>
                        </div>
                        <div className="custom-control custom-radio">
                          <input
                            type="radio"
                            id="netbaking"
                            name="customRadio"
                            className="custom-control-input"
                          />
                          <label
                            className="custom-control-label"
                            htmlFor="netbaking"
                          >
                            Momo/ZaloPay
                          </label>
                        </div>
                        <div className="custom-control custom-radio">
                          <input
                            type="radio"
                            id="emi"
<<<<<<< HEAD
                            name="customRadio"
=======
                            name="emi"
>>>>>>> parent of ab5ec27 (update)
                            className="custom-control-input"
                          />
                          <label className="custom-control-label" htmlFor="emi">
                            Trả góp
                          </label>
                        </div>
                        <div className="custom-control custom-radio">
                          <input
                            type="radio"
                            id="cod"
<<<<<<< HEAD
                            name="customRadio"
=======
                            name="cod"
>>>>>>> parent of ab5ec27 (update)
                            className="custom-control-input"
                          />
                          <label className="custom-control-label" htmlFor="cod">
                            Thanh toán khi giao hàng
                          </label>
                        </div>
                      </div>
                    </div>
                    <hr />
                    <a
                      id="deliver-address"
<<<<<<< HEAD
                      href="./"
=======
                      href="javascript:void();"
>>>>>>> parent of ab5ec27 (update)
                      className="btn btn-primary d-block mt-1 next"
                    >
                      Thanh toán
                    </a>
                  </div>
<<<<<<< HEAD
=======
                </div>
              </div>
              <div className="col-lg-4">
                <div className="iq-card">
                  <div className="iq-card-body">
                    <h4 className="mb-2">Chi tiết</h4>
                    <div className="d-flex justify-content-between">
                      <span>Giá 3 sản phẩm</span>
                      <span>
                        <strong>329.900đ</strong>
                      </span>
                    </div>
                    <div className="d-flex justify-content-between">
                      <span>Phí vận chuyển</span>
                      <span className="text-success">Miễn phí</span>
                    </div>
                    <hr />
                    <div className="d-flex justify-content-between">
                      <span>Số tiền phải trả</span>
                      <span>
                        <strong>329.900đ</strong>
                      </span>
                    </div>
                  </div>
>>>>>>> parent of ab5ec27 (update)
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
