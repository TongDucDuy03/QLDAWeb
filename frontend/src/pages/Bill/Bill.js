import React, { useState, useEffect } from "react";
import axios from "axios";
import { useParams } from "react-router-dom";
import { useNavigate } from "react-router-dom";

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

const momoCreatePayment = async (fullName, orderId, orderInfo, amount) => {
  try {
    const response = await axios.post("http://localhost:5168/api/Momo/CreatePaymentUrl", {fullName, orderId, orderInfo, amount});
    return response.data;
  } catch (error) {
    console.log(error);
    return [];
  }
};

const CreateOrder = async (userId, address, paymentMethod) => {
  try {
    const response = await axios.post("http://localhost:5168/api/order/CreateOrder", {userId, address, paymentMethod});
    return response.data;
  } catch (error) {
    console.log(error);
    return [];
  }
};

const Bill = () => {
  const params = useParams();
  const [cartProducts, setCartProducts] = useState([]);
  const [cartTotal, setCartTotal] = useState(0);
  const [selectedAddress, setSelectedAddress] = useState("");
  const [paymentMethod, setPaymentMethod] = useState("");

  const userId = localStorage.getItem("userId");

  let navigate = useNavigate();

  useEffect(() => {
    getCartByUser(params.userId).then((products) => {
      setCartProducts(products);
    });
    getTotalCart(params.userId).then((total) => {
      setCartTotal(total);
    });
  }, [params.userId]);

  const getTotalCart = async () => {
    try {
      const response = await axios.get(
        `http://localhost:5168/api/Cart/cart/${userId}`
      );
      return response.data.cartTotal;
    } catch (error) {
      console.log(error);
      return 0;
    }
  };

  const getCartByUser = async () => {
    try {
      const response = await axios.get(
        `http://localhost:5168/api/Cart/cart/${userId}`
      );
      return response.data.cartProductList;
    } catch (error) {
      console.log(error);
      return [];
    }
  };

  const PaymentSelection = async (selection) => {
    if (selection == "momopayment") {
      const address = "Hà Nội";

      const fullName = params.id;
      const orderId = "";
      const orderInfo = "Thanh toán cho đơn hàng ";
      const Total = cartTotal;

      await CreateOrder(params.id, address, 1);
      let path = await momoCreatePayment(fullName, orderId, orderInfo, Total);

      window.location.replace(path);
    }
    else if (selection == "cod"){
      
    }
  }

  return (
    <div id="content-page" className="content-page">
      <div className="container-fluid checkout-content">
        <div className="row">
          <div id="payment" className="p-0 col-lg-8">
            <div className="iq-card">
              <div className="iq-card-body">
                <h4 className="mb-2">Chi tiết</h4>
                <ul className="list-inline p-0 m-0">
                  {cartProducts.map((item, index) => (
                    <li
                      key={index}
                      className="checkout-product d-flex justify-content-between align-items-center"
                    >
                      <div className="checkout-product-img">
                        <a href="./">
                          <img
                            className="img-fluid rounded"
                            src={item.products.imagesUrl}
                            alt=""
                          />
                        </a>
                      </div>
                      <div className="checkout-product-details">
                        <h5>{item.products.name}</h5>
                      </div>
                      <div className="quantity-price">
                        <div className="row align-items-center">
                          <div className="col-sm-7 col-md-6">
                            <input
                              type="text"
                              id="quantity"
                              value={item.quantity}
                            />
                          </div>
                          <div className="col-sm-5 col-md-6">
                            <span className="product-price">
                              {item.products.price}đ
                            </span>
                          </div>
                        </div>
                      </div>
                    </li>
                  ))}
                </ul>
                <div className="d-flex justify-content-between">
                  <span>Phí vận chuyển</span>
                  <span className="text-success">Miễn phí</span>
                </div>
                <hr />
                <div className="d-flex justify-content-between">
                  <span>Số tiền phải trả</span>
                  <span>
                    <strong>{cartTotal}</strong>
                  </span>
                </div>
              </div>
            </div>

            <div className="iq-card">
              <div className="iq-card-header d-flex justify-content-between">
                <div className="iq-header-title">
                  <h4 className="card-title">Thông tin người nhận</h4>
                </div>
              </div>

              <div className="iq-card-body">
                <form className="mt-3">
                  <div className="d-flex align-items-center">
                    <span>Mã giảm giá: </span>
                    <div className="cvv-input ml-3 mr-3">
                      <input type="text" className="form-control" required="" />
                    </div>
                  </div>
                </form>

                <hr />
              </div>
            </div>

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
                      <input type="text" className="form-control" required="" />
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
                        id="momopayment"
                        name="paymentmethod"
                        className="custom-control-input"
                        onClick={() => setPaymentMethod('momopayment')}
                      />
                      <label
                        className="custom-control-label"
                        htmlFor="momopayment"
                      >
                        Thanh toán Momo
                      </label>
                    </div>

                    <div className="custom-control custom-radio">
                      <input
                        type="radio"
                        id="cod"
                        name="paymentmethod"
                        className="custom-control-input"
                        onClick={() => setPaymentMethod('cod')}
                      />
                      <label className="custom-control-label" htmlFor="cod">
                        Thanh toán khi giao hàng
                      </label>
                    </div>
                  </div>
                </div>
                <hr />
                <button
                  type="button"
                  className="btn btn-primary d-block mt-1 next"
                  onClick={() => {
                    PaymentSelection(paymentMethod);
                  }}
                >
                  Thanh toán
                </button>
              </div>
            </div>
          </div>
          <div className="col-lg-4">
            <div className="iq-card">
              <div className="iq-card-body">
                <h4 className="mb-2">Thông tin giao dịch</h4>
                <div className="d-flex justify-content-between">
                  <span>Giá 3 sản phẩm</span>
                  <span>
                    <strong>{cartTotal}</strong>
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
                    <strong>{cartTotal}</strong>
                  </span>
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