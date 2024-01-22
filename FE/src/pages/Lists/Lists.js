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
                </div>
              </div>
            </div>
          </div>
        </section>
      </div>
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
                      <Books></Books>
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
