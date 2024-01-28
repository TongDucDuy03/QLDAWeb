/* eslint-disable jsx-a11y/img-redundant-alt */
import React, { useEffect, useState } from "react";
import axios from "axios";

const getAllbooks = async () => {
  try {
    const response = await axios.get(`https://localhost:7108/api/Product`);
    console.log(response);
    return response.data;
  } catch (error) {
    console.log(error);
  }
};

const Allbooks = () => {
  const [randomBooks, setBooks] = useState([]);

  useEffect(() => {
    getAllbooks().then((images) => {
      console.log(images);
      setBooks(images);
    });
  }, []);

  return (
    <div className="row">
      {randomBooks.length > 0 &&
        randomBooks.map((item, index) => (
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
                      <a href="book-page.html" className="btn btn-sm btn-white">
                        Mua Ngay
                      </a>
                    </div>
                  </div>
                  <div className="col-6">
                    <div className="mb-2">
                      <h6 className="mb-1">{item.name}</h6>
                      <p className="font-size-13 line-height mb-1">Dangpham</p>
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
                      <a href="./">
                        <i className="ri-shopping-cart-2-fill text-primary" />
                      </a>
                      <a href="./" className="ml-2">
                        <i className="ri-heart-fill text-danger" />
                      </a>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        ))}
    </div>
  );
};
export default Allbooks;
