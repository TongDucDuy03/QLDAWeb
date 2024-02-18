import React, { useEffect, useState } from "react";
import { useParams } from "react-router-dom";
import axios from "axios";
const getSeries = async (content) => {
    try {
      const response = await axios.get(
        `http://localhost:5168/api/Product/search/${content}`
      );
      return response.data;
    } catch (error) {
      console.log(error);
    }
  };

  const Search = () => {
    const params = useParams();
    console.log(params);
    const [randomBooks, setBooks] = useState([]);
  
    useEffect(() => {
        getSeries(params.content).then((images) => {
        console.log(images);
        setBooks(images);
      });
    }, []);
    return(
        <div className="iq-card-body">
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
                                  <a
                                    href="/detail"
                                    className="btn btn-sm btn-white"
                                  >
                                    Detail
                                  </a>
                                </div>
                              </div>
                              <div className="col-6">
                                <div className="mb-2">
                                  <h6 className="mb-1">{item.name}</h6>
                                  <p className="font-size-13 line-height mb-1">
                                    Dangpham
                                  </p>
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
              </div>
    )
}
export default Search;