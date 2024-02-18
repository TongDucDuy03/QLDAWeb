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
              <a href="/index" class="iq-waves-effect collapsed" data-toggle="collapse" aria-expanded="false">
                <i className="las la-home iq-arrow-left" />
                Trang chủ
              </a>
            </li>
            <li>
              <a href="#ui-elements" class="iq-waves-effect collapsed" data-toggle="collapse" aria-expanded="false">
                <i class="lab la-elementor iq-arrow-left"></i><span>Series</span>
                <i class="ri-arrow-right-s-line iq-arrow-right"></i>
              </a>

              <ul id="ui-elements" class="iq-submenu collapse" data-parent="#iq-sidebar-toggle">
                {
                  seriesList.length > 0 &&
                  seriesList.map((item, index) => (
                    <li class="elements">
                      <a href={`/series/${item.series_Id}`} class="iq-waves-effect collapsed" data-toggle="collapse" aria-expanded="false">
                        <i class="ri-play-circle-line"></i>
                        <span>{item.series_Name}</span>
                        <i class="ri-arrow-right-s-line iq-arrow-right"></i>
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
