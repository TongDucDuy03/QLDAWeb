import React, { useEffect, useState } from "react";
import { useParams } from "react-router-dom";
import axios from "axios";

const getProductBySeries = async (id) => {
  try {
    const response = await axios.get(
      `http://localhost:5168/api/Product/series/${id}`
    );
    console.log("series", response);
    return response.data;
  } catch (error) {
    console.log(error);
  }
};
const getSeriesBySeriesId = async (id) => {
  try {
    const response = await axios.get(`http://localhost:5168/api/Series/${id}`);
    return response.data;
  } catch (error) {
    console.log(error);
  }
};
const userId = localStorage.getItem('userId');
const Series = () => {
  const params = useParams();
  console.log(params);
  const [productList, setProducts] = useState([]);
  const [seriesDetail, setSeries] = useState([]);
  useEffect(() => {
    
    getProductBySeries(params.id).then((images) => {
      console.log(images);
      setProducts(images);
    });

    getSeriesBySeriesId(params.id).then((images) => {
      console.log(images);
      setSeries(images);
    });
  }, []);
  const addToCart = async (productId) => {
    if(userId != null){
      try {
        await axios.post(
          `http://localhost:5168/api/Cart/?id=${productId}&userId=${userId}&increaseQuantity=${true}`
        );
        alert('Product added to cart successfully!');
      } catch (error) {
        console.log(error);
        alert('Failed to add product to cart!');
      }
    }else{
      window.location.href = '/signin';
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
                  <h4 className="card-title mb-0">
                    {seriesDetail.series_Name}
                  </h4>
                </div>

                <div className="iq-card-header-toolbar d-flex align-items-center">
                  <a
                    href="category.html"
                    className="btn btn-sm btn-primary view-more"
                  >
                    Xem Thêm
                  </a>
                </div>
              </div>
              <div className="iq-card-body">
                <div className="row">
                  {productList.length > 0 &&
                    productList.map((item, index) => (
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
                                <i className="ri-shopping-cart-2-fill text-primary"  onClick={() => addToCart(item.id)} />
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
export default Series;
