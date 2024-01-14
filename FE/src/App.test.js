import { render, screen } from "@testing-library/react";
import App from "./App";
import About from "./pages/About";
test("renders learn react link", () => {
  render(<About />);
  const linkElement = screen.getByText(/learn react/i);
  expect(linkElement).toBeInTheDocument();
});
