import React, { useEffect, useState } from "react";
import { useParams } from "react-router-dom";
import axios from "axios";
import { confirmAlert } from "react-confirm-alert";

const submit = () => {
  confirmAlert({
    title: 'Confirm to submit',
    message: 'Are you sure to do this',
    buttons: [
      {
        label: 'Yes',
        onClick: () => alert('Click Yes')
      },
      {
        label: 'No',
        onClick: () => alert('Click No')
      }
    ]
  });
};
const deleteCartProduct = async(userId, productId) => {
  try {
    const response = await axios.delete(
      `http://localhost:5168/api/Cart/DeleteCartProduct/?userId=${userId}&productId=${productId}`
    );
  } catch (error) {
    console.log(error);
  }
};
const getCartByUser = async (id) => {
  try {
    const response = await axios.get(
      `http://localhost:5168/api/Cart/cart/${id}`
    );
    return response.data.cartProductList;
  } catch (error) {
    console.log(error);
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
  }
};

const updateCart = async (productId, userId, increaseQuantity) => {
  await axios.post(
    `http://localhost:5168/api/Cart/?id=${productId}&userId=${userId}&increaseQuantity=${increaseQuantity}`
  );
};

const Cart = () => {
  const params = useParams();
  const [userCart, setUserCart] = useState([]);
  const [quantity, setQuantity] = useState([]);
  const [cartTotal, setCartTotal] = useState(0); 
  const userId = localStorage.getItem("userId");

  useEffect(() => {
    getCartByUser(params.id).then((cartItems) => {
      setUserCart(cartItems);
      setQuantity(cartItems.quantity);
    });
    getTotalCart(params.id).then((total) => setCartTotal(total)); 
  }, [params.id]);

  const handleIncrease = async (productId) => {
    await updateCart(productId, params.id, true);
    setQuantity((quantity) => quantity + 1);
    getCartByUser(params.id).then((cartItems) => {
      setUserCart(cartItems);
      if (cartItems.quantity && !isNaN(cartItems.quantity)) {
        setQuantity(parseInt(cartItems.quantity));
      }
    });
    getTotalCart(params.id).then((total) => setCartTotal(total)); 
  };

  const handleDecrease = async (productId) => {
    await updateCart(productId, params.id, false);
    setQuantity((quantity) => quantity - 1);
    getCartByUser(params.id).then((cartItems) => {
      setUserCart(cartItems);
      if (cartItems.quantity && !isNaN(cartItems.quantity)) {
        setQuantity(parseInt(cartItems.quantity));
      }
    });
    getTotalCart(params.id).then((total) => setCartTotal(total)); 
  };

  const handleRemove = async (productId) => {
    try {
      await deleteCartProduct(params.id,productId);
      
      getCartByUser(params.id).then((cartItems) => {
        setUserCart(cartItems);
        if (cartItems.quantity && !isNaN(cartItems.quantity)) {
          setQuantity(parseInt(cartItems.quantity));
        }
      });
      alert("Product removed from cart successfully!");
      getTotalCart(params.id).then((total) => setCartTotal(total)); 
    } catch (error) {
      alert("Failed to remove product from cart:", error);
    }
  };

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
                                        onClick={() => {
                                          if (item.products.quantity == 1){if(this.submit) handleDecrease(item.productId);}
                                          else{handleDecrease(item.productId);}
                                        }}
                                      ></button>
                                      <input
                                        type="text"
                                        id="quantity"
                                        value={item.quantity}
                                      />
                                      <button
                                        type="button"
                                        className="fa fa-plus qty-btn"
                                        onClick={() =>
                                          handleIncrease(item.productId)
                                        }
                                      ></button>
                                    </div>
                                    <div className="col-sm-5 col-md-6">
                                      <span className="product-price">
                                        {item.products.price}đ
                                      </span>
                                    </div>
                                  </div>
                                </div>
                                <div className="col-sm-2">
                                  <button
                                    type="button"
                                    onClick={() =>
                                      handleRemove(item.productId)
                                    }
                                  >
                                    <i className="ri-delete-bin-7-fill"></i>
                                  </button>
                                </div>
                              </div>
                            </div>
                          </div>
                        </li>
                      ))}
                    </ul>
                  </div>
                  <a
                    id="place-order"
                    href={`/bill/${userId}`}
                    className="btn btn-primary d-block mt-3 next"
                  >
                    Đặt hàng - {cartTotal}đ
                  </a>
                </div>
              </div>
            </div>
          </div>
          {/* Phần địa chỉ và thanh toán giữ nguyên */}
        </div>
      </div>
    </div>
  );
};
export default Cart;
