import React from "react";
import axios from "axios";

const userId = localStorage.getItem("userId");
const Vsearch = ({ listBooks }) => {
  const addToCart = async (productId) => {
    if (userId != null) {
      try {
        await axios.post(
          `http://localhost:5168/api/Cart/?id=${productId}&userId=${userId}&increaseQuantity=${true}`
        );
        alert("Product added to cart successfully!");
      } catch (error) {
        console.log(error);
        alert("Failed to add product to cart!");
      }
    } else {
      window.location.href = "/signin";
    }
  };
  return (
    <div id="content-page" className="content-page">
      <div className="container-fluid">
        <div className="row">
          <div className="col-lg-12">
            <div className="iq-card iq-card-block iq-card-stretch iq-card-height">
              <div className="iq-card-header d-flex justify-content-between align-items-center position-relative">
                <div className="iq-header-title">
                  <h4 className="card-title mb-0">Kết quả tìm kiếm</h4>
                </div>
              </div>
              <div className="iq-card-body">
                <div className="row">
                  {listBooks.length > 0 &&
                    listBooks.map((item, index) => (
                      <div className="col-sm-6 col-md-4 col-lg-3" key={item.id}>
                        <div className="iq-card iq-card-block iq-card-stretch iq-card-height browse-bookcontent">
                          <div className="iq-card-body p-0">
                            <div className="d-flex align-items-center">
                              <div className="col-6 p-0 position-relative image-overlap-shadow">
                                <a href="./">
                                  <img
                                    className="img-fluid rounded w-100"
                                    src={item.imagesUrl}
                                    alt=""
                                  />
                                </a>
                                <div className="view-book">
                                  <a
                                    href={`/detail/${item.id}`}
                                    className="btn btn-sm btn-white"
                                  >
                                    Detail
                                  </a>
                                </div>
                              </div>
                              <div className="col-6">
                                <div className="mb-2">
                                  <h6 className="mb-1">{item.name}</h6>
                                  <div className="d-block line-height">
                                    <span className="font-size-11 text-warning">
                                      <i className="fa fa-star" />
                                      <i className="fa fa-star" />
                                      <i className="fa fa-star" />
                                      <i className="fa fa-star" />
                                      <i className="fa fa-star" />
                                    </span>
                                  </div>
                                </div>
                                <div className="price d-flex align-items-center">
                                  <h6>
                                    <b>{item.price}</b>
                                  </h6>
                                </div>
                                <div className="iq-product-action">
                                  <i
                                    className="ri-shopping-cart-2-fill text-primary"
                                    onClick={() => addToCart(item.id)}
                                  />
                                </div>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                    ))}
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
};
export default Vsearch;
