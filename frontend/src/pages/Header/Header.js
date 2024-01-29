import React from "react";
import Sidebar from "./Sidebar";
function Header() {
  return (
    <div className="wrapper">
      <Sidebar />
      <div className="iq-top-navbar">
        <div className="iq-navbar-custom">
          <nav className="navbar navbar-expand-lg navbar-light p-0">
            <div className="iq-menu-bt d-flex align-items-center">
              <div className="wrapper-menu">
                <div className="main-circle">
                  <i className="las la-bars" />
                </div>
              </div>
              <div className="iq-navbar-logo d-flex justify-content-between">
                <a href="index.html" className="header-logo">
                  <img
                    src="assets/images/logo.png"
                    className="img-fluid rounded-normal"
                    alt=""
                  />
                  <div className="logo-title">
                    <span className="text-primary text-uppercase">img01</span>
                  </div>
                </a>
              </div>
            </div>
            <div className="navbar-breadcrumb">
              <h5 className="mb-0">Trang Chủ</h5>
            </div>
            <div className="iq-search-bar">
              <form action="./" className="searchbox">
                <input
                  type="text"
                  className="text search-input"
                  placeholder="Tìm kiếm sản phẩm..."
                />
                <a className="search-link" href="./">
                  <i className="ri-search-line" />
                </a>
              </form>
            </div>
            <button
              className="navbar-toggler"
              type="button"
              data-toggle="collapse"
              data-target="./navbarSupportedContent"
              aria-controls="navbarSupportedContent"
              aria-label="Toggle navigation"
            >
              <i className="ri-menu-3-line" />
            </button>
            <div
              className="collapse navbar-collapse"
              id="navbarSupportedContent"
            >
              <ul className="navbar-nav ml-auto navbar-list">
                <li className="nav-item nav-icon search-content">
                  <a
                    href="./"
                    className="search-toggle iq-waves-effect text-gray rounded"
                  >
                    <i className="ri-search-line" />
                  </a>
                  <form action="./" className="search-box p-0">
                    <input
                      type="text"
                      className="text search-input"
                      placeholder="Type here to search..."
                    />
                    <a className="search-link" href="./">
                      <i className="ri-search-line" />
                    </a>
                  </form>
                </li>
                <li className="nav-item nav-icon dropdown">
                  <a
                    href="./"
                    className="search-toggle iq-waves-effect text-gray rounded"
                  >
                    <i className="ri-shopping-cart-2-line" />
                    <span className="badge badge-danger count-cart rounded-circle">
                      2
                    </span>
                  </a>
                  <div className="iq-sub-dropdown">
                    <div className="iq-card shadow-none m-0">
                      <div className="iq-card-body p-0 toggle-cart-info">
                        <div className="bg-primary p-3">
                          <h5 className="mb-0 text-white">
                            Giỏ Hàng
                            <small className="badge  badge-light float-right pt-1">
                              2
                            </small>
                          </h5>
                        </div>
                        <a href="./" className="iq-sub-card">
                          <div className="media align-items-center">
                            <div className="">
                              <img
                                className="rounded"
                                src="assets/images/cart/01.jpg"
                                alt=""
                              />
                            </div>
                            <div className="media-body ml-3">
                              <h6 className="mb-0 ">Night People book</h6>
                              <p className="mb-0">$32</p>
                            </div>
                            <div className="float-right font-size-24 text-danger">
                              <i className="ri-close-fill" />
                            </div>
                          </div>
                        </a>
                        <div className="d-flex align-items-center text-center p-3">
                          <a
                            className="btn btn-primary iq-sign-btn"
                            href="/cart"
                            role="button"
                          >
                            Thanh Toán
                          </a>
                        </div>
                      </div>
                    </div>
                  </div>
                </li>
                <li className="line-height pt-3">
                  <a
                    href="./"
                    className="search-toggle iq-waves-effect d-flex align-items-center"
                  >
                    <img
                      src="assets/images/user/1.jpg"
                      className="img-fluid rounded-circle mr-3"
                      alt="user"
                    />
                    <div className="caption">
                      <h6 className="mb-1 line-height">Ông Trần Thuận</h6>
                      <p className="mb-0 text-primary">Tài Khoản</p>
                    </div>
                  </a>
                  <div className="iq-sub-dropdown iq-user-dropdown">
                    <div className="iq-card shadow-none m-0">
                      <div className="iq-card-body p-0 ">
                        <div className="bg-primary p-3">
                          <h5 className="mb-0 text-white line-height">
                            Xin Chào
                          </h5>
                        </div>
                        <a
                          href="/profile"
                          className="iq-sub-card iq-bg-primary-hover"
                        >
                          <div className="media align-items-center">
                            <div className="rounded iq-card-icon iq-bg-primary">
                              <i className="ri-file-user-line" />
                            </div>
                            <div className="media-body ml-3">
                              <h6 className="mb-0 ">Thông tin cá nhân</h6>
                            </div>
                          </div>
                        </a>
                        <a
                          href="profile-edit.html"
                          className="iq-sub-card iq-bg-primary-hover"
                        >
                          <div className="media align-items-center">
                            <div className="rounded iq-card-icon iq-bg-primary">
                              <i className="ri-profile-line" />
                            </div>
                            <div className="media-body ml-3">
                              <h6 className="mb-0 ">Sổ địa chỉ</h6>
                            </div>
                          </div>
                        </a>
                        <a
                          href="./"
                          className="iq-sub-card iq-bg-primary-hover"
                        >
                          <div className="media align-items-center">
                            <div className="rounded iq-card-icon iq-bg-primary">
                              <i className="ri-account-box-line" />
                            </div>
                            <div className="media-body ml-3">
                              <h6 className="mb-0 ">Đơn hàng của tôi</h6>
                            </div>
                          </div>
                        </a>
                        <a
                          href="./"
                          className="iq-sub-card iq-bg-primary-hover"
                        >
                          <div className="media align-items-center">
                            <div className="rounded iq-card-icon iq-bg-primary">
                              <i className="ri-heart-line" />
                            </div>
                            <div className="media-body ml-3">
                              <h6 className="mb-0 ">Yêu Thích</h6>
                            </div>
                          </div>
                        </a>
                        <div className="d-inline-block w-100 text-center p-3">
                          <a
                            className="bg-primary iq-sign-btn"
                            href="/signin"
                            role="button"
                          >
                            Sign out
                            <i className="ri-login-box-line ml-2" />
                          </a>
                        </div>
                      </div>
                    </div>
                  </div>
                </li>
              </ul>
            </div>
          </nav>
        </div>
      </div>
    </div>
  );
}
export default Header;