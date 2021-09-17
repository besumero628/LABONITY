import React from 'react'
import ReactDOM from 'react-dom'
import PropTypes from 'prop-types'

var target_dom = null;


document.addEventListener('turbolinks:load', () => {
  target_dom = document.querySelector('#rss2');
  const url = new URL(location.href);
  let f = url.searchParams.get("name");
  if (f == null){ f = '';}
  getData(f);
});

function getData(f){
  let url = "/rsses/ajax2";
  if (f != ''){
    url += '?name=' + f;
  }
  fetch(url)
  .then(
    res => res.json(),
    (error) => {
      const el = (
        <p>ERROR!</p>
      );
      ReactDOM.render(el, target_dom);
    }
  )

  .then(
    (result) => {
      console.log(result)
      let arr = [];
      let headline = result.RDF.channel;
      for(let n in result.RDF.item){
        let data = result.RDF.item[n];
        arr.push(
          <tr key={data.title[0]}>
            <td className="small" width="20%">{data.date}</td>
            <td align="left"><a href={data.link}>{data.title[1]}</a></td>
          </tr>
        );
      }
      const el = (
        <table className="table mt-4">
          <tbody>{arr}</tbody>
        </table>
      );
      ReactDOM.render(el, target_dom);
    },
    (error) => {
      console.log(error);
      const el = (
        <p>ERROR!</p>
      );
      ReactDOM.render(el, target_dom);
    }
  );
}