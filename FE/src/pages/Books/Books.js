/* eslint-disable jsx-a11y/img-redundant-alt */
import React, { useEffect, useState } from "react";
import axios from "axios";

const getBooks = async () => {
  try {
    const response = await axios.get(
      `https://localhost:7108/api/Product/series/1`
    );
    console.log(response);
    return response.data;
  } catch (error) {
    console.log(error);
  }
};

const Books = () => {
  const [randomBooks, setBooks] = useState([]);

  useEffect(() => {
    getBooks().then((images) => {
      console.log(images);
      setBooks(images);
    });
  }, []);

  return (
    <div>
      {randomBooks.length > 0 &&
        randomBooks.map((item, index) => (
          <div key={item.id}>
            <div
              className="col-xs-2 col-sm-2 col-md-3 col-lg-2"
              key={item.id}
              style={{ overflow: "hidden" }}
            >
              <div
                id="tg-bestsellingbooksslider"
                className="tg-bestsellingbooksslider tg-bestsellingbooks owl-carousel owl-loaded owl-drag"
              >
                <div className="owl-stage-outer">
                  <div className="owl-stage">
                    <div className="owl-item">
                      <div className="item">
                        <div className="tg-postbook">
                          <figure className="tg-featureimg">
                            <div className="tg-bookimg">
                              <div className="tg-frontcover">
                                <img
                                  src={item.imagesUrl}
                                  alt="image description"
                                  style={{ overflow: "hidden" }}
                                />
                              </div>
                              <div className="tg-backcover">
                                <img
                                  src={item.imagesUrl}
                                  alt="image description"
                                />
                              </div>
                            </div>
                            <a className="tg-btnaddtowishlist" href="./">
                              <i className="icon-heart" />
                              <span>add to wishlist</span>
                            </a>
                          </figure>
                          <div className="tg-postbookcontent">
                            <ul className="tg-bookscategories">
                              <li>
                                <a href="./">Adventure</a>
                              </li>
                              <li>
                                <a href="./">Fun</a>
                              </li>
                            </ul>
                            <div className="tg-themetagbox">
                              <span className="tg-themetag">sale</span>
                            </div>
                            <div className="tg-booktitle">
                              <h3>
                                <a href="/index2">{item.name}</a>
                              </h3>
                            </div>
                            <span className="tg-bookprice">
                              <ins>{item.price}</ins>
                            </span>
                            <a className="tg-btn tg-btnstyletwo" href="./">
                              <i className="fa fa-shopping-basket" />
                              <em>Add To Basket</em>
                            </a>
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
export default Books;
