/* eslint-disable jsx-a11y/img-redundant-alt */
import React, { useEffect, useState } from "react";
import axios from "axios";

const getBookdetail = async (id) => {
  try {
    const response = await axios.get(
      `https://localhost:7108/api/Product/${id}`
    );
    console.log(response);
    return response.data;
  } catch (error) {
    console.log(error);
    throw error; // rethrow the error to be caught by the calling code
  }
};

const Bookdetail = ({ match }) => {
  const [randomBookdetail, setBookdetail] = useState([]);

  useEffect(() => {
    const fetchBookDetail = async () => {
      try {
        const bookId = match?.params?.id; // Using optional chaining to avoid errors
        if (bookId) {
          const images = await getBookdetail(bookId);
          console.log(images);
          setBookdetail(images);
        }
      } catch (error) {
        // Handle the error gracefully, e.g., redirect to an error page
        console.error("Error fetching book details:", error);
      }
    };

    fetchBookDetail();
  }, [match]);
  return (
    <div>
      {randomBookdetail.length > 0 &&
        randomBookdetail.map((item, index) => (
          <>
            <div className="tg-sectionspace tg-haslayout">
              <div className="container">
                <div className="row">
                  <div id="tg-twocolumns" className="tg-twocolumns">
                    <div className="col-xs-12 col-sm-12 col-md-12 col-lg-12 pull-right">
                      <div id="tg-content" className="tg-content">
                        <div className="tg-productdetail">
                          <div className="row">
                            <div className="col-xs-12 col-sm-12 col-md-4 col-lg-4">
                              <div className="tg-postbook">
                                <figure className="tg-featureimg">
                                  <img
                                    src={item.imagesUrl}
                                    alt="image description"
                                  />
                                </figure>
                                <div className="tg-postbookcontent">
                                  <span className="tg-bookprice">
                                    <ins>{item.price}</ins>
                                  </span>
                                  <ul className="tg-delevrystock">
                                    <li>
                                      <i className="icon-rocket" />
                                      <span>Free delivery worldwide</span>
                                    </li>
                                    <li>
                                      <i className="icon-checkmark-circle" />
                                      <span>
                                        Dispatch from the USA in 2 working days{" "}
                                      </span>
                                    </li>
                                    <li>
                                      <i className="icon-store" />
                                      <span>
                                        Status: <em>In Stock</em>
                                      </span>
                                    </li>
                                  </ul>
                                  <div className="tg-quantityholder">
                                    <em className="minus">-</em>
                                    <input
                                      type="text"
                                      className="result"
                                      defaultValue={0}
                                      id="quantity1"
                                      name="quantity"
                                    />
                                    <em className="plus">+</em>
                                  </div>
                                  <a
                                    className="tg-btn tg-active tg-btn-lg"
                                    href="./"
                                  >
                                    Add To Basket
                                  </a>
                                  <a className="tg-btnaddtowishlist" href="./">
                                    <span>add to wishlist</span>
                                  </a>
                                </div>
                              </div>
                            </div>
                            <div className="col-xs-12 col-sm-12 col-md-8 col-lg-8">
                              <div className="tg-productcontent">
                                <ul className="tg-bookscategories">
                                  <li>
                                    <a href="./">Art &amp; Photography</a>
                                  </li>
                                </ul>
                                <div className="tg-themetagbox">
                                  <span className="tg-themetag">sale</span>
                                </div>
                                <div className="tg-booktitle">
                                  <h3>{item.name}</h3>
                                </div>
                                <span className="tg-bookwriter">
                                  By: <a href="./">Angela Gunning</a>
                                </span>
                                <span className="tg-stars">
                                  <span />
                                </span>
                                <span className="tg-addreviews">
                                  <a href="./">Add Your Review</a>
                                </span>
                                <div className="tg-share">
                                  <span>Share:</span>
                                  <ul className="tg-socialicons">
                                    <li className="tg-facebook">
                                      <a href="./">
                                        <i className="fa fa-facebook" />
                                      </a>
                                    </li>
                                    <li className="tg-twitter">
                                      <a href="./">
                                        <i className="fa fa-twitter" />
                                      </a>
                                    </li>
                                    <li className="tg-linkedin">
                                      <a href="./">
                                        <i className="fa fa-linkedin" />
                                      </a>
                                    </li>
                                    <li className="tg-googleplus">
                                      <a href="./">
                                        <i className="fa fa-google-plus" />
                                      </a>
                                    </li>
                                    <li className="tg-rss">
                                      <a href="./">
                                        <i className="fa fa-rss" />
                                      </a>
                                    </li>
                                  </ul>
                                </div>
                                <div className="tg-productdescription">
                                  <div className="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                    <div className="tg-sectionhead">
                                      <h2>Product Description</h2>
                                    </div>
                                    <ul className="tg-themetabs" role="tablist">
                                      <li
                                        role="presentation"
                                        className="active"
                                      >
                                        <a
                                          href="#description"
                                          data-toggle="tab"
                                        >
                                          Description
                                        </a>
                                      </li>
                                    </ul>
                                    <div className="tg-tab-content tab-content">
                                      <div
                                        role="tabpanel"
                                        className="tg-tab-pane tab-pane active"
                                        id="description"
                                      >
                                        <div className="tg-description">
                                          {item.description}
                                        </div>
                                      </div>
                                      <div
                                        role="tabpanel"
                                        className="tg-tab-pane tab-pane"
                                        id="review"
                                      >
                                        <div className="tg-description"></div>
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
                </div>
              </div>
            </div>
          </>
        ))}
    </div>
  );
};
export default Bookdetail;
