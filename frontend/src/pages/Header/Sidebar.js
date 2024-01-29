import React from "react";

function Sidebar() {
  return (
    <div className="iq-sidebar">
      <div className="iq-sidebar-logo d-flex justify-content-between">
        <a href="/index" className="header-logo">
          <img
            src="assets/images/logo.png"
            className="img-fluid rounded-normal"
            alt=""
          />
          <div className="logo-title">
            <span className="text-primary text-uppercase">Doraemon</span>
          </div>
        </a>
      </div>
      <div id="sidebar-scrollbar">
        <nav className="iq-sidebar-menu">
          <ul id="iq-sidebar-toggle" className="iq-menu">
            <li>
              <a href="/index">
                <i className="las la-home iq-arrow-left" />
                Trang chủ
              </a>
            </li>
            <li>
              <a href="/series1">
                <i className="lab la-elementor iq-arrow-left" />
                Truyện ngắn
              </a>
            </li>
            <li>
              <a href="/series2">
                <i className="lab la-elementor iq-arrow-left" />
                Truyện dài
              </a>
            </li>
          </ul>
        </nav>
      </div>
    </div>
  );
}
export default Sidebar;
