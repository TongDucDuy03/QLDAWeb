import React from "react";

const Address = () => {
  const userId = localStorage.getItem("userId");
  return (
    <div id="content-page" className="content-page">
      <div className="container-fluid checkout-content">
        <div className="row">
          <div id="address" className="p-0 col-12">
            <div className="row align-item-center">
              <div className="col-lg-8">
                <div className="iq-card">
                  <div className="iq-card-header d-flex justify-content-between">
                    <div className="iq-header-title">
                      <h4 className="card-title">Thêm địa chỉ mới</h4>
                    </div>
                  </div>
                  <div className="iq-card-body">
                    <form onsubmit="required()">
                      <div className="row mt-3">
                        <div className="col-md-6">
                          <div className="form-group">
                            <label>Họ và tên: *</label>
                            <input
                              type="text"
                              className="form-control"
                              name="fname"
                              required=""
                            />
                          </div>
                        </div>
                        <div className="col-md-6">
                          <div className="form-group">
                            <label>Số điện thoại: *</label>
                            <input
                              type="text"
                              className="form-control"
                              name="mno"
                              required=""
                            />
                          </div>
                        </div>
                        <div className="col-md-6">
                          <div className="form-group">
                            <label>Địa chỉ: *</label>
                            <input
                              type="text"
                              className="form-control"
                              name="houseno"
                              required=""
                            />
                          </div>
                        </div>
                        <div className="col-md-6">
                          <div className="form-group">
                            <label>Tỉnh/thành phố: *</label>
                            <input
                              type="text"
                              className="form-control"
                              name="city"
                              required=""
                            />
                          </div>
                        </div>
                        <div className="col-md-6">
                          <div className="form-group">
                            <label>Phường: *</label>
                            <input
                              type="text"
                              className="form-control"
                              name="state"
                              required=""
                            />
                          </div>
                        </div>
                        <div className="col-md-6">
                          <div className="form-group">
                            <label htmlFor="addtype">Loại địa chỉ</label>
                            <select className="form-control" id="addtype">
                              <option>Nhà riêng</option>
                              <option>Công ty</option>
                            </select>
                          </div>
                        </div>
                        <div className="col-md-6">
                          <button
                            id="savenddeliver"
                            type="submit"
                            className="btn btn-primary"
                          >
                            Lưu và giao tại đây
                          </button>
                        </div>
                      </div>
                    </form>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
};

export default Address;
