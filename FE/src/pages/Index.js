/* eslint-disable jsx-a11y/img-redundant-alt */
import React from "react";

function Index() {
  return (
    <div id="tg-wrapper" className="tg-wrapper tg-haslayout">
      <section className="tg-sectionspace tg-haslayout">
        <div className="container">
          <div className="row">
            <div className="tg-newrelease">
              <div className="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                <div className="row">
                  <div className="tg-newreleasebooks">
                    <Book
                      images="assets/images/books/img-07.jpg"
                      title="Sách tên dài vãi ò"
                      writer="Dangpham"
                      cost="30.000$"
                    ></Book>
                    <Book
                      images="assets/images/books/img-07.jpg"
                      title="Sách tên dài vãi ò"
                      writer="Dangpham"
                      cost="30.000$"
                    ></Book>
                    <Book
                      images="assets/images/books/img-07.jpg"
                      title="Sách tên dài vãi ò"
                      writer="Dangpham"
                      cost="30.000$"
                    ></Book>
                    <Book
                      images="assets/images/books/img-07.jpg"
                      title="Sách tên dài vãi ò"
                      writer="Dangpham"
                      cost="30.000$"
                    ></Book>
                    <Book
                      images="assets/images/books/img-07.jpg"
                      title="Sách tên dài vãi ò"
                      writer="Dangpham"
                      cost="30.000$"
                    ></Book>
                    <Book
                      images="assets/images/books/img-07.jpg"
                      title="Sách tên dài vãi ò"
                      writer="Dangpham"
                      cost="30.000$"
                    ></Book>
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
            <div className="tg-newrelease">
              <div className="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                <div className="row">
                  <div className="tg-newreleasebooks">
                    <Book
                      images="assets/images/books/img-07.jpg"
                      title="Sách tên dài vãi ò"
                      writer="Dangpham"
                      cost="30.000$"
                    ></Book>
                    <Book
                      images="assets/images/books/img-07.jpg"
                      title="Sách tên dài vãi ò"
                      writer="Dangpham"
                      cost="30.000$"
                    ></Book>
                    <Book
                      images="assets/images/books/img-07.jpg"
                      title="Sách tên dài vãi ò"
                      writer="Dangpham"
                      cost="30.000$"
                    ></Book>
                    <Book
                      images="assets/images/books/img-07.jpg"
                      title="Sách tên dài vãi ò"
                      writer="Dangpham"
                      cost="30.000$"
                    ></Book>
                    <Book
                      images="assets/images/books/img-07.jpg"
                      title="Sách tên dài vãi ò"
                      writer="Dangpham"
                      cost="30.000$"
                    ></Book>
                    <Book
                      images="assets/images/books/img-07.jpg"
                      title="Sách tên dài vãi ò"
                      writer="Dangpham"
                      cost="30.000$"
                    ></Book>
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
            <div className="tg-newrelease">
              <div className="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                <div className="row">
                  <div className="tg-newreleasebooks">
                    <Book
                      images="assets/images/books/img-07.jpg"
                      title="Sách tên dài vãi ò"
                      writer="Dangpham"
                      cost="30.000$"
                    ></Book>
                    <Book
                      images="assets/images/books/img-07.jpg"
                      title="Sách tên dài vãi ò"
                      writer="Dangpham"
                      cost="30.000$"
                    ></Book>
                    <Book
                      images="assets/images/books/img-07.jpg"
                      title="Sách tên dài vãi ò"
                      writer="Dangpham"
                      cost="30.000$"
                    ></Book>
                    <Book
                      images="assets/images/books/img-07.jpg"
                      title="Sách tên dài vãi ò"
                      writer="Dangpham"
                      cost="30.000$"
                    ></Book>
                    <Book
                      images="assets/images/books/img-07.jpg"
                      title="Sách tên dài vãi ò"
                      writer="Dangpham"
                      cost="30.000$"
                    ></Book>
                    <Book
                      images="assets/images/books/img-07.jpg"
                      title="Sách tên dài vãi ò"
                      writer="Dangpham"
                      cost="30.000$"
                    ></Book>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>
    </div>
  );
}
function Book(props) {
  // eslint-disable-next-line no-undef
  console.log(props);
  return (
    <div className="col-xs-2 col-sm-2 col-md-3 col-lg-2">
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
              <a href="./">{props.title}</a>
            </h3>
          </div>
          <span className="tg-bookwriter">
            By: <a href="./">{props.writer}</a>
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

export default Index;
