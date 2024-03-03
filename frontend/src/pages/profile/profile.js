import React, { useEffect, useState } from "react";
import axios from "axios";

function Profile() {
    const userId = localStorage.getItem("userId");
    const [user, setUser] = useState(null);

    const getUserInfo = async (userId) => {
        try {
            const response = await axios.get(`http://localhost:5168/api/User/${userId}`);
            return response.data;
        } catch (error) {
            console.log(error);
        }
    };

    useEffect(() => {
        if (userId) {
            getUserInfo(userId).then((userData) => {
                setUser(userData);
            });
        }
    }, [userId]);

    return (
        <div id="content-page" className="content-page">
            <div className="container-fluid">
                <div className="row">
                    <div className="col-lg-12">
                        <div className="iq-card">
                            <div className="iq-card-body p-0">
                                <div className="iq-edit-list">
                                    <ul className="iq-edit-profile d-flex nav nav-pills">
                                        <li className="col-md-3 p-0">
                                            <a className="nav-link active" data-toggle="pill" href="#personal-information">
                                                Thông tin cá nhân
                                            </a>
                                        </li>
                                        {/* Các tab khác */}
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div className="col-lg-12">
                        <div className="iq-edit-list-data">
                            <div className="tab-content">
                                <div className="tab-pane fade active show" id="personal-information" role="tabpanel">
                                    <div className="iq-card">
                                        <div className="iq-card-header d-flex justify-content-between">
                                            <div className="iq-header-title">
                                                <h4 className="card-title">Thông tin cá nhân</h4>
                                            </div>
                                        </div>
                                        <div className="iq-card-body">
                                            {user && (
                                                <form>
                                                    <div className="form-group row align-items-center">
                                                        <div className="col-md-6">
                                                            <label htmlFor="fname">First Name:</label>
                                                            <input
                                                                type="text"
                                                                className="form-control"
                                                                id="fname"
                                                                defaultValue={user.firstName}
                                                                readOnly
                                                            />
                                                        </div>
                                                        <div className="col-md-6">
                                                            <label htmlFor="lname">Last Name:</label>
                                                            <input
                                                                type="text"
                                                                className="form-control"
                                                                id="lname"
                                                                defaultValue={user.lastName}
                                                                readOnly
                                                            />
                                                        </div>
                                                            <div className="col-md-6">
                                                                <label htmlFor="uname">Tên tài khoản:</label>
                                                                <input
                                                                    type="text"
                                                                    className="form-control"
                                                                    id="uname"
                                                                    defaultValue={user.userName}
                                                                    readOnly
                                                                />
                                                            </div>
                                                            <div className="col-md-6">
                                                                <label htmlFor="userEmail">Email:</label>
                                                                <input
                                                                    type="email"
                                                                    className="form-control"
                                                                    id="userEmail"
                                                                    defaultValue={user.userEmail || ''}
                                                                    readOnly
                                                                />
                                                            </div>
                                                            <div className="col-md-6">
                                                                <label htmlFor="phone">Số điện thoại:</label>
                                                                <input
                                                                    type="text"
                                                                    className="form-control"
                                                                    id="phone"
                                                                    defaultValue={user.phone || ''}
                                                                    readOnly
                                                                />
                                                            </div>
                                                            <div className="col-md-6">
                                                                <label htmlFor="address">Địa chỉ:</label>
                                                                <input
                                                                    type="text"
                                                                    className="form-control"
                                                                    id="address"
                                                                    defaultValue={user.address || ''}
                                                                    readOnly
                                                                />
                                                            </div>
                                                            <div className="col-md-6">
                                                                <label htmlFor="status">Trạng thái:</label>
                                                                <input
                                                                    type="text"
                                                                    className="form-control"
                                                                    id="status"
                                                                    defaultValue={user.status === 1 ? 'Active' : 'Inactive'}
                                                                    readOnly
                                                                />
                                                            </div>
                                                            {/* <div className="col-md-6">
                                                            <div className="custom-control custom-checkbox mt-2">
                                                            <input
                                                                type="checkbox"
                                                                className="custom-control-input"
                                                                id="status"
                                                                defaultChecked={user.status === 1}
                                                                disabled
                                                            />
                                                            <label
                                                                className="custom-control-label"
                                                                htmlFor="status"
                                                            >
                                                                Active
                                                            </label>
                                                            </div>
                                                        </div> */}

                                                    </div>
                                                    <button type="submit" className="btn btn-primary mr-2">
                                                        Gửi
                                                    </button>
                                                    <button type="reset" className="btn iq-bg-danger">
                                                        Hủy bỏ
                                                    </button>
                                                </form>
                                            )}
                                        </div>
                                    </div>
                                </div>
                                {/* Các tab khác */}
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    );
}

export default Profile;
