/* eslint-disable react/jsx-no-undef */
import "./App.css";
import Header from "./pages/Header/Header";
import Index from "./pages/Index";
import Cart from "./pages/Cart/Cart";
import Detail from "./pages/Detail/Detail";
import Signin from "./pages/Login/Signin";
import Signup from "./pages/Login/Signup";
import Profile from "./pages/profile/profile";
import { Routes, Route, Link } from "react-router-dom";
import Series from "./pages/Series/Series";

function App() {
  return (
    <>
<<<<<<< HEAD
      <Header />
      <Routes>
        <Route path="/index" element={<Index />}></Route>
        <Route path="/series/:id" element={<Series />}></Route>
        <Route path="/cart" element={<Cart />}></Route>
        <Route path="/detail/:id" element={<Detail />}></Route>
        <Route path="/signin" element={<Signin />}></Route>
        <Route path="/signup" element={<Signup />}></Route>
        <Route path="/profile" element={<Profile />}></Route>
      </Routes>
=======
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
>>>>>>> 5eaa3c803f4e7ee64ad05328ac538113ce2330a4
    </>
  );
}

export default App;
