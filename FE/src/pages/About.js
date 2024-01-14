/* eslint-disable jsx-a11y/img-redundant-alt */
import React from "react";

function About() {
  return (
    <main id="tg-main" className="tg-main tg-haslayout">
      {/*************************************
					News Grid Start
			**************************************/}
      <div className="tg-sectionspace tg-haslayout">
        <div className="container">
          <div className="row">
            <div id="tg-twocolumns" className="tg-twocolumns">
              <div className="col-xs-12 col-sm-8 col-md-8 col-lg-9 pull-right">
                <div id="tg-content" className="tg-content">
                  <div className="tg-products">
                    <div className="tg-productgrid">
                      <div className="tg-refinesearch">
                        <span>showing 1 to 8 of 20 total</span>
                        <form className="tg-formtheme tg-formsortshoitems">
                          <fieldset>
                            <div className="form-group">
                              <label>sort by:</label>
                              <span className="tg-select">
                                <select>
                                  <option>name</option>
                                  <option>name</option>
                                  <option>name</option>
                                </select>
                              </span>
                            </div>
                            <div className="form-group">
                              <label>show:</label>
                              <span className="tg-select">
                                <select>
                                  <option>8</option>
                                  <option>16</option>
                                  <option>20</option>
                                </select>
                              </span>
                            </div>
                          </fieldset>
                        </form>
                      </div>
                      <Book
                        images="assets/images/books/img-01.jpg"
                        title="Truyện dài vãi ò"
                        writer="Dang pham"
                        cost="30.000đ"
                      ></Book>
                      <Book
                        images="assets/images/books/img-01.jpg"
                        title="Truyện dài vãi ò"
                        writer="Dang pham"
                        cost="30.000đ"
                      ></Book>
                      <Book
                        images="assets/images/books/img-01.jpg"
                        title="Truyện dài vãi ò"
                        writer="Dang pham"
                        cost="30.000đ"
                      ></Book>
                      <Book
                        images="assets/images/books/img-01.jpg"
                        title="Truyện dài vãi ò"
                        writer="Dang pham"
                        cost="30.000đ"
                      ></Book>
                      <Book
                        images="assets/images/books/img-01.jpg"
                        title="Truyện dài vãi ò"
                        writer="Dang pham"
                        cost="30.000đ"
                      ></Book>
                      <Book
                        images="assets/images/books/img-01.jpg"
                        title="Truyện dài vãi ò"
                        writer="Dang pham"
                        cost="30.000đ"
                      ></Book>
                      <Book
                        images="assets/images/books/img-01.jpg"
                        title="Truyện dài vãi ò"
                        writer="Dang pham"
                        cost="30.000đ"
                      ></Book>
                      <Book
                        images="assets/images/books/img-01.jpg"
                        title="Truyện dài vãi ò"
                        writer="Dang pham"
                        cost="30.000đ"
                      ></Book>
                      <Book
                        images="assets/images/books/img-01.jpg"
                        title="Truyện dài vãi ò"
                        writer="Dang pham"
                        cost="30.000đ"
                      ></Book>
                    </div>
                  </div>
                </div>
              </div>
              <div className="col-xs-12 col-sm-4 col-md-4 col-lg-3 pull-left">
                <aside id="tg-sidebar" className="tg-sidebar">
                  <div className="tg-widget tg-catagories">
                    <div className="tg-widgettitle">
                      <h3>Categories</h3>
                    </div>
                    <div className="tg-widgetcontent">
                      <ul>
                        <li>
                          <a href="./">
                            <span>Art &amp; Photography</span>
                            <em>28245</em>
                          </a>
                        </li>
                        <li>
                          <a href="./">
                            <span>Biography</span>
                            <em>4856</em>
                          </a>
                        </li>
                        <li>
                          <a href="./">
                            <span>Children’s Book</span>
                            <em>8654</em>
                          </a>
                        </li>
                        <li>
                          <a href="./">
                            <span>Craft &amp; Hobbies</span>
                            <em>6247</em>
                          </a>
                        </li>
                        <li>
                          <a href="./">
                            <span>Crime &amp; Thriller</span>
                            <em>888654</em>
                          </a>
                        </li>
                        <li>
                          <a href="./">
                            <span>Fantasy &amp; Horror</span>
                            <em>873144</em>
                          </a>
                        </li>
                        <li>
                          <a href="./">
                            <span>Fiction</span>
                            <em>18465</em>
                          </a>
                        </li>
                        <li>
                          <a href="./">
                            <span>Fod &amp; Drink</span>
                            <em>3148</em>
                          </a>
                        </li>
                        <li>
                          <a href="./">
                            <span>Graphic, Anime &amp; Manga</span>
                            <em>77531</em>
                          </a>
                        </li>
                        <li>
                          <a href="./">
                            <span>Science Fiction</span>
                            <em>9247</em>
                          </a>
                        </li>
                        <li>
                          <a href="./">
                            <span>View All</span>
                          </a>
                        </li>
                      </ul>
                    </div>
                  </div>
                </aside>
              </div>
            </div>
          </div>
        </div>
      </div>
      {/*************************************
					News Grid End
			**************************************/}
    </main>
  );
}
function Book(props) {
  // eslint-disable-next-line no-undef
  console.log(props);
  return (
    <div className="col-xs-6 col-sm-6 col-md-4 col-lg-3">
      <div className="tg-postbook">
        <figure className="tg-featureimg">
          <div className="tg-bookimg">
            <div className="tg-frontcover">
              <img src={props.images} alt="image description" />
            </div>
            <div className="tg-backcover">
              <img src={props.images} alt="image description" />
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
              <a href="./">Art &amp; Photography</a>
            </li>
          </ul>
          <div className="tg-themetagbox">
            <span className="tg-themetag">sale</span>
          </div>
          <div className="tg-booktitle">
            <h3>
              <a href="./">{props.title}</a>
            </h3>
          </div>
          <span className="tg-bookwriter">
            By: <a href="./">{props.writer}</a>
          </span>
          <span className="tg-stars">
            <span />
          </span>
          <span className="tg-bookprice">
            <ins>{props.cost}</ins>
          </span>
          <a className="tg-btn tg-btnstyletwo" href="./">
            <i className="fa fa-shopping-basket" />
            <em>Add To Basket</em>
          </a>
        </div>
      </div>
    </div>
  );
}
export default About;
