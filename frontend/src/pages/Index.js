import React, { useEffect, useState } from "react";
import axios from "axios";
import $ from "jquery";
import "slick-carousel/slick/slick.min.js";

const getAllBooks = async (id) => {
  try {
    const response = await axios.get(
      `http://localhost:5168/api/Product/series/${id}`
    );
    console.log(response);
    return response.data;
  } catch (error) {
    console.log(error);
    return [];
  }
};

const renderCarousel = (id, books) => {
  $(`#${id}`).slick({
    infinite: true,
    slidesToShow: 4,
    slidesToScroll: 1,
    autoplay: true,
    autoplaySpeed: 2000,
    arrows: true,
    responsive: [
      {
        breakpoint: 768,
        settings: {
          slidesToShow: 2,
        },
      },
      {
        breakpoint: 480,
        settings: {
          slidesToShow: 1,
        },
      },
    ],
  });
};

const Index = () => {
  const [shortBooks, setShortBooks] = useState([]);
  const [longBooks, setLongBooks] = useState([]);
  const [loading, setLoading] = useState(true);
  const [seriesList, setSeries] = useState([]);

  useEffect(() => {
    const fetchBooks = async () => {
      const shortBooksResponse = await getAllBooks(1); // Series ID for short books
      const longBooksResponse = await getAllBooks(2); // Series ID for long books

      setShortBooks(shortBooksResponse);
      setLongBooks(longBooksResponse);
      setLoading(false);

      if (shortBooksResponse.length > 0) {
        renderCarousel("trendy-slider", shortBooksResponse);
      }

      if (longBooksResponse.length > 0) {
        renderCarousel("trendy-slider-1", longBooksResponse);
      }
    };

    fetchBooks();
  }, []);

  return (
    <div id="content-page" className="content-page">
      <div className="container-fluid">
        {loading ? (
          <div>Đang tải...</div>
        ) : (
          <div className="row">
            <div className="col-lg-12">
              <div className="iq-card iq-card-block iq-card-stretch iq-card-height">
                <div className="iq-card-header d-flex justify-content-between align-items-center position-relative mb-0 trendy-detail">
                  <div className="iq-header-title">
                    <h4 className="card-title mb-0">TRUYỆN NGẮN</h4>
                  </div>
                  <div className="iq-card-header-toolbar d-flex align-items-center">
                    <a
                      href="/series/1"
                      className="btn btn-sm btn-primary view-more"
                    >
                      Xem thêm
                    </a>
                  </div>
                </div>
                <div className="iq-card-body trendy-contens">
                  <ul id="trendy-slider" className="list-inline p-0 mb-0 row">
                    {shortBooks.length > 0 &&
                      shortBooks.map((item, index) => (
                        <li className="col-md-3" key={item.id}>
                          <div className="d-flex align-items-center">
                            <div className="col-5 p-0 position-relative image-overlap-shadow">
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
                                  Xem sách
                                </a>
                              </div>
                            </div>
                            <div className="col-7">
                              <div className="mb-2">
                                <h6 className="mb-1">{item.name}</h6>
                                <div className="d-block">
                                  <span className="font-size-13 text-warning">
                                    <i className="fa fa-star"></i>
                                    <i className="fa fa-star"></i>
                                    <i className="fa fa-star"></i>
                                    <i className="fa fa-star"></i>
                                    <i className="fa fa-star"></i>
                                  </span>
                                </div>
                              </div>
                              <div className="price d-flex align-items-center">
                                <h6>
                                  <b>{item.price} ₫</b>
                                </h6>
                              </div>
                              <div className="iq-product-action">
                                <a href="./">
                                  <i className="ri-shopping-cart-2-fill text-primary"></i>
                                </a>
                              </div>
                            </div>
                          </div>
                        </li>
                      ))}
                  </ul>
                </div>
              </div>
            </div>
            <div className="col-lg-12">
              <div className="iq-card iq-card-block iq-card-stretch iq-card-height">
                <div className="iq-card-header d-flex justify-content-between align-items-center position-relative mb-0 trendy-detail">
                  <div className="iq-header-title">
                    <h4 className="card-title mb-0">TRUYỆN DÀi</h4>
                  </div>
                  <div className="iq-card-header-toolbar d-flex align-items-center">
                    <a
                      href="/series/2"
                      className="btn btn-sm btn-primary view-more"
                    >
                      Xem thêm
                    </a>
                  </div>
                </div>
                <div className="iq-card-body trendy-contens">
                  <ul id="trendy-slider-1" className="list-inline p-0 mb-0 row">
                    {longBooks.length > 0 &&
                      longBooks.map((item, index) => (
                        <li className="col-md-3" key={item.id}>
                          <div className="d-flex align-items-center">
                            <div className="col-5 p-0 position-relative image-overlap-shadow">
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
                                  Xem sách
                                </a>
                              </div>
                            </div>
                            <div className="col-7">
                              <div className="mb-2">
                                <h6 className="mb-1">{item.name}</h6>
                                <div className="d-block">
                                  <span className="font-size-13 text-warning">
                                    <i className="fa fa-star"></i>
                                    <i className="fa fa-star"></i>
                                    <i className="fa fa-star"></i>
                                    <i className="fa fa-star"></i>
                                    <i className="fa fa-star"></i>
                                  </span>
                                </div>
                              </div>
                              <div className="price d-flex align-items-center">
                                <h6>
                                  <b>{item.price} ₫</b>
                                </h6>
                              </div>
                              <div className="iq-product-action">
                                <a href="./">
                                  <i className="ri-shopping-cart-2-fill text-primary"></i>
                                </a>
                              </div>
                            </div>
                          </div>
                        </li>
                      ))}
                  </ul>
                </div>
              </div>
            </div>
          </div>
        )}
      </div>
    </div>
  );
};

export default Index;
