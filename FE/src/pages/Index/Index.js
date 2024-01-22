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
              <div className="tg-sectionhead">
                <h2>
                  <span></span>Truyện ngắn
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
              <div className="tg-sectionhead">
                <h2>
                  <span></span>Truyện dài
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
                </div>
              </div>
            </div>
          </div>
        </section>
      </div>
    </>
  );
}

export default Index;
