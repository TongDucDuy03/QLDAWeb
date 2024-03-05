import React, { useState } from "react";
import axios from "axios";

function Signup() {
  const [userName, setUsername] = useState("");
  const [password, setPassword] = useState("");
  const [error, setError] = useState("");

  const handleSignup = async (event) => {

    try {
      const response = await axios.post("http://localhost:5168/api/Account/register", {
        userName: userName,
        password: password
      });

      window.location.href='/signin'
      console.log('abc');
    } catch (error) {
      console.error("Đăng ký thất bại:", error);
      setError("Đăng ký thất bại. Vui lòng thử lại sau.");
    }
  };

  return (
    <div>
      <section className="sign-in-page">
        <div className="container p-0">
          <div className="row no-gutters height-self-center">
            <div className="col-sm-12 align-self-center page-content rounded">
              <div className="row m-0">
                <div className="col-sm-12 sign-in-page-data">
                  <div className="sign-in-from bg-primary rounded">
                    <h3 className="mb-0 text-center text-white">Sign Up</h3>
                    <p className="text-center text-white">
                      Enter your username and password to sign up.
                    </p>
                    {error && <div className="alert alert-danger">{error}</div>}
                    <form className="mt-4 form-text" onSubmit={handleSignup}>
                      <div className="form-group">
                        <label htmlFor="exampleInputUsername">Username</label>
                        <input
                          type="text"
                          className="form-control mb-0"
                          id="exampleInputUsername"
                          placeholder="Enter username"
                          value={userName}
                          onChange={(e) => setUsername(e.target.value)}
                        />
                      </div>
                      <div className="form-group">
                        <label htmlFor="exampleInputPassword">Password</label>
                        <input
                          type="password"
                          className="form-control mb-0"
                          id="exampleInputPassword"
                          placeholder="Password"
                          value={password}
                          onChange={(e) => setPassword(e.target.value)}
                        />
                      </div>
                      <div className="d-inline-block w-100">
                        <div className="custom-control custom-checkbox d-inline-block mt-2 pt-1">
                          <input
                            type="checkbox"
                            className="custom-control-input"
                            id="customCheck1"
                          />
                          <label
                            className="custom-control-label"
                            htmlFor="customCheck1"
                          >
                            I accept{" "}
                            <a href="./" className="text-light">
                              Terms and Conditions
                            </a>
                          </label>
                        </div>
                      </div>
                      <div className="sign-info text-center">
                        <button
                          type="submit"
                          className="btn btn-white d-block w-100 mb-2"
                        >
                          Sign Up
                        </button>
                        <span className="text-dark d-inline-block line-height-2">
                          Already Have Account ?{" "}
                          <a href="/signin" className="text-white">
                            Log In
                          </a>
                        </span>
                      </div>
                    </form>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>
    </div>
  );
}

export default Signup;
