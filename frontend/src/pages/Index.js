import React, { useContext, useEffect, useState } from "react";
import axios from "axios";
import Slider from "react-slick";
import "slick-carousel/slick/slick.css";
import "slick-carousel/slick/slick-theme.css";
import { AppContext } from "../App";
import ToastMessage from "../Common/ToastMessage";

const getAllSeries = async () => {
  try {
    const response = await axios.get("http://localhost:5168/api/Series");
    return response.data;
  } catch (error) {
    console.error("Error fetching series:", error);
    return [];
  }
};

const getBooksBySeriesId = async (seriesId) => {
  try {
    const response = await axios.get(
      `http://localhost:5168/api/Product/series/${seriesId}`
    );
    return response.data;
  } catch (error) {
    console.error("Error fetching books for series ${seriesId}:", error);
    return [];
  }
};

const Index = () => {
  const [series, setSeries] = useState([]);
  const [loading, setLoading] = useState(true);
  const [carouselContent, setCarouselContent] = useState({});
  const [message, setMessage] = useState("");
  const { isDisplayToast, setIsDisplayToast } = useContext(AppContext);

  useEffect(() => {
    const fetchData = async () => {
      try {
        const seriesData = await getAllSeries();
        setSeries(seriesData);
        setLoading(false);
        const carouselData = {};
        for (const seriesItem of seriesData) {
          const books = await getBooksBySeriesId(seriesItem.series_Id);
          carouselData[seriesItem.series_Id] = books;
        }
        setCarouselContent(carouselData);
      } catch (error) {
        console.error("Error fetching data:", error);
      }
    };

    fetchData();
  }, []);

  const addToCart = async (productId) => {
    const userId = localStorage.getItem("userId");
    if (userId != null) {
      try {
        await axios.post(
          `http://localhost:5168/api/Cart/?id=${productId}&userId=${userId}&increaseQuantity=${true}`
        );
        setIsDisplayToast(true);
        setMessage("Product added to cart successfully!");
      } catch (error) {
        console.log(error);
        setIsDisplayToast(true);
        setMessage("Failed to add product to cart!");
      }
    } else {
      window.location.href = "/signin";
    }
  };

  const renderCarousel = (seriesId) => {
    const books = carouselContent[seriesId];
    if (!books) {
      return <div>Loading...</div>;
    }
    // Nếu chỉ có một cuốn sách, hiển thị nó mà không sử dụng Slider
    if (books.length <= 5) {
      const book = books[0];
      return (
        <div key={book.id} className="single-book">
          <div className="d-flex align-items-center">
            <div className="col-1 p-0 position-relative image-overlap-shadow">
              <a href={`/detail/${book.id}`}>
                <img
                  className="img-fluid rounded w-100"
                  src={book.imagesUrl}
                  alt=""
                  style={{ maxWidth: "100%" }}
                />
              </a>
            </div>
            <div className="col-7">
              <div className="mb-2">
                <h6 className="mb-1">
                  <a href={`/detail/${book.id}`}>{book.name}</a>
                </h6>
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
                  <b>{book.price} ₫</b>
                </h6>
              </div>
              <div className="iq-product-action">
                <i
                  className="ri-shopping-cart-2-fill text-primary"
                  onClick={() => addToCart(book.id)}
                />
              </div>
            </div>
          </div>
        </div>
      );
    }

    const settings = {
      infinite: true,
      slidesToShow: 5,
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
    };

    return (
      <Slider {...settings}>
        {books.map((item) => (
          <div key={item.id}>
            <div className="d-flex align-items-center">
              <div className="col-5 p-0 position-relative image-overlap-shadow">
                <a href={`/detail/${item.id}`}>
                  <img
                    className="img-fluid rounded w-100"
                    src={item.imagesUrl}
                    alt=""
                  />
                </a>
              </div>
              <div className="col-7">
                <div className="mb-2">
                  <h6 className="mb-1">
                    <a href={`/detail/${item.id}`}> {item.name}</a>
                  </h6>
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
                  <i
                    className="ri-shopping-cart-2-fill text-primary"
                    onClick={() => addToCart(item.id)}
                  />
                </div>
              </div>
            </div>
          </div>
        ))}
      </Slider>
    );
  };

  return (
    <div id="content-page" className="content-page">
      <div className="container-fluid">
        {loading ? (
          <div>Đang tải...</div>
        ) : (
          <div className="row">
            {series.map((seriesItem) => (
              <div className="col-lg-12" key={seriesItem.id}>
                <div className="iq-card iq-card-block iq-card-stretch iq-card-height">
                  <div className="iq-card-header d-flex justify-content-between align-items-center position-relative mb-0 trendy-detail">
                    <div className="iq-header-title">
                      <h4 className="card-title mb-0">
                        {seriesItem.series_Name}
                      </h4>
                    </div>
                    <div className="iq-card-header-toolbar d-flex align-items-center">
                      <a
                        href={`/series/${seriesItem.series_Id}`}
                        className="btn btn-sm btn-primary view-more"
                      >
                        Xem thêm
                      </a>
                    </div>
                  </div>
                  <div className="iq-card-body trendy-contens">
                    {renderCarousel(seriesItem.series_Id)}
                  </div>
                </div>
              </div>
            ))}
          </div>
        )}
      </div>
      <ToastMessage
        isDisplay={isDisplayToast}
        setIsDisplay={setIsDisplayToast}
        message={message}
      />
    </div>
  );
};
export default Index;
