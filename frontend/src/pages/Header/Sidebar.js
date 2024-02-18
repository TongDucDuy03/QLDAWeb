import React, { useEffect, useState } from "react";
import axios from "axios";

const getAllSeries = async (id) => {
  try {
    const response = await axios.get(
      `http://localhost:5168/api/Series`
    );
    return response.data;
  } catch (error) {
    console.log(error);
  }
};

function Sidebar() {
  const [seriesList, setSeries] = useState([]);
  useEffect(() => {
    getAllSeries().then((seriess) => {
      setSeries(seriess);
    })
  }, []);

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
              <a href="#series" class="iq-waves-effect collapsed" data-toggle="collapse" aria-expanded="false">
                <i class="lab la-elementor iq-arrow-left"></i><span>Series</span>
                <i class="ri-arrow-right-s-line iq-arrow-right"></i>
              </a>

              <ul id="series" class="iq-submenu collapse" data-parent="#iq-sidebar-toggle">
                {
                  seriesList.length > 0 &&
                  seriesList.map((item, index) => (
                    <li>
                      <a href={`/series/${item.series_Id}`}>
                        <span>{item.series_Name}</span>
                      </a>
                    </li>
                  ))
                }
              </ul>
            </li>
          </ul>
        </nav>
      </div>
    </div>
  );
}
export default Sidebar;
