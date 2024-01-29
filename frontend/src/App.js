/* eslint-disable react/jsx-no-undef */
import "./App.css";
import Header from "./pages/Header/Header";
import Index from "./pages/Index";
import Series1 from "./pages/Series/Series1";
import Series2 from "./pages/Series/Series2";
import Cart from "./pages/Cart/Cart";
import Detail from "./pages/Detail/Detail";
import Signin from "./pages/Login/Signin";
import Signup from "./pages/Login/Signup";
import Profile from "./pages/profile/profile";
import { BrowserRouter as Router, Routes, Route } from "react-router-dom";
function App() {
  return (
    <>
      <Header></Header>
      <Router>
        <Routes>
          <Route path="/index" element={<Index />}></Route>
          <Route path="/series1" element={<Series1 />}></Route>
          <Route path="/series2" element={<Series2 />}></Route>
          <Route path="/cart" element={<Cart />}></Route>
          <Route path="/detail" element={<Detail />}></Route>
          <Route path="/signin" element={<Signin />}></Route>
          <Route path="/signup" element={<Signup />}></Route>
          <Route path="/profile" element={<Profile />}></Route>
        </Routes>
      </Router>
    </>
  );
}

export default App;
