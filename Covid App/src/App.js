import React, { useState } from 'react';
import "./App.css";
import Header from './component/Header/Header';
import {BrowserRouter, Route, Switch} from 'react-router-dom';
import SearchButton from './component/SearchButton/SearchButton';
import DateRangeSearch from './component/DateRangeSearch/DateRangeSearch';
import SpecificDateSearch from './component/SpecificDateSearch/SpecificDateSearch';
import Result from './component/DisplayResult/Result';


const CovidApp = () => {
  const [countryname, setCountryName] = useState('');
  const [result, setResult] = useState({});
  const [startdate, setStartdate] = useState(null);
  const [enddate, setEnddate] = useState(null);
  const [error, setError] = useState({});

  return (
    <BrowserRouter>
      <div className="content">
        <Header />
        <SearchButton />
      </div>
      <Switch>
        <Route path="/specificDateSearch" exact>
          <SpecificDateSearch countryname={countryname} setCountryName={setCountryName}
          startdate={startdate} setStartdate={setStartdate} 
          error={error} setError={setError}
          result={result} setResult= {setResult}/>
        </Route>
        <Route path="/dateRangeSearch" exact>
          <DateRangeSearch countryname={countryname} setCountryName={setCountryName}
          error={error} setError={setError}
          enddate={enddate} setEnddate={setEnddate}
          startdate={startdate} setStartdate={setStartdate}
          result={result} setResult= {setResult}/>
        </Route>
        <Route path= "/result" exact>
          <Result result={result} setResult= {setResult}
          error={error} setError={setError}/>
        </Route>
      </Switch>
    </BrowserRouter>
  )
}

export default CovidApp;
