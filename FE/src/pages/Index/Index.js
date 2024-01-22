/* eslint-disable jsx-a11y/img-redundant-alt */
import React from "react";
import Books from "../Books/Books";
import Books2 from "../Books/Books2";

function Index() {
  return (
    <>
      <div id="tg-wrapper" className="tg-wrapper tg-haslayout">
        <section className="tg-sectionspace tg-haslayout">
          <div className="container">
            <div className="row">
              <div className="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                <div className="tg-sectionhead">
                  <h2>
                    <span>People’s Choice</span>Truyện ngắn
                  </h2>
                  <div className="owl-nav">
                    <div className="owl-prev tg-btnround tg-btnprev">
                      <i className="icon-chevron-left" />
                    </div>
                    <div className="owl-next tg-btnround tg-btnnext">
                      <i className="icon-chevron-right" />
                    </div>
                  </div>
                  <div className="owl-dots">
                    <div className="owl-dot active">
                      <span />
                    </div>
                    <div className="owl-dot">
                      <span />
                    </div>
                    <div className="owl-dot">
                      <span />
                    </div>
                  </div>
                  <a className="tg-btn" href="./">
                    View All
                  </a>
                </div>
                <Books></Books>
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
                    <span>People’s Choice</span>Truyện dài
                  </h2>
                  <div className="owl-nav">
                    <div className="owl-prev tg-btnround tg-btnprev">
                      <i className="icon-chevron-left" />
                    </div>
                    <div className="owl-next tg-btnround tg-btnnext">
                      <i className="icon-chevron-right" />
                    </div>
                  </div>
                  <div className="owl-dots">
                    <div className="owl-dot active">
                      <span />
                    </div>
                    <div className="owl-dot">
                      <span />
                    </div>
                    <div className="owl-dot">
                      <span />
                    </div>
                  </div>
                  <a className="tg-btn" href="./">
                    View All
                  </a>
                </div>
                <Books2></Books2>
              </div>
            </div>
          </div>
        </section>
      </div>
    </>
  );
}

export default Index;
