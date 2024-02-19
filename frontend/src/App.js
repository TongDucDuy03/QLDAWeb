/* eslint-disable react/jsx-no-undef */
import "./App.css";
import Header from "./pages/Header/Header";
import Index from "./pages/Index";
import Cart from "./pages/Cart/Cart";
import Detail from "./pages/Detail/Detail";
import Signin from "./pages/Login/Signin";
import Signup from "./pages/Login/Signup";
import Profile from "./pages/profile/profile";
import { BrowserRouter as Router, Routes, Route } from "react-router-dom";
import Series from "./pages/Series/Series";
function App() {
  return (
    <>
      <Header></Header>
      <Router>
        <Routes>
          <Route path="/index" element={<Index />}></Route>
          <Route path="/series/:id" element={<Series />}></Route>
          <Route path="/cart/:id" element={<Cart />}></Route>
          <Route path="/detail/:id" element={<Detail />}></Route>
          <Route path="/signin" element={<Signin />}></Route>
          <Route path="/signup" element={<Signup />}></Route>
          <Route path="/profile" element={<Profile />}></Route>
        </Routes>
      </Router>
    </>
  );
}

export default App;
