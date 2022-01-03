import { Button, Select, MenuItem} from '@material-ui/core';
import React from 'react';
import {useHistory } from 'react-router-dom';
import Countries from '../CountryName/CountryData';
import axios from 'axios';
import "./DateRangeSearch.css";

const DateRangeSearch = ({countryname, setCountryName, startdate, error, setError,
                          setStartdate, enddate, setEnddate, result, setResult}) => {

  const history= useHistory();

  const handleSubmit =(e) =>{
    e.preventDefault();
    setResult({});
    setError({});
    axios.get("/task12.pl?action=Date range&country="+countryname+
    "&fromDate="+startdate+"&toDate="+enddate)
    .then(coviddata => {
    setResult(coviddata.data)
    });
    // history.push("/result");
  }

  const Home = () =>{
    history.push("/");
  }

  return (
    <div className="main">
      <div>
        <Button variant="contained" color="secondary" onClick={Home}>
          HOME
        </Button>
      </div>
      <div className="form">
        <span>Start Range</span>&nbsp;&nbsp;
        <input type="date" name="start_date" onChange={(e) => setStartdate(e.target.value)}/>
        &nbsp;&nbsp;
        <span>End Range</span>&nbsp;&nbsp;
        <input type="date" name="end_date" onChange={(e) => setEnddate(e.target.value)}/>
        &nbsp;&nbsp;&nbsp;&nbsp;
        <span>Country &nbsp; &nbsp;</span>
        <Select
          labelId="demo-simple-select-label"
          id="demo-simple-select"
          value={countryname}
          onChange={(e) => setCountryName(e.target.value)}
        >
          {
            Countries.map((c)=>(
              <MenuItem key={c.Country} value={c.Slug} >
                {c.Country}
              </MenuItem>
            ))
          }
        </Select>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <Button type="submit" 
          className= "submit-button"
          variant="contained"
          color="primary"  
          size="large" onClick ={handleSubmit}>Submit</Button>
      </div>
    </div>
  )
};

export default DateRangeSearch;
