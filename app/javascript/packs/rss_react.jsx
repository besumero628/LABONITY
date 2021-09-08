import React from 'react'
import ReactDOM from 'react-dom'
import PropTypes from 'prop-types'

var target_dom = null;

document.addEventListener('DOMContentLoaded', () => {
  target_dom = document.querySelector('#rss');
  const url = new URL(location.href);
  let f = url.searchParams.get("name");
  if (f == null){ f = '';}
  getData(f);
});

function getData(f){
  let url = "/top/ajax";
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
          <tr>
            <th><a href={data.link}>{data.title}</a></th>
            <td class="small">{data.date}</td>
          </tr>
        );
      }
      const el = (
        <table class="table mt-4">
          <thead class="thead-dark">
            <tr><th><a href={headline.link}>{headline.title}</a></th>
            <th>Date</th></tr>
          </thead>
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