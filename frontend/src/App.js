/* eslint-disable react/jsx-no-undef */
import "./App.css";
import Header from "./pages/Header";
import Index from "./pages/Index";
import Series11 from "./pages/Series/Series11";
import Series22 from "./pages/Series/Series22";
import { BrowserRouter as Router, Routes, Route } from "react-router-dom";
function App() {
  return (
    <>
      <Header></Header>
      <Router>
        <Routes>
          <Route path="/index" element={<Index />}></Route>
          <Route path="/series1" element={<Series11 />}></Route>
          <Route path="/series2" element={<Series22 />}></Route>
        </Routes>
      </Router>
    </>
  );
}

export default App;
