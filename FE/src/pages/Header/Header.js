/* eslint-disable jsx-a11y/img-redundant-alt */
import React from "react";

function Header() {
  return (
    <header id="tg-header" className="tg-header tg-haslayout">
      <div className="tg-topbar">
        <div className="container">
          <div className="row">
            <div className="col-xs-12 col-sm-12 col-md-12 col-lg-12">
              <ul className="tg-addnav">
                <li>
                  <a href="./">
                    <i className="icon-envelope" />
                    <em>Contact</em>
                  </a>
                </li>
                <li>
                  <a href="./">
                    <i className="icon-question-circle" />
                    <em>Help</em>
                  </a>
                </li>
              </ul>
              <div className="dropdown tg-themedropdown tg-currencydropdown">
                <a
                  href="./"
                  id="tg-currenty"
                  className="tg-btnthemedropdown"
                  data-toggle="dropdown"
                  aria-haspopup="true"
                  aria-expanded="false"
                >
                  <i className="icon-earth" />
                  <span>Currency</span>
                </a>
                <ul
                  className="dropdown-menu tg-themedropdownmenu"
                  aria-labelledby="tg-currenty"
                >
                  <li>
                    <a href="./">
                      <i>£</i>
                      <span>British Pound</span>
                    </a>
                  </li>
                  <li>
                    <a href="./">
                      <i>$</i>
                      <span>Us Dollar</span>
                    </a>
                  </li>
                  <li>
                    <a href="./">
                      <i>€</i>
                      <span>Euro</span>
                    </a>
                  </li>
                </ul>
              </div>
              <div className="tg-userlogin">
                <figure>
                  <a href="/login">
                    <img
                      src="https://i.pinimg.com/736x/b1/75/de/b175de80fb0f5ca9b5230f0b12f3c13c.jpg"
                      alt="image description"
                    />
                  </a>
                </figure>
                <span>Hi, John</span>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div className="tg-middlecontainer">
        <div className="container">
          <div className="row">
            <div className="col-xs-12 col-sm-12 col-md-12 col-lg-12">
              <strong className="tg-logo">
                <a href="index-2.html">
                  <img src="assets/images/logo.png" alt="company name here" />
                </a>
              </strong>
              <div className="tg-wishlistandcart">
                <div className="dropdown tg-themedropdown tg-wishlistdropdown">
                  <a
                    href="./"
                    id="tg-wishlisst"
                    className="tg-btnthemedropdown"
                    data-toggle="dropdown"
                    aria-haspopup="true"
                    aria-expanded="false"
                  >
                    <span className="tg-themebadge">3</span>
                    <i className="icon-heart" />
                    <span>Wishlist</span>
                  </a>
                  <div
                    className="dropdown-menu tg-themedropdownmenu"
                    aria-labelledby="tg-wishlisst"
                  >
                    <div className="tg-description">
                      <p>No products were added to the wishlist!</p>
                    </div>
                  </div>
                </div>
                <div className="dropdown tg-themedropdown tg-minicartdropdown">
                  <a
                    href="./"
                    id="tg-minicart"
                    className="tg-btnthemedropdown"
                    data-toggle="dropdown"
                    aria-haspopup="true"
                    aria-expanded="false"
                  >
                    <span className="tg-themebadge">3</span>
                    <i className="icon-cart" />
                    <span>$123.00</span>
                  </a>
                  <div
                    className="dropdown-menu tg-themedropdownmenu"
                    aria-labelledby="tg-minicart"
                  >
                    <div className="tg-minicartbody">
                      <div className="tg-minicarproduct">
                        <figure>
                          <img
                            src="assets/images/products/img-01.jpg"
                            alt="image description"
                          />
                        </figure>
                        <div className="tg-minicarproductdata">
                          <h5>
                            <a href="./">Our State Fair Is A Great Function</a>
                          </h5>
                          <h6>
                            <a href="./">$ 12.15</a>
                          </h6>
                        </div>
                      </div>
                    </div>
                    <div className="tg-minicartfoot">
                      <a className="tg-btnemptycart" href="./">
                        <i className="fa fa-trash-o" />
                        <span>Clear Your Cart</span>
                      </a>
                      <span className="tg-subtotal">
                        Subtotal: <strong>35.78</strong>
                      </span>
                      <div className="tg-btns">
                        <a className="tg-btn tg-active" href="./">
                          View Cart
                        </a>
                        <a className="tg-btn" href="./">
                          Checkout
                        </a>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div className="tg-searchbox">
                <form className="tg-formtheme tg-formsearch">
                  <fieldset>
                    <input
                      type="text"
                      name="search"
                      className="typeahead form-control"
                      placeholder="Search by title, author, keyword, ISBN..."
                    />
                    <button type="submit">
                      <i className="icon-magnifier" />
                    </button>
                  </fieldset>
                  <a href="./">+ Advanced Search</a>
                </form>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div className="tg-navigationarea">
        <div className="container">
          <div className="row">
            <div className="col-xs-12 col-sm-12 col-md-12 col-lg-12">
              <nav id="tg-nav" className="tg-nav">
                <div className="navbar-header">
                  <button
                    type="button"
                    className="navbar-toggle collapsed"
                    data-toggle="collapse"
                    data-target="#tg-navigation"
                    aria-expanded="false"
                  >
                    <span className="sr-only">Toggle navigation</span>
                    <span className="icon-bar" />
                    <span className="icon-bar" />
                    <span className="icon-bar" />
                  </button>
                </div>
                <div
                  id="tg-navigation"
                  className="collapse navbar-collapse tg-navigation"
                >
                  <ul>
                    <li>
                      <a href="/index">Home</a>
                    </li>
                    <li className="menu-item-has-children">
                      <a href="./">Latest News</a>
                      <ul className="sub-menu">
                        <li>
                          <a href="newslist.html">News List</a>
                        </li>
                        <li>
                          <a href="newsgrid.html">News Grid</a>
                        </li>
                        <li>
                          <a href="newsdetail.html">News Detail</a>
                        </li>
                      </ul>
                    </li>
                    <li className="menu-item-has-children current-menu-item">
                      <a href="./">
                        <i className="icon-menu" />
                      </a>
                      <ul className="sub-menu">
                        <li className="menu-item-has-children">
                          <a href="aboutus.html">Products</a>
                          <ul className="sub-menu">
                            <li>
                              <a href="products.html">Products</a>
                            </li>
                            <li>
                              <a href="productdetail.html">Product Detail</a>
                            </li>
                          </ul>
                        </li>
                        <li>
                          <a href="aboutus.html">About Us</a>
                        </li>
                        <li>
                          <a href="404error.html">404 Error</a>
                        </li>
                        <li>
                          <a href="comingsoon.html">Coming Soon</a>
                        </li>
                      </ul>
                    </li>
                  </ul>
                </div>
              </nav>
            </div>
          </div>
        </div>
      </div>
    </header>
  );
}

export default Header;
