import React from "react";
import Series1 from "./Series1";
function Series11() {
  return (
    <div id="content-page" className="content-page">
      <div className="container-fluid">
        <div className="row">
          <div className="col-lg-12">
            <div className="iq-card iq-card-block iq-card-stretch iq-card-height">
              <div className="iq-card-header d-flex justify-content-between align-items-center position-relative">
                <div className="iq-header-title">
                  <h4 className="card-title mb-0">Truyện ngắn</h4>
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
                <Series1></Series1>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
}
export default Series11;
