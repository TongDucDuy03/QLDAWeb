import React, { useState } from "react";
import axios from "axios";
import { Alert } from "react-bootstrap";

const Signin = () => {
  const [UserName, setEmail] = useState("");
  const [password, setPassword] = useState("");
  const [showError, setShowError] = useState(false);
  const [errorMessage, setErrorMessage] = useState("");

  const handleLogin = async () => {
    if (!UserName || !password) {
      setErrorMessage("Email/Password is required");
      setShowError(true);
      return;
    }
    try {
      const response = await axios.post("http://localhost:5168/api/Account/Login", { UserName, password });
      if (response.data.success) {
        localStorage.setItem("jwtToken", response.data.data);
        window.location.href = '/index';     
      } else {
        setErrorMessage("Login failed. Please try again.");
        setShowError(true);
      }
    } catch (error) {
      console.error("Login error:", error);
      setErrorMessage("Login failed. Please try again.");
      setShowError(true);
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
                    <h3 className="mb-0 text-center text-white">Sign in</h3>
                    <p className="text-center text-white">
                      Enter your UserName and password to access admin panel.
                    </p>
                    <form className="mt-4 form-text">
                      <div className="form-group">
                        <label htmlFor="exampleInputEmail1">UserName</label>
                        <input
                          type="text"
                          className="form-control mb-0"
                          id="exampleInputUserName1"
                          placeholder="Enter UserName"
                          onChange={(event) => setEmail(event.target.value)}
                        />
                      </div>
                      <div className="form-group">
                        <label htmlFor="exampleInputPassword1">Password</label>
                        <a href="./" className="float-right text-dark">
                          Forgot password?
                        </a>
                        <input
                          type="password"
                          className="form-control mb-0"
                          id="exampleInputPassword1"
                          placeholder="Password"
                          onChange={(event) => setPassword(event.target.value)}
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
                            Remember Me
                          </label>
                        </div>
                      </div>
                      <div className="sign-info text-center">
                        <button
                          type="button"
                          className="btn btn-white d-block w-100 mb-2"
                          onClick={() => handleLogin()}
                        >
                          Sign in
                        </button>
                        <span className="text-dark dark-color d-inline-block line-height-2">
                          Don't have an account?{" "}
                          <a href="/signup" className="text-white">
                            Sign up
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
      <div style={{ position: 'fixed', bottom: '10px', right: '10px', zIndex: 9999 }}>
        <Alert variant="danger" show={showError} onClose={() => setShowError(false)} dismissible>
          <Alert.Heading>Error</Alert.Heading>
          <p>{errorMessage}</p>
        </Alert>
      </div>
    </div>
  );
};

export default Signin;
