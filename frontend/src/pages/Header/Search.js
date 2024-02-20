import React, { useEffect, useState } from "react";
import axios from "axios";
import _ from "lodash";
import { debounce } from "lodash";

function Search() {
  const [listProducts, setListProducts] = useState([]);

  const getAllBooks = async () => {
    try {
      const response = await axios.get(`http://localhost:5168/api/Product`);
      console.log(response);
      return response.data;
    } catch (error) {
      console.log(error);
      return [];
    }
  };

  useEffect(() => {
    getAllBooks().then((images) => {
      setListProducts(images);
    });
  }, []);

  const handleSearch = debounce((event) => {
    let term = event.target.value.toLowerCase();
    if (term) {
      let cloneListProducts = _.cloneDeep(listProducts);
      cloneListProducts = cloneListProducts.filter((item) =>
        item.name.toLowerCase().includes(term)
      );
      console.log(cloneListProducts);
    } else {
      getAllBooks();
    }
  }, 500);

  const handleKeyDown = (event) => {
    if (event.key === "Enter") {
      handleSearch(event);
    }
  };

  return (
    <div className="iq-search-bar">
      <form action="./" className="searchbox">
        <input
          type="text"
          id="searchInput"
          className="text search-input"
          placeholder="Tìm kiếm sản phẩm..."
          onChange={(event) => handleSearch(event)}
          onKeyDown={handleKeyDown}
        />
        <a className="search-link" href="./Search/">
          <i className="ri-search-line" />
        </a>
      </form>
    </div>
  );
}

export default Search;
