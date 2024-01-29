import React from "react";

function Detail() {
  return (
    <div id="content-page" className="content-page">
      <div className="container-fluid">
        <div className="row">
          <div className="col-sm-12">
            <div className="iq-card iq-card-block iq-card-stretch iq-card-height">
              <div className="iq-card-header d-flex justify-content-between align-items-center">
                <h4 className="card-title mb-0">Thông tin</h4>
              </div>
              <div className="iq-card-body pb-0">
                <div className="description-contens align-items-top row">
                  <div className="col-md-6">
                    <div className="iq-card-transparent iq-card-block iq-card-stretch iq-card-height">
                      <div className="iq-card-body p-0">
                        <div className="row align-items-center">
                          <div className="col-12">
                            <ul
                              id="description-slider"
                              className="list-inline p-0 m-0  d-flex align-items-center"
                            >
                              <li>
                                <a href="./">
                                  <img
                                    src="assets/images/book-dec/06.jpg"
                                    className="img-fluid w-100 rounded"
                                    alt=""
                                  />
                                </a>
                              </li>
                            </ul>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div className="col-md-6">
                    <div className="iq-card-transparent iq-card-block iq-card-stretch iq-card-height">
                      <div className="iq-card-body p-0">
                        <h3 className="mb-3">Payback Time - Ngày Đòi Nợ</h3>
                        <div className="price d-flex align-items-center font-weight-500 mb-2">
                          <span className="font-size-20 pr-2 old-price">
                            350.000 ₫
                          </span>
                          <span className="font-size-24 text-dark">
                            299.000 ₫
                          </span>
                        </div>
                        <div className="mb-3 d-block">
                          <span className="font-size-20 text-warning">
                            <i className="fa fa-star mr-1" />
                            <i className="fa fa-star mr-1" />
                            <i className="fa fa-star mr-1" />
                            <i className="fa fa-star mr-1" />
                            <i className="fa fa-star" />
                          </span>
                        </div>
                        <span className="text-dark mb-4 pb-4 iq-border-bottom d-block">
                          "Trong chứng khoán và thị trường tài chính, dám tham
                          gia đầu tư cũng là một thành công tâm lý ban đầu. Dù
                          vậy, 95% nhà đầu tư Việt Nam thuộc nhóm nhà đầu tư nhỏ
                          lẻ với vốn kiến thức tài chính vô cùng hạn chế. Họ
                          tham gia vào thị trường chứng khoán với 100% ý chí và
                          sự quyết tâm chiến thắng thị trường, nhưng thật không
                          may mắn kết cục cuối cùng của họ luôn là sự thất bại
                          và mất tiền.
                        </span>
                        <div className="text-primary mb-4">
                          Tác giả: <span className="text-body">HappyLive</span>
                        </div>
                        <div className="mb-4 d-flex align-items-center">
                          <a
                            href="checkout.html"
                            className="btn btn-primary view-more mr-2"
                          >
                            Thêm vào giỏ hàng
                          </a>
                          <a
                            href="book-pdf.html"
                            className="btn btn-primary view-more mr-2"
                          >
                            Mua ngay
                          </a>
                        </div>
                        <div className="mb-3">
                          <a href="./" className="text-body text-center">
                            <span className="avatar-30 rounded-circle bg-primary d-inline-block mr-2">
                              <i className="ri-heart-fill" />
                            </span>
                            <span>Thêm vào danh sách yêu thích</span>
                          </a>
                        </div>
                        <div className="iq-social d-flex align-items-center">
                          <h5 className="mr-2">Chia sẻ:</h5>
                          <ul className="list-inline d-flex p-0 mb-0 align-items-center">
                            <li>
                              <a
                                href="./"
                                className="avatar-40 rounded-circle bg-primary mr-2 facebook"
                              >
                                <i
                                  className="fa fa-facebook"
                                  aria-hidden="true"
                                />
                              </a>
                            </li>
                            <li>
                              <a
                                href="./"
                                className="avatar-40 rounded-circle bg-primary mr-2 twitter"
                              >
                                <i
                                  className="fa fa-twitter"
                                  aria-hidden="true"
                                />
                              </a>
                            </li>
                            <li>
                              <a
                                href="./"
                                className="avatar-40 rounded-circle bg-primary mr-2 youtube"
                              >
                                <i
                                  className="fa fa-youtube-play"
                                  aria-hidden="true"
                                />
                              </a>
                            </li>
                            <li>
                              <a
                                href="./"
                                className="avatar-40 rounded-circle bg-primary pinterest"
                              >
                                <i
                                  className="fa fa-pinterest-p"
                                  aria-hidden="true"
                                />
                              </a>
                            </li>
                          </ul>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
}
export default Detail;
