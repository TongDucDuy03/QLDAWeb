import React, { useEffect, useState } from "react";
import { useParams } from "react-router-dom";
import axios from "axios";
const getBooks = async (content) => {
    try {
      const response = await axios.get(
        `http://localhost:5168/api/Product/search/${content}`
      );
      return response.data;
    } catch (error) {
      console.log(error);
    }
  };

  const Series1 = () => {
    const params = useParams();
    console.log(params);
    const [randomBooks, setBooks] = useState([]);
  
    useEffect(() => {
        getBooks(params.id).then((images) => {
        console.log(images);
        setBooks(images);
      });
    }, []);
}