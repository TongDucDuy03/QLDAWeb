import React, { useEffect, useState } from "react";
import { useParams } from "react-router-dom";
import axios from "axios";

const getCartByUser = async (id) => {
  try {
    const response = await axios.get(
      `http://localhost:5168/api/Cart/cart/${id}`
    );
    return response.data;
  } catch (error) {
    console.log(error);
  }
};

const Cart = () => {
  const params = useParams();
  const [userCart, setUserCart] = useState([]);

  useEffect(() => {
    getCartByUser(params.id).then((cartItems) => {
      setUserCart(cartItems);
    });
  }, [params.id]);

  return (
    <div id="content-page" className="content-page">
      <div className="container-fluid checkout-content">
        <div className="row">
          <div id="cart" className="card-block show p-0 col-12">
            <div className="row align-item-center">
              <div className="col-lg-8">
                <div className="iq-card">
                  <div className="iq-card-header d-flex justify-content-between iq-border-bottom mb-0">
                    <div className="iq-header-title">
                      <h4 className="card-title">Giỏ hàng</h4>
                    </div>
                  </div>
                  <div className="iq-card-body">
                    <ul className="list-inline p-0 m-0">
                      {userCart.map((item, index) => (
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
                                {/* <div className="price">
                                  <h5>{item.products.price}</h5>
                                </div> */}
                              </div>
                            </div>
                            <div className="col-sm-6">
                              <div className="row">
                                <div className="col-sm-10">
                                  <div className="row align-items-center mt-2">
                                    <div className="col-sm-7 col-md-6">
                                      <button
                                        type="button"
                                        className="fa fa-minus qty-btn"
                                        id="btn-minus"
                                      ></button>
                                      <input
                                        type="text"
                                        id="quantity"
                                        defaultValue={item.quantity}
                                      />
                                      <button
                                        type="button"
                                        className="fa fa-plus qty-btn"
                                        id="btn-plus"
                                      ></button>
                                    </div>
                                    <div className="col-sm-5 col-md-6">
                                      <span className="product-price">
                                      {item.products.price}
                                      </span>
                                    </div>
                                  </div>
                                </div>
                                <div className="col-sm-2">
                                  <a
                                    href="./"
                                    className="text-dark font-size-20"
                                  >
                                    <i className="ri-delete-bin-7-fill"></i>
                                  </a>
                                </div>
                              </div>
                            </div>
                          </div>
                        </li>
                      ))}
                    </ul>
                  </div>
                </div>
              </div>
              <div className="col-lg-4">
                <div className="iq-card">
                  <div className="iq-card-body">
                    <p>Tùy chọn</p>
                    <div className="d-flex justify-content-between">
                      <span>Phiếu giảm giá</span>
                      <span>
                        <a href="./">
                          <strong>Áp dụng</strong>
                        </a>
                      </span>
                    </div>
                    <hr />
                    <p>
                      <b>Chi tiết</b>
                    </p>
                    <div className="d-flex justify-content-between mb-1">
                      <span>Tổng</span>
                      <span>339.900đ</span>
                    </div>
                    <div className="d-flex justify-content-between mb-1">
                      <span>Giảm giá</span>
                      <span className="text-success">19.900đ</span>
                    </div>
                    <div className="d-flex justify-content-between mb-1">
                      <span>Thuế VAT</span>
                      <span>16.900đ</span>
                    </div>
                    <div className="d-flex justify-content-between">
                      <span>Phí vận chuyển</span>
                      <span className="text-success">Miễn phí</span>
                    </div>
                    <hr />
                    <div className="d-flex justify-content-between">
                      <span className="text-dark">
                        <strong>Tổng</strong>
                      </span>
                      <span className="text-dark">
                        <strong>327.900đ</strong>
                      </span>
                    </div>
                    <a
                      id="place-order"
                      href="./"
                      className="btn btn-primary d-block mt-3 next"
                    >
                      Đặt hàng
                    </a>
                  </div>
                </div>
                <div className="iq-card">
                  <div className="card-body iq-card-body p-0 iq-checkout-policy">
                    <ul className="p-0 m-0">
                      <li className="d-flex align-items-center">
                        <div className="iq-checkout-icon">
                          <i className="ri-checkbox-line"></i>
                        </div>
                        <h6>
                          Chính sách bảo mật (Thanh toán an toàn và bảo mật.)
                        </h6>
                      </li>
                      <li className="d-flex align-items-center">
                        <div className="iq-checkout-icon">
                          <i className="ri-truck-line"></i>
                        </div>
                        <h6>Chính sách giao hàng (Giao hàng tận nhà.)</h6>
                      </li>
                      <li className="d-flex align-items-center">
                        <div className="iq-checkout-icon">
                          <i className="ri-arrow-go-back-line"></i>
                        </div>
                        <h6>Chính sách hoàn trả</h6>
                      </li>
                    </ul>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div id="address" className="card-block p-0 col-12">
            <div className="row align-item-center">
              <div className="col-lg-8">
                <div className="iq-card">
                  <div className="iq-card-header d-flex justify-content-between">
                    <div className="iq-header-title">
                      <h4 className="card-title">Thêm địa chỉ mới</h4>
                    </div>
                  </div>
                  <div className="iq-card-body">
                    <form onSubmit="required()">
                      <div className="row mt-3">
                        <div className="col-md-6">
                          <div className="form-group">
                            <label>Họ và tên: *</label>
                            <input
                              type="text"
                              className="form-control"
                              name="fname"
                              required=""
                            />
                          </div>
                        </div>
                        <div className="col-md-6">
                          <div className="form-group">
                            <label>Số điện thoại: *</label>
                            <input
                              type="text"
                              className="form-control"
                              name="mno"
                              required=""
                            />
                          </div>
                        </div>
                        <div className="col-md-6">
                          <div className="form-group">
                            <label>Địa chỉ: *</label>
                            <input
                              type="text"
                              className="form-control"
                              name="houseno"
                              required=""
                            />
                          </div>
                        </div>
                        <div className="col-md-6">
                          <div className="form-group">
                            <label>Tỉnh/thành phố: *</label>
                            <input
                              type="text"
                              className="form-control"
                              name="city"
                              required=""
                            />
                          </div>
                        </div>
                        <div className="col-md-6">
                          <div className="form-group">
                            <label>Phường: *</label>
                            <input
                              type="text"
                              className="form-control"
                              name="state"
                              required=""
                            />
                          </div>
                        </div>
                        <div className="col-md-6">
                          <div className="form-group">
                            <label htmlFor="addtype">Loại địa chỉ</label>
                            <select className="form-control" id="addtype">
                              <option>Nhà riêng</option>
                              <option>Công ty</option>
                            </select>
                          </div>
                        </div>
                        <div className="col-md-6">
                          <button
                            id="savenddeliver"
                            type="submit"
                            className="btn btn-primary"
                          >
                            Lưu và giao tại đây
                          </button>
                        </div>
                      </div>
                    </form>
                  </div>
                </div>
              </div>
              <div className="col-lg-4">
                <div className="iq-card">
                  <div className="iq-card-body">
                    <h4 className="mb-2">Ông Trần Thuận</h4>
                    <div className="shipping-address">
                      <p className="mb-0">11 Thành Thái</p>
                      <p>Thành phố Đà Nẵng</p>
                      <p>0789-999-999</p>
                    </div>
                    <hr />
                    <a
                      id="deliver-address"
                      href="./"
                      className="btn btn-primary d-block mt-1 next"
                    >
                      Tiếp tục
                    </a>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div id="payment" className="card-block p-0 col-12">
            <div className="row align-item-center">
              <div className="col-lg-8">
                <div className="iq-card">
                  <div className="iq-card-header d-flex justify-content-between">
                    <div className="iq-header-title">
                      <h4 className="card-title">Lựa chọn thanh toán</h4>
                    </div>
                  </div>
                  <div className="iq-card-body">
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
                            name="emi"
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
                            name="cod"
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
                      href="./"
                      className="btn btn-primary d-block mt-1 next"
                    >
                      Thanh toán
                    </a>
                  </div>
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
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
};
export default Cart;
