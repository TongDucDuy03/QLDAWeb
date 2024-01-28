import React from "react";
import Series2 from "./Series2";
function Series22() {
  return (
    <div id="content-page" className="content-page">
      <div className="container-fluid">
        <div className="row">
          <div className="col-lg-12">
            <div className="iq-card iq-card-block iq-card-stretch iq-card-height">
              <div className="iq-card-header d-flex justify-content-between align-items-center position-relative">
                <div className="iq-header-title">
                  <h4 className="card-title mb-0">Truyện dài</h4>
                </div>
                <div className="iq-card-header-toolbar d-flex align-items-center">
                  <a
                    href="category.html"
                    className="btn btn-sm btn-primary view-more"
                  >
                    Xem Thêm
                  </a>
                </div>
              </div>
              <div className="iq-card-body">
                <Series2></Series2>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
}
export default Series22;
