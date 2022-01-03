import { Button, MenuItem, Select} from '@material-ui/core';
import axios from 'axios';
import React from 'react';
import { useHistory } from 'react-router-dom';
import Countries from '../CountryName/CountryData';
import "./specificdate.css";


const SpecificDateSearch = ({countryname, setCountryName, startdate, error, setError,
                            setStartdate, result, setResult}) => {

  const history= useHistory();
  const Home = () =>{
    history.push("/");
  }
  const handleSubmit = (e)=>{  
    e.preventDefault();
    setResult({});
    setError({});
    axios.get("/task12.pl?action=Particular date&country="+countryname+
    "&fromDate="+startdate+"&toDate="+startdate)
      .then(data => {
      setResult(data.data)
      });
    history.push("/result");
  }
  return (
    <div className="specific-date-main">
      <div>
        <Button variant="contained" color="secondary" onClick={Home}>
          HOME
        </Button>
      </div>
      <div className="specificdate">
        <span>Specific Date &nbsp; </span>
        <input type="date" onChange={(e) => setStartdate(e.target.value)} />
        &nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;
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
        &nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;
        <Button type="submit" 
          className="submit-button"
          variant="contained"
          color="primary" 
          size="large" onClick ={handleSubmit}>Submit</Button>
      </div>
    </div>
  )
}

export default SpecificDateSearch;
