import React from 'react';
import {Button} from '@material-ui/core';
import "./SearchButton.css";
import { useHistory } from 'react-router-dom';

const SearchButton = () => {

  const history = useHistory();
  
  const DateRangeFetch =()=>{
    history.push("/dateRangeSearch");
  }
  const SpecificDateFetch =()=>{
    history.push("/specificDateSearch");
  }
  return (
    <div className="container">
      <div className="column-left">
        <Button variant="contained" color="primary" onClick ={DateRangeFetch}>
          Date Range
        </Button>
      </div>
      <div className="column-right">
        <Button variant="contained" color="primary" onClick ={SpecificDateFetch}>
          Specific Date
        </Button>
      </div>
    </div>
  )
}

export default SearchButton;
