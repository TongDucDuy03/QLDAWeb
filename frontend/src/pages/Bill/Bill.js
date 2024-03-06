import React, { useState, useEffect } from "react";
import axios from "axios";
import { useParams } from "react-router-dom";
import { Alert } from "bootstrap";
const momoCreatePayment = async (fullName, orderId, orderInfo, amount) => {
  try {
    const response = await axios.post(
      "http://localhost:5168/api/Momo/CreatePaymentUrl",
      { fullName, orderId, orderInfo, amount }
    );
    return response.data;
  } catch (error) {
    console.log(error);
    return [];
  }
};

const CreateOrder = async (userId, address, paymentMethod) => {
  try {
    const response = await axios.post(
      "http://localhost:5168/api/order/CreateOrder",
      { userId, address, paymentMethod }
    );
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
  const [paymentMethod, setPaymentMethod] = useState("");
  const [addressList, setAddressList] = useState([]);
  const [selectedProvince, setSelectedProvince] = useState("");
  const [selectedDistrict, setSelectedDistrict] = useState("");
  const [selectedWard, setSelectedWard] = useState("");
  const [inputValue, setInputValue] = useState("");
  const [error, setError] = useState("");

  const userId = localStorage.getItem("userId");

  useEffect(() => {
    getCartByUser(params.userId).then((products) => {
      setCartProducts(products);
    });
    getTotalCart(params.userId).then((total) => {
      setCartTotal(total);
    });
    getAddressFromAPI().then((addresses) => {
      setAddressList(addresses);
    });
  }, [params.userId]);

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

  const PaymentSelection = async (selection) => {
    let deliveryAddress = inputValue;
    if (!deliveryAddress || !selection) {
      setError("Vui lòng chọn địa chỉ và phương thức thanh toán");
      console.log(setError);
      return;
    }
    setError("");
    if (selection === "momopayment") {
      const address = "Hà Nội";

      const order = await CreateOrder(params.id, address, 1);
      const fullName = params.id;
      const orderInfo = `Thanh toán cho đơn hàng ${order.orderId}`;
      const Total = cartTotal;
      const orderId = `${order.orderId}`;
      let path = await momoCreatePayment(fullName, orderId, orderInfo, Total);
      window.location.replace(path);
    } else if (selection === "cod") {
      try {
        const response = await axios.post(
          `http://localhost:5168/api/Order/?userId=${userId}&deliveryAddress=${deliveryAddress}`
        );
        window.location.href = "/OrderSuccessPage";
        return response.data;
      } catch (error) {
        console.log(error);
        return 0;
      }
    }
  };
  const getAddressFromAPI = async () => {
    try {
      const response = await axios.get(
        "https://raw.githubusercontent.com/kenzouno1/DiaGioiHanhChinhVN/master/data.json"
      );

      return response.data;
    } catch (error) {
      console.log(error);

      return [];
    }
  };

  const handleProvinceChange = (event) => {
    setSelectedProvince(event.target.value);

    setSelectedDistrict("");

    setSelectedWard("");
  };

  const handleDistrictChange = (event) => {
    setSelectedDistrict(event.target.value);

    setSelectedWard("");
  };

  const handleWardChange = (event) => {
    setSelectedWard(event.target.value);
  };
  const handleAddressSelection = () => {
    const provinceName =
      addressList.find((province) => province.Id === selectedProvince)?.Name ||
      "";
    const districtName =
      addressList
        .find((province) => province.Id === selectedProvince)
        ?.Districts.find((district) => district.Id === selectedDistrict)
        ?.Name || "";
    const wardName =
      addressList
        .find((province) => province.Id === selectedProvince)
        ?.Districts.find((district) => district.Id === selectedDistrict)
        ?.Wards.find((ward) => ward.Id === selectedWard)?.Name || "";

    const address = `${wardName}, ${districtName}, ${provinceName}`;
    setInputValue(address);
  };

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
                  <h4 className="card-title">Địa chỉ người nhận</h4>
                </div>
              </div>

              <div className="iq-card-body">
                <form className="mt-3">
                  <div className="form-row">
                    <div className="col">
                      <select
                        id="city"
                        className="form-control"
                        onChange={handleProvinceChange}
                      >
                        <option value="">Chọn tỉnh thành</option>
                        {addressList.map((province) => (
                          <option key={province.Id} value={province.Id}>
                            {province.Name}
                          </option>
                        ))}
                      </select>
                    </div>
                    <div className="col">
                      <select
                        id="district"
                        className="form-control"
                        onChange={handleDistrictChange}
                      >
                        <option value="">Chọn quận huyện</option>
                        {selectedProvince &&
                          addressList
                            .find(
                              (province) => province.Id === selectedProvince
                            )
                            ?.Districts.map((district) => (
                              <option key={district.Id} value={district.Id}>
                                {district.Name}
                              </option>
                            ))}
                      </select>
                    </div>
                    <div className="col">
                      <select
                        id="ward"
                        className="form-control"
                        onChange={handleWardChange}
                      >
                        <option value="">Chọn phường xã</option>
                        {selectedDistrict &&
                          addressList
                            .find(
                              (province) => province.Id === selectedProvince
                            )
                            ?.Districts.find(
                              (district) => district.Id === selectedDistrict
                            )
                            ?.Wards.map((ward) => (
                              <option key={ward.Id} value={ward.Id}>
                                {ward.Name}
                              </option>
                            ))}
                      </select>
                    </div>
                  </div>
                  <div className="input-group mb-3">
                    <input
                      type="text"
                      className="form-control"
                      value={inputValue}
                      onChange={(e) => setInputValue(e.target.value)}
                      placeholder="Nhập địa chỉ của bạn"
                    />
                    <button
                      type="button"
                      className="btn btn-primary ml-3"
                      onClick={handleAddressSelection}
                    >
                      Xác nhận
                    </button>
                  </div>
                </form>
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
                        onClick={() => setPaymentMethod("momopayment")}
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
                        onClick={() => setPaymentMethod("cod")}
                      />
                      <label className="custom-control-label" htmlFor="cod">
                        Thanh toán khi giao hàng
                      </label>
                    </div>
                  </div>
                </div>
                <hr />
                {error && <div className="alert alert-danger">{error}</div>}
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
        </div>
      </div>
    </div>
  );
};

export default Bill;
