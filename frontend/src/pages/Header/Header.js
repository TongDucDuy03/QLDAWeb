import React, { useEffect, useState } from "react";
import axios from "axios";
import _ from "lodash";
import { debounce } from "lodash";
import Sidebar from "./Sidebar";
import Vsearch from "../../Search/Vsearch";
import { jwtDecode } from "jwt-decode";

const jwtToken = localStorage.getItem("jwtToken");
const decodedToken = jwtDecode(jwtToken);
const userId = decodedToken.Id;

localStorage.setItem("userId", userId);
console.log(decodedToken);

function Header() {
  const [listProducts, setListProducts] = useState([]);
  const [listBooks, setListBooks] = useState([]);
  const [searchTerm, setSearchTerm] = useState("");
  const getAllBooks = async () => {
    try {
      const response = await axios.get(`http://localhost:5168/api/Product`);
      console.log(response);
      return response.data;
    } catch (error) {
      console.log(error);
      return [];
    }
  };

  useEffect(() => {
    getAllBooks().then((images) => {
      setListProducts(images);
    });
  }, []);

  const handleKeyDown = (event) => {
    if (event.key === "Enter") {
      event.preventDefault();
      handleSearch(event);
    }
  };

  const handleSearch = debounce((event) => {
    let term = event.target.value.toLowerCase();
    setSearchTerm(term);
    if (term) {
      let cloneListProducts = _.cloneDeep(listProducts);
      cloneListProducts = cloneListProducts.filter((item) =>
        item.name.toLowerCase().includes(term)
      );
      setListBooks(cloneListProducts);
    } else {
      getAllBooks().then((images) => setListProducts(images));
    }
  }, 100);

  return (
    <>
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
                    id="searchInput"
                    className="text search-input"
                    placeholder="Tìm kiếm sản phẩm..."
                    onKeyDown={handleKeyDown}
                  />
                  <a className="search-link" href="./Search/">
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
                  <li className="nav-item nav-icon">
                    <a
                      href={`/Cart/${decodedToken.Id}`}
                      className="search-toggle iq-waves-effect text-gray rounded"
                    >
                      <i className="ri-shopping-cart-2-line" />
                    </a>
                  </li>
                  <li className="line-height pt-3">
                    <a
                      href="./"
                      className="search-toggle iq-waves-effect d-flex align-items-center"
                    >
                      <img
                        src="https://i.pinimg.com/736x/fb/13/cf/fb13cf0345453e125a4c81514ffab015.jpg"
                        className="img-fluid rounded-circle mr-3"
                        alt="user"
                      />
                      <div className="caption">
                        <h6 className="mb-1 line-height">
                          {decodedToken.UserName}
                        </h6>
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
                            href={`/Cart/${decodedToken.Id}`}
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
      {searchTerm && <Vsearch listBooks={listBooks} />}
    </>
  );
}
export default Header;
