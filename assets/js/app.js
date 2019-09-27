import css from "../css/app.scss";

// webpack automatically bundles all modules in your
// entry points. Those entry points can be configured
// in "webpack.config.js".
//
// Import dependencies
//
import "phoenix_html";

// Import local files
//
// Local files can be imported directly using relative paths, for example:
// import socket from "./socket"

import M from "materialize-css";

document.addEventListener("DOMContentLoaded", function() {
  M.AutoInit();
  // const elems = document.querySelectorAll(".sidenav");
  // const instances = M.Sidenav.init(elems);
  // console.log({ instances });

  // const menuButton = document.querySelector("#menu-button");
  // menuButton.addEventListener("click", () => {
  //   if (instances.length > 0) {
  //     instances[0].open();
  //   }
  // });
});
