/* eslint-disable react/jsx-no-undef */
import "./App.css";
import Header from "./pages/Header/Header";
import Index from "./pages/Index";
import Cart from "./pages/Cart/Cart";
import Bill from "./pages/Bill/Bill";
import Detail from "./pages/Detail/Detail";
import Signin from "./pages/Login/Signin";
import Signup from "./pages/Login/Signup";
import Profile from "./pages/profile/profile";
import { Routes, Route, Link } from "react-router-dom";
import Series from "./pages/Series/Series";

function App() {
  return (
    <>
      <Header />
      <Routes>
        <Route path="/index" element={<Index />}></Route>
        <Route path="/series/:id" element={<Series />}></Route>
        <Route path="/cart/:id" element={<Cart />}></Route>
        <Route path="/bill/:id" element={<Bill />}></Route>
        <Route path="/detail/:id" element={<Detail />}></Route>
        <Route path="/signin" element={<Signin />}></Route>
        <Route path="/signup" element={<Signup />}></Route>
        <Route path="/profile" element={<Profile />}></Route>
      </Routes>
    </>
  );
}

export default App;
