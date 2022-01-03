import React from 'react'

const Result = ({error, result}) => {

  return (
    <div>
      <table className="table-content" frame="void" rules="rows" data-testid='table-data'> 
        <thead>
          <tr><th>Date</th>
            <th>Recovered</th>
            <th>Confirmed</th>
            <th>Deaths</th>
            <th>Active</th>
          </tr>
        </thead>
        {result.covid_data.map(report => {
          return (
            <tbody key={report.ID}>
              <tr>
                <td>{report.Date}</td>
                <td>{report.Recovered}</td>
                <td>{report.Confirmed}</td>
                <td>{report.Deaths}</td>
                <td>{report.Active}</td>
              </tr>
            </tbody>
          )
        })}
        </table>
      </div>
  )
};

export default Result;
