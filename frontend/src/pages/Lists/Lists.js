/* eslint-disable jsx-a11y/img-redundant-alt */
import React from "react";
import Books from "../Books/Books";
import Books2 from "../Books/Books2";
function Lists(props) {
  console.log(props);
  return (
    <>
      <div id="tg-wrapper" className="tg-wrapper tg-haslayout">
        <section className="tg-sectionspace tg-haslayout">
          <div className="container">
            <div className="row">
              <div className="tg-sectionhead">
                <h2>
                  <span></span>
                  {props.charec}
                </h2>
                <a class="tg-btn" href="./">
                  View All
                </a>
              </div>
              <div className="tg-newrelease">
                <div className="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                  <div className="row">
                    <div className="tg-newreleasebooks">
                      <Books2></Books2>
                    </div>
                  </div>
                  <div className="owl-nav">
                    <div className="owl-prev tg-btnround tg-btnprev">
                      <i className="icon-chevron-left" />
                    </div>
                    <div className="owl-next tg-btnround tg-btnnext">
                      <i className="icon-chevron-right" />
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </section>
        <section className="tg-sectionspace tg-haslayout">
          <div className="container">
            <div className="row">
              <div className="tg-sectionhead">
                <h2>
                  <span></span>
                  {props.charec}
                </h2>
                <a class="tg-btn" href="./">
                  View All
                </a>
              </div>
              <div className="tg-newrelease">
                <div className="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                  <div className="row">
                    <div className="tg-newreleasebooks">
                      <Books></Books>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </section>
        <section className="tg-sectionspace tg-haslayout">
          <div className="container">
            <div className="row">
              <div className="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                <div className="tg-sectionhead">
                  <h2>
                    <span>People’s Choice</span>Bestselling Books
                  </h2>
                  <a className="tg-btn" href="./">
                    View All
                  </a>
                </div>
              </div>
              <div className="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                <div
                  id="tg-bestsellingbooksslider"
                  className="tg-bestsellingbooksslider tg-bestsellingbooks owl-carousel owl-loaded owl-drag"
                >
                  <div className="owl-stage-outer">
                    <div
                      className="owl-stage"
                      style={{
                        transform: "translate3d(-2000px, 0px, 0px)",
                        transition: "all 0.25s ease 0s",
                        width: 3750,
                      }}
                    >
                      <div
                        className="owl-item cloned"
                        style={{ width: 220, marginRight: 30 }}
                      >
                        <div className="item">
                          <div className="tg-postbook">
                            <figure className="tg-featureimg">
                              <div className="tg-bookimg">
                                <div className="tg-frontcover">
                                  <img
                                    src="assets/images/books/img-04.jpg"
                                    alt="image description"
                                  />
                                </div>
                                <div className="tg-backcover">
                                  <img
                                    src="assets/images/books/img-04.jpg"
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
                                  <a href="./">
                                    Our State Fair Is A Great State Fair
                                  </a>
                                </h3>
                              </div>
                              <span className="tg-bookwriter">
                                By: <a href="./">Angela Gunning</a>
                              </span>
                              <span className="tg-stars">
                                <span />
                              </span>
                              <span className="tg-bookprice">
                                <ins>$25.18</ins>
                                <del>$27.20</del>
                              </span>
                              <a className="tg-btn tg-btnstyletwo" href="./">
                                <i className="fa fa-shopping-basket" />
                                <em>Add To Basket</em>
                              </a>
                            </div>
                          </div>
                        </div>
                      </div>
                      <div
                        className="owl-item cloned"
                        style={{ width: 220, marginRight: 30 }}
                      >
                        <div className="item">
                          <div className="tg-postbook">
                            <figure className="tg-featureimg">
                              <div className="tg-bookimg">
                                <div className="tg-frontcover">
                                  <img
                                    src="assets/images/books/img-05.jpg"
                                    alt="image description"
                                  />
                                </div>
                                <div className="tg-backcover">
                                  <img
                                    src="assets/images/books/img-05.jpg"
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
                              <div className="tg-themetagbox" />
                              <div className="tg-booktitle">
                                <h3>
                                  <a href="./">Put The Petal To The Metal</a>
                                </h3>
                              </div>
                              <span className="tg-bookwriter">
                                By: <a href="./">Angela Gunning</a>
                              </span>
                              <span className="tg-stars">
                                <span />
                              </span>
                              <span className="tg-bookprice">
                                <ins>$25.18</ins>
                                <del>$27.20</del>
                              </span>
                              <a className="tg-btn tg-btnstyletwo" href="./">
                                <i className="fa fa-shopping-basket" />
                                <em>Add To Basket</em>
                              </a>
                            </div>
                          </div>
                        </div>
                      </div>
                      <div
                        className="owl-item cloned"
                        style={{ width: 220, marginRight: 30 }}
                      >
                        <div className="item">
                          <div className="tg-postbook">
                            <figure className="tg-featureimg">
                              <div className="tg-bookimg">
                                <div className="tg-frontcover">
                                  <img
                                    src="assets/images/books/img-06.jpg"
                                    alt="image description"
                                  />
                                </div>
                                <div className="tg-backcover">
                                  <img
                                    src="assets/images/books/img-06.jpg"
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
                                  <a href="./">Help Me Find My Stomach</a>
                                </h3>
                              </div>
                              <span className="tg-bookwriter">
                                By: <a href="./">Angela Gunning</a>
                              </span>
                              <span className="tg-stars">
                                <span />
                              </span>
                              <span className="tg-bookprice">
                                <ins>$25.18</ins>
                                <del>$27.20</del>
                              </span>
                              <a className="tg-btn tg-btnstyletwo" href="./">
                                <i className="fa fa-shopping-basket" />
                                <em>Add To Basket</em>
                              </a>
                            </div>
                          </div>
                        </div>
                      </div>
                      <div
                        className="owl-item cloned"
                        style={{ width: 220, marginRight: 30 }}
                      >
                        <div className="item">
                          <div className="tg-postbook">
                            <figure className="tg-featureimg">
                              <div className="tg-bookimg">
                                <div className="tg-frontcover">
                                  <img
                                    src="assets/images/books/img-03.jpg"
                                    alt="image description"
                                  />
                                </div>
                                <div className="tg-backcover">
                                  <img
                                    src="assets/images/books/img-03.jpg"
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
                              <div className="tg-themetagbox" />
                              <div className="tg-booktitle">
                                <h3>
                                  <a href="./">Let The Good Times Roll Up</a>
                                </h3>
                              </div>
                              <span className="tg-bookwriter">
                                By: <a href="./">Angela Gunning</a>
                              </span>
                              <span className="tg-stars">
                                <span />
                              </span>
                              <span className="tg-bookprice">
                                <ins>$25.18</ins>
                                <del>$27.20</del>
                              </span>
                              <a className="tg-btn tg-btnstyletwo" href="./">
                                <i className="fa fa-shopping-basket" />
                                <em>Add To Basket</em>
                              </a>
                            </div>
                          </div>
                        </div>
                      </div>
                      <div
                        className="owl-item"
                        style={{ width: 220, marginRight: 30 }}
                      >
                        <div className="item">
                          <div className="tg-postbook">
                            <figure className="tg-featureimg">
                              <div className="tg-bookimg">
                                <div className="tg-frontcover">
                                  <img
                                    src="assets/images/books/img-01.jpg"
                                    alt="image description"
                                  />
                                </div>
                                <div className="tg-backcover">
                                  <img
                                    src="assets/images/books/img-01.jpg"
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
                                  <a href="./">Help Me Find My Stomach</a>
                                </h3>
                              </div>
                              <span className="tg-bookwriter">
                                By: <a href="./">Angela Gunning</a>
                              </span>
                              <span className="tg-stars">
                                <span />
                              </span>
                              <span className="tg-bookprice">
                                <ins>$25.18</ins>
                                <del>$27.20</del>
                              </span>
                              <a className="tg-btn tg-btnstyletwo" href="./">
                                <i className="fa fa-shopping-basket" />
                                <em>Add To Basket</em>
                              </a>
                            </div>
                          </div>
                        </div>
                      </div>
                      <div
                        className="owl-item"
                        style={{ width: 220, marginRight: 30 }}
                      >
                        <div className="item">
                          <div className="tg-postbook">
                            <figure className="tg-featureimg">
                              <div className="tg-bookimg">
                                <div className="tg-frontcover">
                                  <img
                                    src="assets/images/books/img-02.jpg"
                                    alt="image description"
                                  />
                                </div>
                                <div className="tg-backcover">
                                  <img
                                    src="assets/images/books/img-02.jpg"
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
                                  <a href="./">Drive Safely, No Bumping</a>
                                </h3>
                              </div>
                              <span className="tg-bookwriter">
                                By: <a href="./">Angela Gunning</a>
                              </span>
                              <span className="tg-stars">
                                <span />
                              </span>
                              <span className="tg-bookprice">
                                <ins>$25.18</ins>
                                <del>$27.20</del>
                              </span>
                              <a className="tg-btn tg-btnstyletwo" href="./">
                                <i className="fa fa-shopping-basket" />
                                <em>Add To Basket</em>
                              </a>
                            </div>
                          </div>
                        </div>
                      </div>
                      <div
                        className="owl-item"
                        style={{ width: 220, marginRight: 30 }}
                      >
                        <div className="item">
                          <div className="tg-postbook">
                            <figure className="tg-featureimg">
                              <div className="tg-bookimg">
                                <div className="tg-frontcover">
                                  <img
                                    src="assets/images/books/img-03.jpg"
                                    alt="image description"
                                  />
                                </div>
                                <div className="tg-backcover">
                                  <img
                                    src="assets/images/books/img-03.jpg"
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
                              <div className="tg-themetagbox" />
                              <div className="tg-booktitle">
                                <h3>
                                  <a href="./">Let The Good Times Roll Up</a>
                                </h3>
                              </div>
                              <span className="tg-bookwriter">
                                By: <a href="./">Angela Gunning</a>
                              </span>
                              <span className="tg-stars">
                                <span />
                              </span>
                              <span className="tg-bookprice">
                                <ins>$25.18</ins>
                                <del>$27.20</del>
                              </span>
                              <a className="tg-btn tg-btnstyletwo" href="./">
                                <i className="fa fa-shopping-basket" />
                                <em>Add To Basket</em>
                              </a>
                            </div>
                          </div>
                        </div>
                      </div>
                      <div
                        className="owl-item"
                        style={{ width: 220, marginRight: 30 }}
                      >
                        <div className="item">
                          <div className="tg-postbook">
                            <figure className="tg-featureimg">
                              <div className="tg-bookimg">
                                <div className="tg-frontcover">
                                  <img
                                    src="assets/images/books/img-04.jpg"
                                    alt="image description"
                                  />
                                </div>
                                <div className="tg-backcover">
                                  <img
                                    src="assets/images/books/img-04.jpg"
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
                                  <a href="./">
                                    Our State Fair Is A Great State Fair
                                  </a>
                                </h3>
                              </div>
                              <span className="tg-bookwriter">
                                By: <a href="./">Angela Gunning</a>
                              </span>
                              <span className="tg-stars">
                                <span />
                              </span>
                              <span className="tg-bookprice">
                                <ins>$25.18</ins>
                                <del>$27.20</del>
                              </span>
                              <a className="tg-btn tg-btnstyletwo" href="./">
                                <i className="fa fa-shopping-basket" />
                                <em>Add To Basket</em>
                              </a>
                            </div>
                          </div>
                        </div>
                      </div>
                      <div
                        className="owl-item active"
                        style={{ width: 220, marginRight: 30 }}
                      >
                        <div className="item">
                          <div className="tg-postbook">
                            <figure className="tg-featureimg">
                              <div className="tg-bookimg">
                                <div className="tg-frontcover">
                                  <img
                                    src="assets/images/books/img-05.jpg"
                                    alt="image description"
                                  />
                                </div>
                                <div className="tg-backcover">
                                  <img
                                    src="assets/images/books/img-05.jpg"
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
                              <div className="tg-themetagbox" />
                              <div className="tg-booktitle">
                                <h3>
                                  <a href="./">Put The Petal To The Metal</a>
                                </h3>
                              </div>
                              <span className="tg-bookwriter">
                                By: <a href="./">Angela Gunning</a>
                              </span>
                              <span className="tg-stars">
                                <span />
                              </span>
                              <span className="tg-bookprice">
                                <ins>$25.18</ins>
                                <del>$27.20</del>
                              </span>
                              <a className="tg-btn tg-btnstyletwo" href="./">
                                <i className="fa fa-shopping-basket" />
                                <em>Add To Basket</em>
                              </a>
                            </div>
                          </div>
                        </div>
                      </div>
                      <div
                        className="owl-item active"
                        style={{ width: 220, marginRight: 30 }}
                      >
                        <div className="item">
                          <div className="tg-postbook">
                            <figure className="tg-featureimg">
                              <div className="tg-bookimg">
                                <div className="tg-frontcover">
                                  <img
                                    src="assets/images/books/img-06.jpg"
                                    alt="image description"
                                  />
                                </div>
                                <div className="tg-backcover">
                                  <img
                                    src="assets/images/books/img-06.jpg"
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
                                  <a href="./">Help Me Find My Stomach</a>
                                </h3>
                              </div>
                              <span className="tg-bookwriter">
                                By: <a href="./">Angela Gunning</a>
                              </span>
                              <span className="tg-stars">
                                <span />
                              </span>
                              <span className="tg-bookprice">
                                <ins>$25.18</ins>
                                <del>$27.20</del>
                              </span>
                              <a className="tg-btn tg-btnstyletwo" href="./">
                                <i className="fa fa-shopping-basket" />
                                <em>Add To Basket</em>
                              </a>
                            </div>
                          </div>
                        </div>
                      </div>
                      <div
                        className="owl-item active"
                        style={{ width: 220, marginRight: 30 }}
                      >
                        <div className="item">
                          <div className="tg-postbook">
                            <figure className="tg-featureimg">
                              <div className="tg-bookimg">
                                <div className="tg-frontcover">
                                  <img
                                    src="assets/images/books/img-03.jpg"
                                    alt="image description"
                                  />
                                </div>
                                <div className="tg-backcover">
                                  <img
                                    src="assets/images/books/img-03.jpg"
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
                              <div className="tg-themetagbox" />
                              <div className="tg-booktitle">
                                <h3>
                                  <a href="./">Let The Good Times Roll Up</a>
                                </h3>
                              </div>
                              <span className="tg-bookwriter">
                                By: <a href="./">Angela Gunning</a>
                              </span>
                              <span className="tg-stars">
                                <span />
                              </span>
                              <span className="tg-bookprice">
                                <ins>$25.18</ins>
                                <del>$27.20</del>
                              </span>
                              <a className="tg-btn tg-btnstyletwo" href="./">
                                <i className="fa fa-shopping-basket" />
                                <em>Add To Basket</em>
                              </a>
                            </div>
                          </div>
                        </div>
                      </div>
                      <div
                        className="owl-item cloned"
                        style={{ width: 220, marginRight: 30 }}
                      >
                        <div className="item">
                          <div className="tg-postbook">
                            <figure className="tg-featureimg">
                              <div className="tg-bookimg">
                                <div className="tg-frontcover">
                                  <img
                                    src="assets/images/books/img-01.jpg"
                                    alt="image description"
                                  />
                                </div>
                                <div className="tg-backcover">
                                  <img
                                    src="assets/images/books/img-01.jpg"
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
                                  <a href="./">Help Me Find My Stomach</a>
                                </h3>
                              </div>
                              <span className="tg-bookwriter">
                                By: <a href="./">Angela Gunning</a>
                              </span>
                              <span className="tg-stars">
                                <span />
                              </span>
                              <span className="tg-bookprice">
                                <ins>$25.18</ins>
                                <del>$27.20</del>
                              </span>
                              <a className="tg-btn tg-btnstyletwo" href="./">
                                <i className="fa fa-shopping-basket" />
                                <em>Add To Basket</em>
                              </a>
                            </div>
                          </div>
                        </div>
                      </div>
                      <div
                        className="owl-item cloned"
                        style={{ width: 220, marginRight: 30 }}
                      >
                        <div className="item">
                          <div className="tg-postbook">
                            <figure className="tg-featureimg">
                              <div className="tg-bookimg">
                                <div className="tg-frontcover">
                                  <img
                                    src="assets/images/books/img-02.jpg"
                                    alt="image description"
                                  />
                                </div>
                                <div className="tg-backcover">
                                  <img
                                    src="assets/images/books/img-02.jpg"
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
                                  <a href="./">Drive Safely, No Bumping</a>
                                </h3>
                              </div>
                              <span className="tg-bookwriter">
                                By: <a href="./">Angela Gunning</a>
                              </span>
                              <span className="tg-stars">
                                <span />
                              </span>
                              <span className="tg-bookprice">
                                <ins>$25.18</ins>
                                <del>$27.20</del>
                              </span>
                              <a className="tg-btn tg-btnstyletwo" href="./">
                                <i className="fa fa-shopping-basket" />
                                <em>Add To Basket</em>
                              </a>
                            </div>
                          </div>
                        </div>
                      </div>
                      <div
                        className="owl-item cloned"
                        style={{ width: 220, marginRight: 30 }}
                      >
                        <div className="item">
                          <div className="tg-postbook">
                            <figure className="tg-featureimg">
                              <div className="tg-bookimg">
                                <div className="tg-frontcover">
                                  <img
                                    src="assets/images/books/img-03.jpg"
                                    alt="image description"
                                  />
                                </div>
                                <div className="tg-backcover">
                                  <img
                                    src="assets/images/books/img-03.jpg"
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
                              <div className="tg-themetagbox" />
                              <div className="tg-booktitle">
                                <h3>
                                  <a href="./">Let The Good Times Roll Up</a>
                                </h3>
                              </div>
                              <span className="tg-bookwriter">
                                By: <a href="./">Angela Gunning</a>
                              </span>
                              <span className="tg-stars">
                                <span />
                              </span>
                              <span className="tg-bookprice">
                                <ins>$25.18</ins>
                                <del>$27.20</del>
                              </span>
                              <a className="tg-btn tg-btnstyletwo" href="./">
                                <i className="fa fa-shopping-basket" />
                                <em>Add To Basket</em>
                              </a>
                            </div>
                          </div>
                        </div>
                      </div>
                      <div
                        className="owl-item cloned"
                        style={{ width: 220, marginRight: 30 }}
                      >
                        <div className="item">
                          <div className="tg-postbook">
                            <figure className="tg-featureimg">
                              <div className="tg-bookimg">
                                <div className="tg-frontcover">
                                  <img
                                    src="assets/images/books/img-04.jpg"
                                    alt="image description"
                                  />
                                </div>
                                <div className="tg-backcover">
                                  <img
                                    src="assets/images/books/img-04.jpg"
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
                                  <a href="./">
                                    Our State Fair Is A Great State Fair
                                  </a>
                                </h3>
                              </div>
                              <span className="tg-bookwriter">
                                By: <a href="./">Angela Gunning</a>
                              </span>
                              <span className="tg-stars">
                                <span />
                              </span>
                              <span className="tg-bookprice">
                                <ins>$25.18</ins>
                                <del>$27.20</del>
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
                  <div className="owl-nav">
                    <div className="owl-prev tg-btnround tg-btnprev">
                      <i className="icon-chevron-left" />
                    </div>
                    <div className="owl-next tg-btnround tg-btnnext">
                      <i className="icon-chevron-right" />
                    </div>
                  </div>
                  <div className="owl-dots">
                    <div className="owl-dot">
                      <span />
                    </div>
                    <div className="owl-dot active">
                      <span />
                    </div>
                    <div className="owl-dot">
                      <span />
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </section>
      </div>
    </>
  );
}
export default Lists;
