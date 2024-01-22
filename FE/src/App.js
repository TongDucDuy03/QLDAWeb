/* eslint-disable react/jsx-no-undef */
/* eslint-disable no-undef */
/* eslint-disable jsx-a11y/img-redundant-alt */
import "./App.css";
import Index from "./pages/Index/Index";
import Index2 from "./pages/Index/Index2";
import Header from "./pages/Header/Header";
import Login from "./pages/Login/Login";
import { BrowserRouter as Router, Routes, Route } from "react-router-dom";
function App() {
  return (
    <div>
      <Header />
      <Router>
        <Routes>
          <Route path="/index" element={<Index />}></Route>
          <Route path="/index2" element={<Index2 />}></Route>
          <Route path="/login" element={<Login />}></Route>
        </Routes>
      </Router>
    </div>
  );
}
export default App;
