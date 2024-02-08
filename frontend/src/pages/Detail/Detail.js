/* eslint-disable jsx-a11y/img-redundant-alt */
import React, { useEffect, useState } from "react";
import axios from "axios";

const getDetail = async () => {
  try {
    const response = await axios.get(`https://localhost:7108/api/Product/3`);
    console.log(response.data);
    return response.data;
  } catch (error) {
    console.log(error);
  }
};

const Detail = () => {
  const [randomBooks, setBooks] = useState([]);

  useEffect(() => {
    getDetail().then((images) => {
      console.log(images);
      setBooks(images);
    });
  }, []);

  return (
    <div>
      {randomBooks.length > 0 &&
        randomBooks.map((item, index) => (
          <div id="content-page" className="content-page" key={(item.id = 3)}>
            <div className="container-fluid">
              <div className="row">
                <div className="col-sm-12">
                  <div className="iq-card iq-card-block iq-card-stretch iq-card-height">
                    <div className="iq-card-header d-flex justify-content-between align-items-center">
                      <h4 className="card-title mb-0">Thông tin</h4>
                    </div>
                    <div className="iq-card-body pb-0">
                      <div className="description-contens align-items-top row">
                        <div className="col-md-6">
                          <div className="iq-card-transparent iq-card-block iq-card-stretch iq-card-height">
                            <div className="iq-card-body p-0">
                              <div className="row align-items-center">
                                <div className="col-12">
                                  <ul
                                    id="description-slider"
                                    className="list-inline p-0 m-0  d-flex align-items-center"
                                  >
                                    <li>
                                      <a href="./">
                                        <img
                                          src={item.imagesUrl}
                                          className="img-fluid w-100 rounded"
                                          alt=""
                                        />
                                      </a>
                                    </li>
                                  </ul>
                                </div>
                              </div>
                            </div>
                          </div>
                        </div>
                        <div className="col-md-6">
                          <div className="iq-card-transparent iq-card-block iq-card-stretch iq-card-height">
                            <div className="iq-card-body p-0">
                              <h3 className="mb-3">{item.name}</h3>
                              <div className="price d-flex align-items-center font-weight-500 mb-2">
                                <span className="font-size-24 text-dark">
                                  {item.price} ₫
                                </span>
                              </div>
                              <div className="mb-3 d-block">
                                <span className="font-size-20 text-warning">
                                  <i className="fa fa-star mr-1" />
                                  <i className="fa fa-star mr-1" />
                                  <i className="fa fa-star mr-1" />
                                  <i className="fa fa-star mr-1" />
                                  <i className="fa fa-star" />
                                </span>
                              </div>
                              <span className="text-dark mb-4 pb-4 iq-border-bottom d-block">
                                {item.description}
                              </span>
                              <div className="mb-4 d-flex align-items-center">
                                <a
                                  href="checkout.html"
                                  className="btn btn-primary view-more mr-2"
                                >
                                  Thêm vào giỏ hàng
                                </a>
                                <a
                                  href="book-pdf.html"
                                  className="btn btn-primary view-more mr-2"
                                >
                                  Mua ngay
                                </a>
                              </div>
                              <div className="mb-3">
                                <a href="./" className="text-body text-center">
                                  <span className="avatar-30 rounded-circle bg-primary d-inline-block mr-2">
                                    <i className="ri-heart-fill" />
                                  </span>
                                  <span>Thêm vào danh sách yêu thích</span>
                                </a>
                              </div>
                              <div className="iq-social d-flex align-items-center">
                                <h5 className="mr-2">Chia sẻ:</h5>
                                <ul className="list-inline d-flex p-0 mb-0 align-items-center">
                                  <li>
                                    <a
                                      href="./"
                                      className="avatar-40 rounded-circle bg-primary mr-2 facebook"
                                    >
                                      <i
                                        className="fa fa-facebook"
                                        aria-hidden="true"
                                      />
                                    </a>
                                  </li>
                                  <li>
                                    <a
                                      href="./"
                                      className="avatar-40 rounded-circle bg-primary mr-2 twitter"
                                    >
                                      <i
                                        className="fa fa-twitter"
                                        aria-hidden="true"
                                      />
                                    </a>
                                  </li>
                                  <li>
                                    <a
                                      href="./"
                                      className="avatar-40 rounded-circle bg-primary mr-2 youtube"
                                    >
                                      <i
                                        className="fa fa-youtube-play"
                                        aria-hidden="true"
                                      />
                                    </a>
                                  </li>
                                  <li>
                                    <a
                                      href="./"
                                      className="avatar-40 rounded-circle bg-primary pinterest"
                                    >
                                      <i
                                        className="fa fa-pinterest-p"
                                        aria-hidden="true"
                                      />
                                    </a>
                                  </li>
                                </ul>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
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
export default Detail;
